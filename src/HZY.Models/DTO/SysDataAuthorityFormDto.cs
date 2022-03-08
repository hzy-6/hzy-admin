using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.Framework;

namespace HZY.Models.DTO
{
    public class SysDataAuthorityFormDto
    {
        public SysDataAuthority SysDataAuthority { get; set; }
        public List<SysDataAuthorityCustom> SysDataAuthorityCustomList { get; set; }
    }
}