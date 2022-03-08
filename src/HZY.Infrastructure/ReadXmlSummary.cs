/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */

using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Xml;

namespace HZY.Infrastructure;

/// <summary>
/// 读取 xml 摘要
/// </summary>
public static class ReadXmlSummary
{
    private static Dictionary<Assembly, XmlDocument> XmlCache { get; set; } =
        new Dictionary<Assembly, XmlDocument>();

    public static XmlElement XmlForMember(MemberInfo memberInfo)
    {
        var xmlElement = XmlFromName(memberInfo.DeclaringType, memberInfo.MemberType.ToString()[0],
            memberInfo.Name);
        return xmlElement;
    }

    private static XmlElement XmlFromName(Type type, char prefix, string name)
    {
        string fullName;

        if (string.IsNullOrEmpty(name))
        {
            fullName = prefix + ":" + type.FullName;
        }
        else
        {
            fullName = prefix + ":" + type.FullName + "." + name;
        }

        var xmlDocument = XmlFromAssembly(type.Assembly);

        XmlElement matchedElement = null;

        if (xmlDocument == null) return default;

        foreach (XmlElement xmlElement in xmlDocument["doc"]["members"])
        {
            if (xmlElement.Attributes["name"].Value.Equals(fullName))
            {
                matchedElement = xmlElement;
            }
        }

        return matchedElement;
    }

    public static XmlDocument XmlFromAssembly(Assembly assembly)
    {
        if (!XmlCache.ContainsKey(assembly))
        {
            // load the docuemnt into the cache
            XmlCache[assembly] = XmlFromAssemblyNonCached(assembly);
        }

        return XmlCache[assembly];
    }

    private static XmlDocument XmlFromAssemblyNonCached(Assembly assembly)
    {
        string location = assembly.Location;

        StreamReader streamReader;

        streamReader = new StreamReader(Path.ChangeExtension(location, ".xml"));

        XmlDocument xmlDocument = new XmlDocument();
        xmlDocument.Load(streamReader);
        return xmlDocument;
    }
}