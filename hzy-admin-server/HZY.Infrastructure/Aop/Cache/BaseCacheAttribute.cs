using System.Reflection;
using System.Text.RegularExpressions;
using HzyScanDiService;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;

namespace HZY.Infrastructure.Aop.Cache
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public abstract class BaseCacheAttribute : AopBaseAttribute
    {
        /// <summary>
        /// 缓存Key 不填默认是 函数的命名空间.函数名称
        /// </summary>
        /// <value></value>
        public string CacheKey { get; set; }

        /// <summary>
        /// Redis 服务类型 不传递默认 走内存缓存
        /// </summary>
        /// <value></value>
        public Type RedisServiceType { get; set; }

        /// <summary>
        /// 获取缓存Key
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        protected string GetCacheKey(AopContext context)
        {
            if (!string.IsNullOrWhiteSpace(CacheKey))
            {
                return ParseCacheKey(context);
            }

            var name = context.Invocation.Method.Name;
            var prefix = context.Invocation.Method.DeclaringType?.FullName;
            return $"{prefix}.{name}";
        }

        /// <summary>
        /// 解析缓存主键
        /// </summary>
        /// <param name="context">拦截器上下文</param>
        private string ParseCacheKey(AopContext context)
        {
            //寻找大括号{} 内的内容
            var replaceParameters = Regex.Matches(CacheKey, @"\{(.+?)\}").Select(m => m.Groups[1].Value).ToList();
            if (replaceParameters.Count > 0)
            {
                // 获取所有方法参数
                var typeNames = context.Invocation.Method.GetParameters().Select(t => t.Name).ToList();
                foreach (var replaceParameter in replaceParameters)
                {
                    var firstName = replaceParameter.Split(".")[0];
                    // 查询括号里的内容  .分割后第一位  能和参数名对的上吗
                    if (typeNames.Contains(firstName))
                    {
                        // 获取这个值对应的索引
                        int index = typeNames.FindIndex(tname => tname == firstName);
                        // 对内容进行分割
                        var names = replaceParameter.Split(".").ToList();

                        // 分割后大于长度大于一 说明存在实例内部属性调用
                        if (names.Count > 1)
                        {
                            var replaceName = "{" + replaceParameter + "}";
                            // 移除第一位
                            names.RemoveAt(0);
                            // 递归获取到属性值
                            var value = GetParameterValue(context.Invocation.GetArgumentValue(index), names);
                            value = value ?? "null";
                            CacheKey = CacheKey.Replace(replaceName, value);
                        }
                        else
                        {
                            var replaceName = "{" + replaceParameter + "}";
                            var value = context.Invocation.GetArgumentValue(index)?.ToString();
                            CacheKey = CacheKey.Replace(replaceName, value);
                        }
                    }
                }
            }

            return CacheKey;
        }

        /// <summary>
        /// 递归获取属性值
        /// </summary>
        /// <param name="obj"></param>
        /// <param name="parameterNames"></param>
        /// <returns></returns>
        private string GetParameterValue(object obj, List<string> parameterNames)
        {
            if (obj == null)
            {
                return null;
            }

            if (parameterNames.Count > 1)
            {
                var name = parameterNames[0];
                parameterNames.RemoveAt(0);

                // 获取属性值
                var propertyInfo = GetPropertyInfo(obj, name);
                if (propertyInfo != null)
                {
                    return GetParameterValue(propertyInfo.GetValue(obj), parameterNames);
                }
                return null;
            }
            else if (parameterNames.Count == 1)
            {
                // 获取属性值
                var propertyInfo = GetPropertyInfo(obj, parameterNames[0]);
                // 从对象里获取这个属性
                return propertyInfo?.GetValue(obj)?.ToString();
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 根据属性名称获取实例里的属性
        /// </summary>
        /// <param name="obj">实例</param>
        /// <param name="name">需要的属性名</param>
        /// <returns></returns>
        private PropertyInfo GetPropertyInfo(object obj, string name)
        {
            if (obj == null)
            {
                return null;
            }

            // 获取所有public属性和实例
            var propertyInfos = obj.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            // 找找有没有我们要的
            return propertyInfos.FirstOrDefault(p => p.Name == name);
        }

        /// <summary>
        /// 获取Redis数据库
        /// </summary>
        /// <param name="aopContext"></param>
        /// <returns></returns>
        protected IDatabase GetDatabase(AopContext aopContext)
        {
            var redisService = aopContext.ServiceProvider.GetRequiredService(RedisServiceType);
            var propertyInfos = redisService.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            var databasePropertyInfo = propertyInfos.FirstOrDefault(w => w.Name == nameof(IDatabase.Database) && w.PropertyType == typeof(IDatabase));
            if (databasePropertyInfo == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 找不到属性 public IDatabase {nameof(IDatabase.Database)} {{get;}}");
            }
            // 获取 idatabase
            var redisCache = (IDatabase)databasePropertyInfo.GetValue(redisService);
            if (redisCache == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 属性 public IDatabase {nameof(IDatabase.Database)} {{get;}} 是 null ");
            }

            return redisCache;
        }
    }
}