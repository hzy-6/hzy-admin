using HZY.Framework.Aop.Attributes;
using HZY.Framework.Repository.EntityFramework.Extensions;
using Newtonsoft.Json;
using Rougamo.Context;
using StackExchange.Redis;
using System.Data;
using System.Reflection;

namespace HZY.Shared.Aop;

/// <summary>
/// 字典特性
/// </summary>
[AttributeUsage(AttributeTargets.Property)]
public class DictAttribute : AopMoAttribute
{
    /// <summary>
    /// 表名称
    /// </summary>
    public string TableName { get; set; } = null!;

    /// <summary>
    /// 唯一标识
    /// </summary>
    public string FieldCode { get; set; } = null!;

    /// <summary>
    /// 字段
    /// </summary>
    public string FieldText { get; set; } = null!;

    /// <summary>
    /// 赋值给那个字段
    /// </summary>
    public string ToField { get; set; } = null!;

    /// <summary>
    /// DbContext 类型
    /// </summary>
    public Type DbContextType { get; set; } = null!;

    /// <summary>
    /// redis 类型
    /// </summary>
    public Type RedisServiceType { get; set; } = null!;

    public DictAttribute(string tableName, string fieldCode, string fieldText, string toField, Type dbContext, Type redisServiceType)
    {
        TableName = tableName;
        FieldCode = fieldCode;
        FieldText = fieldText;
        ToField = toField;
        DbContextType = dbContext;
        RedisServiceType = redisServiceType;
    }

    public override void OnSuccess(MethodContext context)
    {
        var database = this.GetDatabase(context);
        var key = GetCacheKey();

        var data = this.GetData(context);
        if (data.Count == 0) return;

        var name = context.Method.Name;
        name = name.Replace("get_", "");
        name = name.Replace("set_", "");

        var value = data[context.ReturnValue?.ToString()!];

        context.TargetType.GetProperty(ToField)?.SetValue(context.Target, value);
    }

    /// <summary>
    /// 获取Redis数据库
    /// </summary>
    /// <param name="MethodContext"></param>
    /// <returns></returns>
    protected IDatabase GetDatabase(MethodContext MethodContext)
    {
        var redisService = GetService(MethodContext, RedisServiceType);
        if (redisService == null)
        {
            throw new Exception($"Redis服务 {RedisServiceType.FullName} 找不到属性 public IDatabase {nameof(IDatabase.Database)} {{get;}}");
        }

        var propertyInfos = redisService.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
        var databasePropertyInfo = propertyInfos
            .FirstOrDefault(w => w.Name == nameof(IDatabase.Database) && w.PropertyType == typeof(IDatabase));
        if (databasePropertyInfo == null)
        {
            throw new Exception($"Redis服务 {RedisServiceType.FullName} 找不到属性 public IDatabase {nameof(IDatabase.Database)} {{get;}}");
        }

        // 获取 idatabase
        var redisCache = (IDatabase?)databasePropertyInfo.GetValue(redisService);
        if (redisCache == null)
        {
            throw new Exception($"Redis服务 {RedisServiceType.FullName} 属性 public IDatabase {nameof(IDatabase.Database)} {{get;}} 是 null ");
        }

        return redisCache;
    }

    /// <summary>
    /// 获取DbContext
    /// </summary>
    /// <param name="MethodContext"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
    protected DbContext GetDbContext(MethodContext MethodContext)
    {
        var dbContext = GetService(MethodContext, DbContextType);
        if (dbContext == null)
        {
            throw new Exception($"DbContext {DbContextType.FullName} 找不到属性 public IDatabase {nameof(IDatabase.Database)} {{get;}}");
        }

        return (DbContext)dbContext;
    }

    /// <summary>
    /// 获取缓存 Key
    /// </summary>
    /// <returns></returns>
    protected string GetCacheKey()
    {
        return $"Dict::{TableName}::{FieldCode}::{FieldText}";
    }

    /// <summary>
    /// 获取数据
    /// </summary>
    /// <param name="methodContext"></param>
    /// <returns></returns>
    public Dictionary<string, string> GetData(MethodContext methodContext)
    {
        // 查询redis
        var getDatabase = GetDatabase(methodContext);
        var key = GetCacheKey();
        var value = getDatabase.StringGet(key);

        var result = new Dictionary<string, string>();

        if (string.IsNullOrWhiteSpace(value))
        {
            var context = GetDbContext(methodContext);
            var list = context.Database.QueryBySql<DictEntity>($"SELECT {FieldCode} as fieldCode,{FieldText} as fieldText FROM {TableName}");

            if (list is null) return result;

            result = list.ToDictionary(w => w.FieldCode, w => w.FieldText);

            return result;
        }

        return JsonConvert.DeserializeObject<Dictionary<string, string>>(value!)!;
    }
}

public class DictEntity
{
    public string FieldCode { get; set; } = null!;
    public string FieldText { get; set; } = null!;
}
