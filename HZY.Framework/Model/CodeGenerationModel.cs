using System.Collections.Generic;
using HZY.Repository.Core.Models;

namespace HZY.Framework.Model
{
    public class CodeGenerationModel
    {
        public CodeGenerationModel(string tableName, List<AppTableInfo> appTableInfos)
        {
            this.TableName = tableName;
            this.AppTableInfos = appTableInfos;
        }

        public string TableName { get; set; }

        public List<AppTableInfo> AppTableInfos { get; set; }
    }

}