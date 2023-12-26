using HZY.Framework.Repository.EntityFramework;
using HZY.Repository.Admin.Entities.Systems;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace HZY.WinFormDemo;

public partial class Form2 : Form
{
    private readonly ILogger<Form1> _logger;
    private IRepository<SysUser> _sysUserRepository;

    public Form2(ILogger<Form1> logger, IRepository<SysUser> sysUserRepository)
    {
        InitializeComponent();
        _logger = logger;
        _sysUserRepository = sysUserRepository;
        //
        dataGridView1.DataBindings.Clear();
        dataGridView1.DataSource = _sysUserRepository.Select.ToList();

        _logger.LogInformation("Form1_Load 666");
    }

    private void button1_Click(object sender, EventArgs e)
    {
        var user = _sysUserRepository.Select.FirstOrDefault();

        MessageBox.Show($"用户名：{user?.Name} 登录名：{user?.LoginName} 用户密码：{user?.Password}");
    }
}
