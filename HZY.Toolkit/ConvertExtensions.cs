using System;

namespace HZY.Toolkit
{
    public static class ConvertExtensions
    {
        /// <summary>
        /// string
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string ToStr<T>(this T value)
            => value == null ? string.Empty : value.ToString();

        /// <summary>
        /// int
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static int ToInt32<T>(this T value)
        {
            if (value == null) return 0;

            if (value.GetType().BaseType == typeof(Enum))
                return Convert.ToInt32(value);

            return Int32.TryParse(value.ToStr(), out int result) ? result : 0;
        }

        /// <summary>
        /// float
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static float ToFloat<T>(this T value)
        {
            if (value == null) return 0;

            return float.TryParse(value.ToStr(), out var result) ? result : 0;
        }

        /// <summary>
        /// double
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static double ToDouble<T>(this T value)
        {
            if (value == null) return 0;

            return double.TryParse(value.ToStr(), out var result) ? result : 0;
        }

        /// <summary>
        /// decimal
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static decimal ToDecimal<T>(this T value)
        {
            if (value == null) return 0;

            return decimal.TryParse(value.ToStr(), out var result) ? result : 0;
        }

        /// <summary>
        /// Guid
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Guid ToGuid<T>(this T value)
        {
            if (value == null) return Guid.Empty;

            return Guid.TryParse(value.ToStr(), out var result) ? result : Guid.Empty;
        }

        /// <summary>
        /// Guid?
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static Guid? ToGuidNull<T>(this T value)
        {
            if (value == null) return null;

            return Guid.TryParse(value.ToStr(), out var result) ? (Guid?) result : null;
        }

        /// <summary>
        /// GuidString
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string ToGuidStr<T>(this T value) => value.ToGuid().ToStr();

        /// <summary>
        /// DateTime
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static DateTime ToDateTime<T>(this T value)
        {
            if (value == null) return DateTime.MinValue;

            return DateTime.TryParse(value.ToStr(), out var result) ? result : DateTime.MinValue;
        }

        /// <summary>
        /// DateTime?
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static DateTime? ToDateTimeNull<T>(this T value)
        {
            if (value == null) return null;

            return DateTime.TryParse(value.ToStr(), out var result) ? (DateTime?) result : null;
        }

        /// <summary>
        /// 格式的 时间 字符串
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <param name="formatStr"></param>
        /// <returns></returns>
        public static string ToDateTimeFormat<T>(this T value, string formatStr = "yyyy-MM-dd")
        {
            var datetime = value.ToDateTime();
            return datetime.ToShortDateString() == DateTime.MinValue.ToShortDateString()
                ? string.Empty
                : datetime.ToString(formatStr);
        }

        /// <summary>
        /// bool
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static bool ToBool<T>(this T value)
        {
            if (value == null) return false;

            return bool.TryParse(value.ToStr(), out var result) && result;
        }

        /// <summary>
        /// byte[]
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="value"></param>
        /// <returns></returns>
        public static byte[] ToBytes<T>(this T value) => value == null ? null : value as byte[];

        /// <summary>
        /// 时间戳转为C#格式时间
        /// </summary>
        /// <param name="timeStamp"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static DateTime ToTime<T>(this int timeStamp)
        {
            var dtStart = TimeZoneInfo.ConvertTime(new DateTime(1970, 1, 1), TimeZoneInfo.Local);
            var lTime = long.Parse(timeStamp + "0000000");
            var toNow = new TimeSpan(lTime);
            return dtStart.Add(toNow);
        }

        /// <summary>
        /// DateTime时间格式转换为Unix时间戳格式
        /// </summary>
        /// <param name="time"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static int ToTimeInt<T>(this DateTime time)
        {
            var startTime = TimeZoneInfo.ConvertTime(new DateTime(1970, 1, 1), TimeZoneInfo.Local);
            return (int) ((time) - startTime).TotalSeconds;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T CreateInstance<T>() where T : class, new()
        {
            var t = typeof(T);
            if (t.IsValueType || typeof(T) == typeof(string))
                return default;
            return (T) Activator.CreateInstance(t);
        }

        /// <summary>
        /// 将 Null 对象转换为 对象的实例
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="model"></param>
        /// <param name="defaultInstance">自定义 默认实例</param>
        /// <returns></returns>
        public static T NullSafe<T>(this T model, T defaultInstance = null) where T : class, new()
        {
            if (model != null) return model;

            return defaultInstance ?? CreateInstance<T>();
        }
    }
}