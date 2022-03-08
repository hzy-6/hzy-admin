using HZY.Infrastructure.ExpressionTree;
using NUnit.Framework;

namespace HZY.Tests;

public class Tests
{
    [SetUp]
    public void Setup()
    {
    }

    [Test]
    public void Test1()
    {
        var list = new System.Collections.Generic.List<int>();
        list.Add(1);
        list.Add(2);
        list.Add(3);

        var bodyAnd = ExpressionTreeExtensions.And<User>(w => w.Name == "张三" && w.Age == 1, w => list.Contains(w.Age));

        var bodyOr = ExpressionTreeExtensions.Or<User>(w => w.Name == "张三" || w.Age == 1, a => list.Contains(a.Age));

        Assert.Pass();
    }
}

public class User
{
    public string? Name { get; set; }
    public int Age { get; set; }
}