using AutoMapper;
using HZY.Managers.Quartz.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Managers.Quartz
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<Tasks, Tasks>();

        }

    }
}
