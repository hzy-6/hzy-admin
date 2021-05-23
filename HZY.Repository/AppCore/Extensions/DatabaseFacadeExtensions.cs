using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using MySqlConnector;
using Npgsql;

namespace HZY.Repository.AppCore.Extensions
{
    /// <summary>
    /// DatabaseFacade 扩展
    /// </summary>
    public static class DatabaseFacadeExtensions
    {
        /// <summary>
        /// 获取连接对象
        /// </summary>
        /// <param name="databaseFacade"></param>
        /// <returns></returns>
        public static DbConnection GetDataConnection(this DatabaseFacade databaseFacade)
        {
            if (databaseFacade.IsMySql())
            {
                return new MySqlConnection(databaseFacade.GetConnectionString());
            }

            if (databaseFacade.IsNpgsql())
            {
                return new NpgsqlConnection(databaseFacade.GetConnectionString());
            }

            return new SqlConnection(databaseFacade.GetConnectionString());
        }


    }
}