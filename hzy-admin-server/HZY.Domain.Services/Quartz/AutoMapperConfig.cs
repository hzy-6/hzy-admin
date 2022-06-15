using AutoMapper;
using HZY.Domain.Services.Quartz.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<Tasks, Tasks>();

        }

    }
}
