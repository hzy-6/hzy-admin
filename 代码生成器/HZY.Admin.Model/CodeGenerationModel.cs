using HZY.Repository.Entity;
using System.Collections.Generic;

namespace HZY.Admin.Model
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