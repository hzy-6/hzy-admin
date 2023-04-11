namespace HZY.Core.Files;

public static class FileManagerExtensions
{
    public static long ToStorageByteLength(this string sValue)
    {
        if (!string.IsNullOrWhiteSpace(sValue))
        {
            sValue = sValue.ToUpper();
            if (sValue.IndexOf("KB") > 0)
            {
                var value = SubValue(sValue, "KB");
                if (value > -1)
                {
                    return value * 1024;
                }
            }
            else if (sValue.IndexOf("MB") > 0)
            {
                var value = SubValue(sValue, "MB");
                if (value > -1)
                {
                    return value * 1024 * 1024;
                }
            }
            else if (sValue.IndexOf("GB") > 0)
            {
                var value = SubValue(sValue, "GB");
                if (value > -1)
                {
                    return value * 1024 * 1024 * 1024;
                }
            }
            else if (sValue.IndexOf("B") > 0)
            {
                var value = SubValue(sValue, "B");
                if (value > -1)
                {
                    return value;
                }
            }

            if (long.TryParse(sValue, out var result))
            {
                return result;
            }
        }

        throw new Exception("解析失败");
    }

    private static long SubValue(string body, string unit)
    {
        var index = body.IndexOf(unit);
        if (index > 0)
        {
            var svalue = body.Substring(0, index);
            if (long.TryParse(svalue, out var value))
            {
                return value;
            }

        }

        return -1;
    }
}