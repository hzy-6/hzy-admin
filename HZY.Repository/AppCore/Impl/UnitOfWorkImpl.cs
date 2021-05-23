/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using HZY.Repository.AppCore.Interface;

namespace HZY.Repository.AppCore.Impl
{
    public sealed class UnitOfWorkImpl : IUnitOfWork
    {
        private bool _saveState = true;
        public bool GetSaveState() => this._saveState;
        public void SetSaveState(bool saveSate) => this._saveState = saveSate;
        public void CommitOpen() => this._saveState = false;
    }
}