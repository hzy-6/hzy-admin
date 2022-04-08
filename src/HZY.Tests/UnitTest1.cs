using HzyEFCoreRepositories.ExpressionTree;
using NUnit.Framework;
using System;

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

public interface IUserService
{
    string GetName();
}

[AopBase]
public class UserService : IUserService
{
    public virtual string GetName()
    {
        return "123";
    }

}

//[TaskAop("0/12 1 1 1*")]
public class MemberService
{

}

//ProxyContext<UserService> _userService; UserServiceProxy

//IUserService

public class UserServiceProxy : UserService
{
    public bool Before()
    {
        //typeof(AopBase).InvokeMember();
        return true;
    }

    public bool After()
    {
        return true;
    }

    [AopBase]
    public override string GetName()
    {
        Before();
        var str = base.GetName();
        After();
        return str;
    }

}

[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
public class AopBase : Attribute
{
    public AopBase()
    {

    }


    public virtual bool Before()
    {

        return true;
    }

    public virtual bool After()
    {
        return true;
    }


}


public class TaskAop : AopBase
{
    public override bool Before()
    {
        return base.Before();
    }

    public override bool After()
    {
        return base.After();
    }

}
