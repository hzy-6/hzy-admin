using System;

namespace HZY.Admin.Model.Vo
{
    public class BaseVo<TModel, TKey>
    {
        public TKey Id { get; set; }
        public TModel Model { get; set; }
    }
}