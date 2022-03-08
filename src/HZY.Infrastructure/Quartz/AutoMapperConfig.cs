using AutoMapper;
using HZY.Quartz.Entitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Quartz
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<Tasks, Tasks>();

        }

    }
}
