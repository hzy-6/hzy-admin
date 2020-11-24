using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Repository.Core;
using HZY.Repository.Core.Models;
using HZY.Repository.Core.Provider;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.Framework
{
    /// <summary>
    /// 表信息 仓储
    /// </summary>
    public class AppTableInfoRepository : AppRepository<AppTableInfo>
    {
        public AppTableInfoRepository(AppDbContext context) : base(context)
        {
        }

        /// <summary>
        /// 查询所有表信息
        /// 目前只支持 SqlServer 此函数
        /// </summary>
        /// <returns></returns>
        public virtual async Task<List<AppTableInfo>> FindAppTableInfosAsync()
        {
            // SELECT 
            //     表名       = case when a.colorder=1 then d.name else '' end,
            //     表说明     = case when a.colorder=1 then isnull(f.value,'') else '' end,
            //     字段序号   = a.colorder,
            //     字段名     = a.name,
            //     标识       = case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then '√'else '' end,
            //     主键       = case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
            //                      SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then '√' else '' end,
            //     类型       = b.name,
            //     占用字节数 = a.length,
            //     长度       = COLUMNPROPERTY(a.id,a.name,'PRECISION'),
            //     小数位数   = isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0),
            //     允许空     = case when a.isnullable=1 then '√'else '' end,
            //     默认值     = isnull(e.text,''),
            //     字段说明   = isnull(g.[value],'')
            // FROM 
            //     syscolumns a
            // left join 
            //     systypes b 
            // on 
            //     a.xusertype=b.xusertype
            // inner join 
            //     sysobjects d 
            // on 
            //     a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
            // left join 
            //     syscomments e 
            // on 
            //     a.cdefault=e.id
            // left join 
            // sys.extended_properties   g 
            // on 
            //     a.id=G.major_id and a.colid=g.minor_id  
            // left join
            // sys.extended_properties f
            // on 
            //     d.id=f.major_id and f.minor_id=0
            // where  
            //     d.name='member' 
            // order by  
            //     a.id,a.colorder

            var sqlString = string.Empty;

            if (this.Orm.Database.IsSqlServer())
            {
                sqlString = $@"

SELECT 
	(convert(varchar(100),d.name)+'_'+a.name) AS Id,
    convert(varchar(100),d.name) AS TabName,
	convert(varchar(100),isnull(f.value,'')) AS TabNameRemark,
	convert(int,a.colorder) AS ColOrder,
	a.name AS ColName,
	case when COLUMNPROPERTY( a.id,a.name,'IsIdentity')=1 then 1 else 0 end ColIsIdentity,
	case when exists(SELECT 1 FROM sysobjects where xtype='PK' and parent_obj=a.id and name in (
                     SELECT name FROM sysindexes WHERE indid in( SELECT indid FROM sysindexkeys WHERE id = a.id AND colid=a.colid))) then 1 else 0 end ColIsKey,
	convert(varchar(100),b.name) AS ColType,
	convert(int,a.length) AS ColLength,
	convert(int,COLUMNPROPERTY(a.id,a.name,'PRECISION')) AS ColMaxLength,
	convert(int,isnull(COLUMNPROPERTY(a.id,a.name,'Scale'),0)) AS ColScale,
	convert(int,case when a.isnullable=1 then 1 else 0 end) AS ColIsNull,
	convert(varchar(100),isnull(e.text,'')) AS ColDefaultValue,
    convert(varchar(100),isnull(g.[value],'')) AS ColRemark
FROM syscolumns a
left join systypes b on a.xusertype=b.xusertype
inner join sysobjects d on a.id=d.id  and d.xtype='U' and  d.name<>'dtproperties'
left join syscomments e on a.cdefault=e.id
left join sys.extended_properties g on a.id=G.major_id and a.colid=g.minor_id  
left join sys.extended_properties f on d.id=f.major_id and f.minor_id=0
order by a.id,a.colorder

";
            }
            else
            {
                throw new Exception("未实现!");
            }

            //var dt = this.Orm.Database.ExcuteDataTable("select * from member");

            return await this.Orm.AppTableInfo.FromSqlRaw(sqlString).ToListAsync();
        }
    }
}