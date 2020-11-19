using System;

namespace HZY.Admin.Objects.Vo
{
    public class BaseVo<TModel, TKey>
    {
        public TKey Id { get; set; }
        public TModel Model { get; set; }
    }
}