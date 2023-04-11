using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace HZY.Core.Swaggers;

/// <summary>
/// 在 swagger 表单中 隐藏字段 过滤
/// </summary>
public class InSwaggerFormHideSchemaFilter : ISchemaFilter
{
    public void Apply(OpenApiSchema schema, SchemaFilterContext context)
    {
        var a = schema.Properties;

        var propertyInfos = context.Type.GetProperties()
                                     .Where(t => t.GetCustomAttribute<InSwaggerFormHideAttribute>() != null)
                                     ;

        if (propertyInfos == null || propertyInfos.Count() == 0) return;

        if (propertyInfos.Count() > 0)
        {
            foreach (var key in schema.Properties.Keys)
            {
                if (propertyInfos.Any(w => w.Name.ToLower() == key.ToLower()))
                {
                    schema.Properties.Remove(key);
                }
            }
        }

    }

}
