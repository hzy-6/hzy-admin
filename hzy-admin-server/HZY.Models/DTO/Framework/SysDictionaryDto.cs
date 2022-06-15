using HZY.Models.Entities.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.DTO.Framework;

public class SysDictionaryDto : SysDictionary
{

    public int Key
    {
        get
        {
            return Id;
        }
    }

    public string Title
    {
        get
        {
            return Name;
        }
    }

    public List<SysDictionaryDto> Children { get; set; }


}