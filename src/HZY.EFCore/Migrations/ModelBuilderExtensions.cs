using HZY.Models.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Migrations
{
    /// <summary>
    /// EFCore 种子数据
    /// </summary>
    public static class ModelBuilderExtensions
    {

        /// <summary>
        /// 种子数据
        /// </summary>
        /// <param name="modelBuilder"></param>
        public static void Seed(this ModelBuilder modelBuilder)
        {
            AddMember(modelBuilder);
        }

        private static void AddMember(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Member>().HasData(new Member()
            {
                Id = Guid.Parse("96a1aa3d-a61a-42d0-954a-c71753fb2065"),
                Number = "123",
                Name = "123",
                Phone = "123",
                Sex = "女",
                Birthday = DateTime.Now,
                Photo = "/upload/files/20210118/time_232747_old_name_hzy.png",
                Introduce = "<p>888</p>",
                FilePath = "/upload/files/20210118/time_233310_old_name_hzy.png",
                UserId = Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335"),
                CreationTime = DateTime.Now,
                LastModificationTime = DateTime.Now
            });
        }
    }
}
