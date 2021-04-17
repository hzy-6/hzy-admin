using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace HZY.Repository.Core.Provider
{
    /// <summary>
    /// DatabaseFacade 扩展
    /// </summary>
    public static class DatabaseFacadeExtensions
    {
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
            using var dbConnection = new SqlConnection(databaseFacade.GetConnectionString());
            if (dbConnection.State == ConnectionState.Closed)
            {
                dbConnection.Open();
            }

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

            dbConnection.Close();
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
            var dbConnection = new SqlConnection(databaseFacade.GetConnectionString());
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
            var dbConnection = new SqlConnection(databaseFacade.GetConnectionString());

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

    }
}