namespace HZY.Core.Swagger.Filters;

public class FileUploadOperation : IOperationFilter
{
    public void Apply(OpenApiOperation operation, OperationFilterContext context)
    {
        //判断上传文件的类型，只有上传的类型是IFormCollection的才进行重写。
        if (context.ApiDescription.ActionDescriptor.Parameters.Any(w => w.ParameterType == typeof(IFormFile)))
        {
            var parameters = context.ApiDescription.ActionDescriptor.Parameters;
            Dictionary<string, OpenApiSchema> schema = new Dictionary<string, OpenApiSchema>();
            schema[parameters[0].Name] = new OpenApiSchema
            {
                Description = "请选择文件",
                Type = "string",
                Format = "binary"
            };
            Dictionary<string, OpenApiMediaType> content = new Dictionary<string, OpenApiMediaType>();
            content["multipart/form-data"] = new OpenApiMediaType
            {
                Schema = new OpenApiSchema { Type = "object", Properties = schema }
            };
            operation.RequestBody = new OpenApiRequestBody() { Content = content };
        }
    }
}
