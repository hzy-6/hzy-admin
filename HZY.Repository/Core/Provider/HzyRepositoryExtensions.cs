using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using HZY.Repository.Core.Impl;
using HZY.Repository.Core.Interface;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace HZY.Repository.Core.Provider
{
    public static class HzyRepositoryExtensions
    {
        public static void RegisterRepository(this IServiceCollection services, string connectionString)
        {
            services.AddDbContext<AppDbContext>(options =>
            {
                options
                    .UseSqlServer(connectionString)
                    .UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()))
                    ;
                //无跟踪
                // options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
            });

            //services.AddIdentity<ApplicationUser, IdentityRole>()
            //    .AddEntityFrameworkStores<ApplicationDbContext>()
            //    .AddDefaultTokenProviders();

            services.AddSingleton<IUnitOfWork, UnitOfWorkImpl>();
            services.AddScoped(typeof(AppRepository<>));
        }

        /// <summary>
        /// 获取 PropertyInfo 集合
        /// </summary>
        /// <param name="type"></param>
        /// <param name="bindingFlags"></param>
        /// <returns></returns>
        public static PropertyInfo[] GetPropertyInfos(this Type type,
            BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public)
            => type.GetProperties(bindingFlags);

        /// <summary>
        /// 创建 对象实例
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T CreateInstance<T>()
        {
            var type = typeof(T);
            if (type.IsValueType || typeof(T) == typeof(string))
                return default;
            return (T) Activator.CreateInstance(type);
        }

        /// <summary>
        /// 获取 对象 中 某个属性得 标记
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public static T GetAttribute<T>(this Type type, string name)
            where T : Attribute
            => GetPropertyInfo(type, name).GetCustomAttribute(typeof(T)) as T;

        /// <summary>
        /// 获取 PropertyInfo 对象
        /// </summary>
        /// <param name="type"></param>
        /// <param name="name"></param>
        /// <returns></returns>
        public static PropertyInfo GetPropertyInfo(this Type type, string name) => type.GetProperty(name);

        /// <summary>
        /// 获取 模型 有 Key 特性得 属性对象
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static PropertyInfo GetKeyProperty(this Type type)
        {
            //(KeyAttribute)Attribute.GetCustomAttributes(type, true).Where(item => item is KeyAttribute).FirstOrDefault();

            var propertyInfo = GetPropertyInfos(type)
                .FirstOrDefault(item => item.GetCustomAttribute(typeof(KeyAttribute)) != null);

            if (propertyInfo == null) throw new Exception("模型未设置主键特性标记!");

            return propertyInfo;
        }

        /// <summary>
        /// 是否有 KeyAttribute 标记
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static bool HasKey(PropertyInfo propertyInfo)
            => propertyInfo.GetCustomAttribute(typeof(KeyAttribute)) != null;

        /// <summary>
        /// 生成表达式树 例如：( w=> new [] {1,2,3}.Contains(w.Key) )
        /// </summary>
        /// <param name="name"></param>
        /// <param name="values"></param>
        /// <param name="expName"></param>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> CreateContainsExpression<T, TKey>(string name, IEnumerable<TKey> values,
            string expName = "w")
        {
            var type = typeof(T);
            var parameter = Expression.Parameter(type, expName);

            var valuesParameter = Expression.Constant(values.ToList(), typeof(List<TKey>));
            var memberExpression = Expression.Property(parameter, name);
            var nameParameter = Expression.Convert(memberExpression, typeof(TKey));
            var body = Expression.Call(valuesParameter, "Contains", Array.Empty<Type>(), nameParameter);

            return Expression.Lambda<Func<T, bool>>(body, parameter);
        }

        /// <summary>
        /// 生成表达式树 例如：( w=> new [] {1,2,3}.Contains(w.Key) )
        /// </summary>
        /// <param name="name"></param>
        /// <param name="values"></param>
        /// <param name="expName"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> CreateContainsExpression<T>(string name, IEnumerable<object> values,
            string expName = "w")
            => CreateContainsExpression<T, object>(name, values, expName);

        /// <summary>
        /// 生成表达式树 例如：( w=>w.Key==Guid.Empty )
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="expName"></param>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> CreateEqualExpression<T, TKey>(string name, TKey value,
            string expName = "w")
        {
            //创建 Where Lambda表达式树
            var type = typeof(T);
            var parameter = Expression.Parameter(type, expName);

            var propertyParameter = Expression.Property(parameter, name);
            var nameParameter = Expression.Convert(propertyParameter, typeof(TKey));
            var valueParameter = Expression.Constant(value, typeof(TKey));

            var body = Expression.Equal(nameParameter, valueParameter);
            return Expression.Lambda<Func<T, bool>>(body, parameter);
        }

        /// <summary>
        /// 生成表达式树 例如：( w=>w.Key==Guid.Empty )
        /// </summary>
        /// <param name="name"></param>
        /// <param name="value"></param>
        /// <param name="expName"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> CreateEqualExpression<T>(string name, object value,
            string expName = "w")
            => CreateEqualExpression<T, object>(name, value, expName);

        /// <summary>
        /// 获取 Expression {Func{T, T}} 树结构 Lambda => | w => new User{ Name="hzy" }
        /// </summary>
        /// <param name="model"></param>
        /// <param name="expName"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, T>> CreateMemberInitByModel<T>(this T model, string expName = "w")
            where T : class, new()
        {
            //创建 Where Lambda表达式树
            var type = typeof(T);
            var parameter = Expression.Parameter(type, expName);

            var list = new List<MemberBinding>();

            foreach (var item in GetPropertyInfos(type))
                list.Add(Expression.Bind(item, Expression.Constant(item.GetValue(model), item.PropertyType)));

            var newExpr = Expression.New(typeof(T));

            return Expression.Lambda<Func<T, T>>(Expression.MemberInit(newExpr, list), parameter);
        }

        #region LINQ 扩展

        /// <summary>
        /// WhereIf
        /// </summary>
        /// <param name="query"></param>
        /// <param name="if"></param>
        /// <param name="expWhere"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static IQueryable<T> WhereIf<T>(this IQueryable<T> query, bool @if, Expression<Func<T, bool>> expWhere)
            => @if ? query.Where(expWhere) : query;

        /// <summary>
        /// Page 分页简写
        /// </summary>
        /// <param name="query"></param>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static IQueryable<T> Page<T>(this IQueryable<T> query, int page, int rows)
            => query.Skip((page - 1) * rows).Take(rows);

        #endregion

        #region DatabaseFacade 扩展

        /// <summary>
        /// 执行 sql 返回 DataTable
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DataTable ExcuteDataTable(this DatabaseFacade databaseFacade, string sql)
        {
            return databaseFacade.ExcuteDataTable(sql, null);
        }

        /// <summary>
        /// 执行 sql 返回 DataTable
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static DataTable ExcuteDataTable(this DatabaseFacade databaseFacade, string sql,
            params object[] parameters)
        {
            var dataTable = new DataTable();
            using var dbConnection = (SqlConnection) databaseFacade.GetDbConnection();
            using var adapter = new SqlDataAdapter(sql, dbConnection);
            if (parameters != null && parameters.Length > 0)
            {
                adapter.SelectCommand.Parameters.AddRange(parameters);
            }

            var dataSet = new DataSet();
            adapter.Fill(dataSet);
            if (dataSet.Tables.Count > 0)
            {
                dataTable = dataSet.Tables[0];
            }

            return dataTable;
        }

        /// <summary>
        /// 执行 sql 返回 SqlDataReader
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static DbDataReader ExcuteReader(this DatabaseFacade databaseFacade, string sql)
        {
            return databaseFacade.ExcuteReader(sql, null);
        }

        /// <summary>
        /// 执行 sql 返回 SqlDataReader
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static DbDataReader ExcuteReader(this DatabaseFacade databaseFacade, string sql,
            params object[] parameters)
        {
            var dbConnection = (SqlConnection) databaseFacade.GetDbConnection();

            dbConnection.ConnectionString = databaseFacade.GetConnectionString();

            var cmd = dbConnection.CreateCommand();
            cmd.CommandText = sql;

            if (dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            if (parameters != null && parameters.Length > 0)
            {
                //添加参数
                cmd.Parameters.AddRange(parameters);
            }

            return cmd.ExecuteReader();
        }

        /// <summary>
        /// 执行 sql 返回 List[Dictionary[string,object]]
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static IEnumerable<Dictionary<string, object>> ExcuteListDictionary(this DatabaseFacade databaseFacade,
            string sql)
        {
            return databaseFacade.ExcuteListDictionary(sql, null);
        }

        /// <summary>
        /// 执行 sql 返回 List[Dictionary[string,object]]
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public static IEnumerable<Dictionary<string, object>> ExcuteListDictionary(this DatabaseFacade databaseFacade,
            string sql, params object[] parameters)
        {
            using var dataReader = databaseFacade.ExcuteReader(sql, parameters);

            if (!dataReader.HasRows) return default;

            var result = new List<Dictionary<string, object>>();

            var fields = new List<string>(dataReader.FieldCount);
            for (var i = 0; i < dataReader.FieldCount; i++)
            {
                fields.Add(dataReader.GetName(i));
            }

            while (dataReader.Read())
            {
                var dictionary = new Dictionary<string, object>();
                foreach (var item in fields)
                {
                    dictionary[item] = (dataReader[item] == DBNull.Value) ? null : dataReader[item];
                }

                result.Add(dictionary);
            }

            return result;
        }

        /// <summary>
        /// 执行 sql 返回 第一行第一列值
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <param name="sql"></param>
        /// <param name="parameters"></param>
        /// <typeparam name="TResult"></typeparam>
        /// <returns></returns>
        public static TResult ExecuteScalar<TResult>(this DatabaseFacade databaseFacade, string sql,
            params object[] parameters)
        {
            var dbConnection = (SqlConnection) databaseFacade.GetDbConnection();

            dbConnection.ConnectionString = databaseFacade.GetConnectionString();

            var cmd = dbConnection.CreateCommand();
            cmd.CommandText = sql;

            if (dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

            if (parameters != null && parameters.Length > 0)
            {
                //添加参数
                cmd.Parameters.AddRange(parameters);
            }

            return (TResult) cmd.ExecuteScalar();
        }

        #endregion
    }
}