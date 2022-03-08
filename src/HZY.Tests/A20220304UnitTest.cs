using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Newtonsoft.Json;
using NUnit.Framework;

namespace HZY.Tests;


public class A20220304UnitTest
{
    [Test]
    public void Test()
    {
        var model = new Model();
        model.h5_info = new h5_info();

        var json = JsonConvert.SerializeObject(model);

    }
}


public class Model
{
    public h5_info h5_info { get; set; }
}

public class h5_info
{

    public string type { get; set; }

}