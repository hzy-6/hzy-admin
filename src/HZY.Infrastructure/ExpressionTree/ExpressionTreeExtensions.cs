using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Threading.Tasks;

namespace HZY.Infrastructure.ExpressionTree
{
    /// <summary>
    /// 表达式树扩展
    /// </summary>
    public static class ExpressionTreeExtensions
    {
        /// <summary>
        /// 生成包含表达式
        /// 例如：w=> new [] {1,2,3}.Contains(w.Key)
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="items"></param>
        /// <param name="lambdaParameterName"></param>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> Contains<T, TKey>(string fieldName, IEnumerable<TKey> items, string lambdaParameterName = "w")
        {
            var parameter = Expression.Parameter(typeof(T), lambdaParameterName);

            var valuesParameter = Expression.Constant(items.ToList(), typeof(List<TKey>));
            var memberExpression = Expression.Property(parameter, fieldName);
            var nameParameter = Expression.Convert(memberExpression, typeof(TKey));
            var body = Expression.Call(valuesParameter, nameof(string.Contains), Array.Empty<Type>(), nameParameter);

            return Expression.Lambda<Func<T, bool>>(body, parameter);
        }

        /// <summary>
        /// 生成等等于表达式
        /// 例如：w=>w.Key == Guid.Empty
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="value"></param>
        /// <param name="lambdaParameterName"></param>
        /// <typeparam name="T"></typeparam>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> Equal<T, TKey>(string fieldName, TKey value, string lambdaParameterName = "w")
        {
            //创建 Where Lambda表达式树
            var parameter = Expression.Parameter(typeof(T), lambdaParameterName);

            var propertyParameter = Expression.Property(parameter, fieldName);
            var nameParameter = Expression.Convert(propertyParameter, typeof(TKey));
            var valueParameter = Expression.Constant(value, typeof(TKey));
            var body = Expression.Equal(nameParameter, valueParameter);

            return Expression.Lambda<Func<T, bool>>(body, parameter);
        }

        /// <summary>
        /// 对象实例化
        /// 例如：w => new User{ Name="hzy" }
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, T>> MemberInit<T>(this T model, string expName = "w") where T : class, new()
        {
            //创建 Where Lambda表达式树
            var type = typeof(T);
            var parameter = Expression.Parameter(type, expName);

            var list = new List<MemberBinding>();

            BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public;
            foreach (var item in type.GetProperties(bindingFlags))
                list.Add(Expression.Bind(item, Expression.Constant(item.GetValue(model), item.PropertyType)));

            var newExpr = Expression.New(typeof(T));

            return Expression.Lambda<Func<T, T>>(Expression.MemberInit(newExpr, list), parameter);
        }

        /// <summary>
        /// 两个拉姆达表达式相连接
        /// 例如：w=>w.Key == Guid.Empty AND new [] {1,2,3}.Contains(w.Key)
        /// </summary>
        /// <param name="left"></param>
        /// <param name="right"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> And<T>(this Expression<Func<T, bool>> left, Expression<Func<T, bool>> right)
        {
            //获取参数
            var parameter = left.Parameters[0];

            var body = Expression.AndAlso(left.Body, right.Body);

            //修正两个body的参数名称，防止 表达式生成异常
            var newBody = new ReplateParameterExpressionVisitor<T>(parameter.Name).Visit(body);
            return Expression.Lambda<Func<T, bool>>(newBody, parameter);
        }

        /// <summary>
        /// 两个拉姆达表达式 为或者关系
        /// 例如：w=>w.Key == Guid.Empty || new [] {1,2,3}.Contains(w.Key)
        /// </summary>
        /// <param name="left"></param>
        /// <param name="right"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static Expression<Func<T, bool>> Or<T>(this Expression<Func<T, bool>> left, Expression<Func<T, bool>> right)
        {
            //获取参数
            var parameter = left.Parameters[0];

            var body = Expression.OrElse(left.Body, right.Body);

            //修正两个body的参数名称，防止 表达式生成异常
            var newBody = new ReplateParameterExpressionVisitor<T>(parameter.Name).Visit(body);
            return Expression.Lambda<Func<T, bool>>(newBody, parameter);
        }


        /// <summary>
        /// 生成包含表达式
        /// 例如：w=> new [] {1,2,3}.Contains(w.Key)
        /// </summary>
        /// <param name="modelType"></param>
        /// <param name="fieldName"></param>
        /// <param name="items"></param>
        /// <param name="lambdaParameterName"></param>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static LambdaExpression Contains<TKey>(Type modelType, string fieldName, IEnumerable<TKey> items, string lambdaParameterName = "w")
        {
            var parameter = Expression.Parameter(modelType, lambdaParameterName);

            var valuesParameter = Expression.Constant(items.ToList(), typeof(List<TKey>));
            var memberExpression = Expression.Property(parameter, fieldName);
            var nameParameter = Expression.Convert(memberExpression, typeof(TKey));
            var body = Expression.Call(valuesParameter, nameof(string.Contains), Array.Empty<Type>(), nameParameter);

            return Expression.Lambda(body, parameter);
        }

        /// <summary>
        /// 生成等等于表达式
        /// 例如：w=>w.Key == Guid.Empty
        /// </summary>
        /// <param name="modelType"></param>
        /// <param name="fieldName"></param>
        /// <param name="value"></param>
        /// <param name="lambdaParameterName"></param>
        /// <typeparam name="TKey"></typeparam>
        /// <returns></returns>
        public static LambdaExpression Equal<TKey>(Type modelType, string fieldName, TKey value, string lambdaParameterName = "w")
        {
            //创建 Where Lambda表达式树
            var parameter = Expression.Parameter(modelType, lambdaParameterName);

            var propertyParameter = Expression.Property(parameter, fieldName);
            var nameParameter = Expression.Convert(propertyParameter, typeof(TKey));
            var valueParameter = Expression.Constant(value, typeof(TKey));
            var body = Expression.Equal(nameParameter, valueParameter);

            return Expression.Lambda(body, parameter);
        }


    }
}