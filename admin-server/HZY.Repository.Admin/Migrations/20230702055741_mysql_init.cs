using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace HZY.Repository.EntityFramework.Admin.Migrations
{
    /// <inheritdoc />
    public partial class mysql_init : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "algorithm_function",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_algorithm_function", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "flow",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<int>(type: "int", nullable: true),
                    code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_flow", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "flow_approval",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    launch_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    form_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    flow_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_flow_approval", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "flow_approval_step_history",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    sort = table.Column<int>(type: "int", nullable: false),
                    flow_node_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_node_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    sort_more = table.Column<int>(type: "int", nullable: false),
                    state = table.Column<int>(type: "int", nullable: false),
                    opinions = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    approval_date = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_flow_approval_step_history", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "flow_approval_step_history_user",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_approval_step_history_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_node_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_node_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_flow_approval_step_history_user", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "flow_node",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    flow_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    sort = table.Column<int>(type: "int", nullable: true),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    role_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_flow_node", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "low_code_list",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    low_code_table_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    low_code_table_info_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    foreign_key_table_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    foreign_key_table_field_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_low_code_list", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "low_code_search",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    low_code_table_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    low_code_table_info_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_low_code_search", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "low_code_table",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    schema = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    type = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    table_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    display_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    entity_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    model_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    service_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    controller_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    client_index_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    client_info_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    client_service_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    is_cover = table.Column<bool>(type: "tinyint(1)", nullable: true),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_low_code_table", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "low_code_table_info",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    low_code_table_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    is_primary = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    is_identity = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    is_nullable = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    position = table.Column<int>(type: "int", nullable: false),
                    column_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    describe = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    database_column_type = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    cs_type = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    cs_field = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    max_length = table.Column<int>(type: "int", nullable: true),
                    display_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_low_code_table_info", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "member",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    phone = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    sex = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    birthday = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    photo = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    introduce = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    file_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_member", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "quartz_job_task",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    group_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    cron = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    execute_time = table.Column<DateTime>(type: "datetime(6)", nullable: true),
                    state = table.Column<int>(type: "int", nullable: false),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    type = table.Column<int>(type: "int", nullable: false),
                    job_point = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    requset_mode = table.Column<int>(type: "int", nullable: true),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_quartz_job_task", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "quartz_job_task_log",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    job_task_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    text = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_quartz_job_task_log", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_data_authority",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    permission_type = table.Column<int>(type: "int", nullable: false),
                    role_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_data_authority", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_data_authority_custom",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    sys_data_authority_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    sys_organization_id = table.Column<int>(type: "int", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_data_authority_custom", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_dictionary",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    sort = table.Column<int>(type: "int", nullable: false),
                    code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    value = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<int>(type: "int", nullable: true),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_dictionary", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_function",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<int>(type: "int", nullable: true),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    by_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_function", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_menu",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    level_code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    number = table.Column<int>(type: "int", nullable: true),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    component_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    url = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    router = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    jump_url = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    icon = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<int>(type: "int", nullable: true),
                    show = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    close = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    keep_alive = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    state = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    type = table.Column<int>(type: "int", nullable: false),
                    mode = table.Column<int>(type: "int", nullable: false),
                    module_url = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    module_url_pro = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_menu", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_menu_function",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<int>(type: "int", nullable: true),
                    menu_id = table.Column<int>(type: "int", nullable: false),
                    function_code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    function_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_menu_function", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_operation_log",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    api = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ip = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    form = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    form_body = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    query_string = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    take_up_time = table.Column<long>(type: "bigint", nullable: false),
                    browser = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    os = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    controller_display_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    action_display_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_operation_log", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_organization",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    order_number = table.Column<int>(type: "int", nullable: true),
                    level_code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    leader = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    phone = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    email = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    state = table.Column<int>(type: "int", nullable: true),
                    parent_id = table.Column<int>(type: "int", nullable: true),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_organization", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_post",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<int>(type: "int", nullable: true),
                    code = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    state = table.Column<int>(type: "int", nullable: false),
                    remarks = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_post", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_role",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    number = table.Column<int>(type: "int", nullable: true),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    is_admin = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    remark = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    delete_lock = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_role", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_role_menu_function",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    role_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    menu_id = table.Column<int>(type: "int", nullable: false),
                    menu_function_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_role_menu_function", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_user",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    login_name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    password = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    phone = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    email = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    delete_lock = table.Column<bool>(type: "tinyint(1)", nullable: false),
                    organization_id = table.Column<int>(type: "int", nullable: true),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_user_post",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    post_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user_post", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "sys_user_role",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    user_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    role_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_sys_user_role", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_app",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    app_classify_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    preview_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_app", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_app_classify",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    parent_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    level = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_app_classify", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_component",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    component_classify_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    package_desp = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_version = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_entry = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    preview_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    size = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_component", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_component_classify",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    level = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_component_classify", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_model",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    model_classify_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    package_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    model_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    preview_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ext = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    size = table.Column<long>(type: "bigint", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_model", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_model_classify",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    model_classify_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    level = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_model_classify", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_template",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    template_classify_id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    preview_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_template", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_template_classify",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    level = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_template_classify", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_texture",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    texture_classify_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    package_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    resource_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    preview_name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    package_path = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ext = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    size = table.Column<long>(type: "bigint", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_texture", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "three_texture_classify",
                columns: table => new
                {
                    id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    name = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    parent_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    level = table.Column<int>(type: "int", nullable: false),
                    version = table.Column<ulong>(type: "bigint unsigned", nullable: false),
                    creator_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    creation_time = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    last_modifier_user_id = table.Column<Guid>(type: "char(36)", nullable: true, collation: "ascii_general_ci"),
                    last_modification_time = table.Column<DateTime>(type: "datetime(6)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_three_texture_classify", x => x.id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.InsertData(
                table: "low_code_table",
                columns: new[] { "id", "client_index_path", "client_info_path", "client_service_path", "controller_path", "creation_time", "creator_user_id", "display_name", "entity_name", "is_cover", "last_modification_time", "last_modifier_user_id", "model_path", "remark", "schema", "service_path", "table_name", "type" },
                values: new object[,]
                {
                    { new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), "E:\\5-Gitee\\hzy-microservices\\microservices-client\\src\\views\\Apps", "E:\\5-Gitee\\hzy-microservices\\microservices-client\\src\\views\\Apps", "E:\\5-Gitee\\hzy-microservices\\microservices-client\\src\\services\\Apps", "E:\\5-Gitee\\hzy-microservices\\microservices-server\\HZY.Api.Admin\\Controllers\\Apps", new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "岗位", "SysPost", false, new DateTime(2023, 3, 14, 23, 55, 47, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "E:\\5-Gitee\\hzy-microservices\\microservices-server\\HZY.Core.EntityFramework.Admin\\Entities\\Apps", null, "dbo", "E:\\5-Gitee\\hzy-microservices\\microservices-server\\HZY.Api.Admin\\ApplicationServices\\Apps", "sys_post", "TABLE" },
                    { new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), null, null, null, null, new DateTime(2022, 7, 29, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "", "FlowApprovalStepHistory", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "flow_approval_step_history", "TABLE" },
                    { new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "审批流", "Flow", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "flow", "TABLE" },
                    { new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "菜单功能", "SysMenuFunction", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_menu_function", "TABLE" },
                    { new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "用户与角色", "SysUserRole", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_user_role", "TABLE" },
                    { new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "自定义数据权限", "SysDataAuthorityCustom", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_data_authority_custom", "TABLE" },
                    { new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "操作日志", "SysOperationLog", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_operation_log", "TABLE" },
                    { new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "用户", "SysUser", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_user", "TABLE" },
                    { new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "工作流审批步骤配置", "FlowApprovalStep", false, new DateTime(2022, 7, 29, 21, 59, 11, 0, DateTimeKind.Unspecified), null, null, null, null, null, "flow_approval_step", null },
                    { new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "用户与岗位", "SysUserPost", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_user_post", "TABLE" },
                    { new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), null, null, null, null, new DateTime(2022, 5, 23, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "低代码检索表", "LowCodeSearch", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "low_code_search", "TABLE" },
                    { new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), null, null, null, null, new DateTime(2022, 5, 23, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "低代码表", "LowCodeTable", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "low_code_table", "TABLE" },
                    { new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "功能", "SysFunction", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_function", "TABLE" },
                    { new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "会员", "Member", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "member", "TABLE" },
                    { new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), null, null, null, null, new DateTime(2022, 5, 23, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "低代码表信息", "LowCodeTableInfo", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "low_code_table_info", "TABLE" },
                    { new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "工作流用户审批步骤", "FlowApprovalStepUser", false, new DateTime(2022, 7, 29, 21, 59, 11, 0, DateTimeKind.Unspecified), null, null, null, null, null, "flow_approval_step_user", null },
                    { new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), null, null, null, null, new DateTime(2022, 7, 29, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "", "FlowApprovalStepHistoryUser", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "flow_approval_step_history_user", "TABLE" },
                    { new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), null, null, null, null, new DateTime(2022, 5, 23, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "低代码列表", "LowCodeList", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "low_code_list", "TABLE" },
                    { new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "角色菜单功能关联", "SysRoleMenuFunction", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_role_menu_function", "TABLE" },
                    { new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "工作流节点", "FlowNode", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "flow_node", "TABLE" },
                    { new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "数据字典", "SysDictionary", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_dictionary", "TABLE" },
                    { new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "菜单", "SysMenu", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_menu", "TABLE" },
                    { new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "组织", "SysOrganization", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_organization", "TABLE" },
                    { new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "审批流审批", "FlowApproval", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "flow_approval", "TABLE" },
                    { new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "数据权限", "SysDataAuthority", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_data_authority", "TABLE" },
                    { new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), null, null, null, null, new DateTime(2022, 4, 17, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "角色", "SysRole", false, new DateTime(2022, 8, 1, 20, 32, 25, 0, DateTimeKind.Unspecified), null, null, null, "dbo", null, "sys_role", "TABLE" }
                });

            migrationBuilder.InsertData(
                table: "low_code_table_info",
                columns: new[] { "id", "column_name", "creation_time", "creator_user_id", "cs_field", "cs_type", "database_column_type", "describe", "display_name", "is_identity", "is_nullable", "is_primary", "last_modification_time", "last_modifier_user_id", "low_code_table_id", "max_length", "position" },
                values: new object[,]
                {
                    { new Guid("01ca178c-112a-4a49-d489-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 8, 33 },
                    { new Guid("022c287a-11e3-4234-3392-08da716a5c08"), "UserName", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "UserName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), -1, 28 },
                    { new Guid("042a59e2-72c1-4c38-d52d-08da3d8d5a26"), "ParentId", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "ParentId", "Int32", "int", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 140 },
                    { new Guid("043612f1-e16a-4c44-d497-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 8, 42 },
                    { new Guid("063d44b8-6ce2-47a6-d51a-08da3d8d5a26"), "Browser", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Browser", "String", "varchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 255, 9 },
                    { new Guid("06f4f5a9-f63f-4e47-d485-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "流程名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 255, 29 },
                    { new Guid("0888b15f-3bd2-4881-d523-08da3d8d5a26"), "TakeUpTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "TakeUpTime", "Int64", "bigint", "接口耗时（毫秒）", null, false, false, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 8, 12 },
                    { new Guid("0aa2daab-50df-4397-d51c-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 6, 3 },
                    { new Guid("0b45e9bb-b9f1-4a2f-d526-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 142 },
                    { new Guid("0cfc881c-98d4-4a2c-d4a5-08da3d8d5a26"), "UserName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserName", "String", "varchar(500)", "审批人名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 500, 60 },
                    { new Guid("0df6b078-b248-4c83-d4ab-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 255, 67 },
                    { new Guid("0e19400d-1876-4fe3-d4a7-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 8, 63 },
                    { new Guid("0e864b91-b667-4f53-d4a3-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 8, 54 },
                    { new Guid("0f908e1d-4a82-42c1-d4e8-08da3d8d5a26"), "PermissionType", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "PermissionType", "Int32", "int", "数据权限类型", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), 4, 86 },
                    { new Guid("1121d642-49e8-4b25-d52b-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", "组织名称", false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 133 },
                    { new Guid("11afcf11-9b42-47ce-d4c5-08da3d8d5a26"), "ColumnName", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ColumnName", "String", "varchar(500)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 500, 204 },
                    { new Guid("11f3d291-cf7a-4143-d52a-08da3d8d5a26"), "LevelCode", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LevelCode", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 135 },
                    { new Guid("1213c179-e366-4e3c-d540-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 6, 163 },
                    { new Guid("12e9e9ad-5631-4dc8-d503-08da3d8d5a26"), "JumpUrl", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "JumpUrl", "String", "varchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 255, 122 },
                    { new Guid("134c9f62-abd2-476e-d532-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 6, 150 },
                    { new Guid("135e23db-540b-4096-d551-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), 6, 177 },
                    { new Guid("13775de6-200d-43e0-244c-08da717dbcaa"), "ServiceJsPath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "ServiceJsPath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 218 },
                    { new Guid("158b1c2d-fa67-4696-244b-08da717dbcaa"), "Schema", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "Schema", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 207 },
                    { new Guid("1790b4d5-51b2-4dc0-d534-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 255, 146 },
                    { new Guid("18b4430b-765d-4a71-97b9-08da39a2ef6c"), "UserId", new DateTime(2022, 5, 19, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 19, 22, 26, 18, 0, DateTimeKind.Unspecified), null, new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, 171 },
                    { new Guid("1916e619-4818-4c63-d50b-08da3d8d5a26"), "Show", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Show", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 1, 118 },
                    { new Guid("19a7504c-f740-4b49-d528-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 141 },
                    { new Guid("19fa02fe-fb8f-4631-d50e-08da3d8d5a26"), "Url", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Url", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 113 },
                    { new Guid("1a2a9e15-dc83-49e1-d4b9-08da3d8d5a26"), "Low_Code_Table_InfoId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Low_Code_Table_InfoId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), 16, 188 },
                    { new Guid("1bd2134c-3a2a-4e1b-2446-08da717dbcaa"), "IsCover", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "IsCover", "Boolean", "bit", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 1, 219 },
                    { new Guid("1d3c8224-a3a5-4b88-d4cd-08da3d8d5a26"), "IsPrimary", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "IsPrimary", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 1, 200 },
                    { new Guid("1d881e59-d88e-497f-d51e-08da3d8d5a26"), "FormBody", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "FormBody", "String", "varchar(MAX)", "json表单信息", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), -1, 7 },
                    { new Guid("1e40d97a-49ee-4727-d4c6-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 8, 198 },
                    { new Guid("1fbf9cea-3e4c-401b-243f-08da717dbcaa"), "Id", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", "", false, false, true, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 16, 203 },
                    { new Guid("2006ac52-bb49-4e41-d501-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 109 },
                    { new Guid("200ff922-513c-4b19-d519-08da3d8d5a26"), "Api", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Api", "String", "varchar(500)", "接口地址", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 500, 4 },
                    { new Guid("2029bb6d-a0f2-41de-97b8-08da39a2ef6c"), "RoleId", new DateTime(2022, 5, 19, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "RoleId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 19, 22, 26, 18, 0, DateTimeKind.Unspecified), null, new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, 172 },
                    { new Guid("22527fe7-bd5c-4e6c-3389-08da716a5c08"), "CreationTime", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 8, 31 },
                    { new Guid("2286c948-4f0d-4b66-d535-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 4, 144 },
                    { new Guid("2321aac8-0eed-4b87-d4ac-08da3d8d5a26"), "Remark", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Remark", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 255, 69 },
                    { new Guid("2341dcb1-8056-4a7c-d4eb-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), 8, 89 },
                    { new Guid("235b67f8-62d2-480e-d508-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "编号", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 111 },
                    { new Guid("24db7ed8-1a4f-4b25-d49d-08da3d8d5a26"), "UserName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserName", "String", "varchar(255)", "步骤审批人名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 255, 51 },
                    { new Guid("252ac7b2-0e62-48e1-97b7-08da39a2ef6c"), "LastModificationTime", new DateTime(2022, 5, 19, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 19, 22, 26, 18, 0, DateTimeKind.Unspecified), null, new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, 173 },
                    { new Guid("26f16d3d-9c42-4f86-244e-08da717dbcaa"), "TableName", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "TableName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 206 },
                    { new Guid("2819dfe7-f12b-483c-d4a6-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 16, 61 },
                    { new Guid("287314b2-3141-4957-d548-08da3d8d5a26"), "Email", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Email", "String", "nvarchar(255)", "", "电子邮箱", false, false, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 171 },
                    { new Guid("29b765bd-36f4-462f-d4f3-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Name", "String", "varchar(255)", "分组名/键", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 255, 98 },
                    { new Guid("29d08351-9091-4c91-d514-08da3d8d5a26"), "MenuId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "MenuId", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 4, 128 },
                    { new Guid("2a1c3f3d-4efc-472b-d49a-08da3d8d5a26"), "SortMore", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "SortMore", "Int32", "int", "多次审批顺序号（可能是多次审批次数）", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 4, 47 },
                    { new Guid("2ae91c1d-d618-4267-d4b3-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 8, 190 },
                    { new Guid("2b4747ed-0409-4d14-d48b-08da3d8d5a26"), "FlowId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowId", "Guid", "uniqueidentifier", "流程Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 16, 38 },
                    { new Guid("2ca9aa7e-321e-47f0-d4f0-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "创建时间", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 8, 94 },
                    { new Guid("2ffaa9ee-c286-4f90-d495-08da3d8d5a26"), "FlowNodeId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowNodeId", "Guid", "uniqueidentifier", "审批流节点Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 16, 45 },
                    { new Guid("3051fb7c-f075-4d91-2443-08da717dbcaa"), "EntityName", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "EntityName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 210 },
                    { new Guid("3071360b-c1ef-4dff-d48f-08da3d8d5a26"), "LaunchTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LaunchTime", "DateTime", "datetime", "发起时间", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 8, 36 },
                    { new Guid("3133985d-586c-4c4e-d4ff-08da3d8d5a26"), "Close", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Close", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 1, 119 },
                    { new Guid("325af03c-cbb7-4de6-d4ee-08da3d8d5a26"), "SysOrganizationId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "SysOrganizationId", "Int32", "int", "", null, false, false, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), 4, 91 },
                    { new Guid("3b959124-21d2-45b9-d4ca-08da3d8d5a26"), "Describe", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Describe", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 50, 205 },
                    { new Guid("3d9c98e4-2ac7-40fd-3391-08da716a5c08"), "UserId", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 16, 27 },
                    { new Guid("3f7e43c9-762f-48ea-d53a-08da3d8d5a26"), "DeleteLock", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "DeleteLock", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 1, 157 },
                    { new Guid("42430604-7090-442d-d539-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 6, 153 },
                    { new Guid("4467bf43-6e95-4798-d522-08da3d8d5a26"), "QueryString", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "QueryString", "String", "varchar(MAX)", "地址栏信息", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), -1, 8 },
                    { new Guid("46bac66f-3cf0-46b3-d546-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", "创建时间", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 166 },
                    { new Guid("4736479f-6089-4141-d521-08da3d8d5a26"), "OS", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "OS", "String", "varchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 255, 10 },
                    { new Guid("48b12860-84de-4f7b-d4c9-08da3d8d5a26"), "DatabaseColumnType", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "DatabaseColumnType", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 50, 206 },
                    { new Guid("495fe86e-5bd6-44d4-d4a1-08da3d8d5a26"), "FlowNodeId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowNodeId", "Guid", "uniqueidentifier", "审批节点Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 16, 57 },
                    { new Guid("498327eb-5676-4091-d4fe-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Id", "Int32", "int", "", null, true, false, true, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 107 },
                    { new Guid("4aaa1e18-8c06-4806-d4d1-08da3d8d5a26"), "Position", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Position", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 4, 203 },
                    { new Guid("4b5bc027-5663-463a-d54b-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", "用户名称", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 167 },
                    { new Guid("4c479d54-530f-4652-d552-08da3d8d5a26"), "PostId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "PostId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), 16, 176 },
                    { new Guid("50b6b2fc-3e73-457c-338b-08da716a5c08"), "FlowNodeName", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "FlowNodeName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), -1, 23 },
                    { new Guid("517cbfe0-275d-4f36-d53b-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 6, 152 },
                    { new Guid("51d2eb90-7ab9-4763-3387-08da716a5c08"), "Id", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", "", false, false, true, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 16, 20 },
                    { new Guid("5257ad4f-589d-40d0-d533-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 6, 149 },
                    { new Guid("54a0ed42-104e-4e2a-2445-08da717dbcaa"), "InfoVuePath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "InfoVuePath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 217 },
                    { new Guid("5541e535-7cbe-43d2-d4d4-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "创建时间", "创建时间", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 80 },
                    { new Guid("564a907b-1f47-4849-d537-08da3d8d5a26"), "State", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "State", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 4, 147 },
                    { new Guid("585e18ea-ab50-4216-d4b5-08da3d8d5a26"), "Low_Code_TableId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Low_Code_TableId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 16, 192 },
                    { new Guid("59cfb48c-8d3f-43d7-244f-08da717dbcaa"), "Type", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "Type", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 208 },
                    { new Guid("59f5d993-e502-4fee-3393-08da716a5c08"), "Id", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", "", false, false, true, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 16, 32 },
                    { new Guid("5a9fa990-b6d6-445f-d54c-08da3d8d5a26"), "OrganizationId", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "OrganizationId", "Int32", "int", "", "组织id", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 173 },
                    { new Guid("5aa598a9-6e52-4ae4-d50a-08da3d8d5a26"), "Router", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Router", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 114 },
                    { new Guid("5aed3feb-3d77-4e1e-d52c-08da3d8d5a26"), "OrderNumber", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "OrderNumber", "Int32", "int", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 134 },
                    { new Guid("5bcf7406-75cc-4171-d545-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 164 },
                    { new Guid("5ca84ecf-5971-45bc-d4a8-08da3d8d5a26"), "FlowCode", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowCode", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 255, 65 },
                    { new Guid("5cb41f1c-e68a-47f9-d486-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "排序号", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 4, 27 },
                    { new Guid("5f5c2997-daa8-491c-d51d-08da3d8d5a26"), "Form", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Form", "String", "varchar(MAX)", "表单信息", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), -1, 6 },
                    { new Guid("5f9a4a78-1bb9-4592-d536-08da3d8d5a26"), "Remarks", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Remarks", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 255, 148 },
                    { new Guid("5fc01eb0-4833-4e93-d483-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 8, 26 },
                    { new Guid("5fea8348-aa6b-4577-d4cc-08da3d8d5a26"), "IsNullable", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "IsNullable", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 1, 202 },
                    { new Guid("60019cd9-49eb-489b-97b5-08da39a2ef6c"), "Id", new DateTime(2022, 5, 19, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "Id", null, false, false, true, new DateTime(2022, 5, 19, 22, 26, 18, 0, DateTimeKind.Unspecified), null, new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, 170 },
                    { new Guid("609a52aa-48b2-4e64-d48e-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 8, 32 },
                    { new Guid("6284c929-4115-4c17-d491-08da3d8d5a26"), "UserName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserName", "String", "varchar(255)", "发起人", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 255, 35 },
                    { new Guid("6304e602-84a1-4c57-d4ec-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), 8, 88 },
                    { new Guid("643c3aa6-d639-46bd-339a-08da716a5c08"), "UserName", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "UserName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), -1, 37 },
                    { new Guid("646614d9-d7f3-42c5-d4fd-08da3d8d5a26"), "Remark", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Remark", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 255, 104 },
                    { new Guid("66718de6-5c1a-4229-d524-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "当前操作人id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 16, 11 },
                    { new Guid("669b87ce-c694-4c8c-d4da-08da3d8d5a26"), "Phone", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Phone", "String", "nvarchar(255)", "", "联系电话", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 73 },
                    { new Guid("69875823-326c-4e13-d538-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 16, 151 },
                    { new Guid("6aa13b8f-1e3c-4750-d530-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 16, 143 },
                    { new Guid("6c3bb548-aafc-4f16-d50d-08da3d8d5a26"), "Type", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Type", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 4, 123 },
                    { new Guid("6c934348-be20-4c9e-d542-08da3d8d5a26"), "MenuFunctionId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "MenuFunctionId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 16, 161 },
                    { new Guid("6cfe3b57-006f-436b-d511-08da3d8d5a26"), "FunctionCode", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "FunctionCode", "String", "varchar(100)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 100, 129 },
                    { new Guid("6e69cf9b-d9cd-4c31-d4f4-08da3d8d5a26"), "ParentId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ParentId", "Int32", "int", "父级分组id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 4, 99 },
                    { new Guid("70e30a70-99f9-44b3-d482-08da3d8d5a26"), "Code", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Code", "String", "nvarchar(255)", "编码", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 255, 28 },
                    { new Guid("7211aea6-eb91-41e5-d505-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 108 },
                    { new Guid("72ac247c-d792-4fee-d4dc-08da3d8d5a26"), "Sex", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Sex", "String", "nvarchar(255)", "", "性别", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 74 },
                    { new Guid("73d17476-e006-4530-d4ad-08da3d8d5a26"), "RoleId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "RoleId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 16, 68 },
                    { new Guid("743d6eab-b4c8-4a15-d4f8-08da3d8d5a26"), "ByName", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ByName", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 255, 103 },
                    { new Guid("7485deed-e9e8-4aa6-338a-08da716a5c08"), "FlowNodeId", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "FlowNodeId", "Guid", "uniqueidentifier", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 16, 22 },
                    { new Guid("78757b0d-d9ee-45ea-d500-08da3d8d5a26"), "ComponentName", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "ComponentName", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 115 },
                    { new Guid("79d371fb-b37a-4d32-3390-08da716a5c08"), "State", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "State", "Int32", "int", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 4, 25 },
                    { new Guid("7b4df31f-36a3-477c-d4ba-08da3d8d5a26"), "Low_Code_TableId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Low_Code_TableId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), 16, 187 },
                    { new Guid("7b6df0cd-c31b-4508-d53f-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 16, 158 },
                    { new Guid("7b900baf-65df-4910-d4b1-08da3d8d5a26"), "ForeignKeyTableFieldName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "ForeignKeyTableFieldName", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 50, 195 },
                    { new Guid("7c7400ed-ec08-4832-d4b6-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), 16, 184 },
                    { new Guid("7cbe8988-cbac-4ea2-d54a-08da3d8d5a26"), "LoginName", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LoginName", "String", "nvarchar(255)", "", "登录名称", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 168 },
                    { new Guid("7ec46123-3852-4b62-2440-08da717dbcaa"), "ControllerPath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "ControllerPath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 215 },
                    { new Guid("803c2d4b-4a80-43b0-244a-08da717dbcaa"), "Remark", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "Remark", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 211 },
                    { new Guid("8237d289-05cf-485b-d4b8-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), 8, 185 },
                    { new Guid("825e69b9-cd33-4ab8-97b6-08da39a2ef6c"), "CreationTime", new DateTime(2022, 5, 19, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 19, 22, 26, 18, 0, DateTimeKind.Unspecified), null, new Guid("3da5d264-2e8d-460c-a10c-ff9a6bb57a60"), null, 174 },
                    { new Guid("82ee25d2-4e01-4100-d4f9-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 6, 106 },
                    { new Guid("8326ca11-09f1-4c38-d4d6-08da3d8d5a26"), "Introduce", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Introduce", "String", "nvarchar(255)", "", "简介", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 77 },
                    { new Guid("837b058b-a88e-4107-d4dd-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "所属用户", "所属用户", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 79 },
                    { new Guid("84a87e33-8b66-4b9a-d4f5-08da3d8d5a26"), "Sort", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Sort", "Int32", "int", "排序号", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 4, 95 },
                    { new Guid("86b95bf0-4418-46ba-d4cb-08da3d8d5a26"), "IsIdentity", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "IsIdentity", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 1, 201 },
                    { new Guid("897a208c-2e13-46f1-d4d7-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "更新时间", "更新时间", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 81 },
                    { new Guid("8ad408db-b5aa-4cb7-d494-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 8, 43 },
                    { new Guid("8e5f9439-6b90-423a-2447-08da717dbcaa"), "LastModificationTime", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 8, 204 },
                    { new Guid("8f107c7c-e4f5-4647-338f-08da716a5c08"), "SortMore", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "SortMore", "Int32", "int", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 4, 24 },
                    { new Guid("9059bf44-23a0-4e12-3399-08da716a5c08"), "UserId", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 16, 36 },
                    { new Guid("92bc9094-160e-4338-d4a4-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "审批人Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 16, 59 },
                    { new Guid("92c1fffc-5a00-468c-d4b0-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 8, 191 },
                    { new Guid("95414873-486d-4609-338e-08da716a5c08"), "Sort", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "Sort", "Int32", "int", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 4, 21 },
                    { new Guid("97284d66-88b9-478f-d4e5-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), 16, 82 },
                    { new Guid("9a050102-6300-46ef-d516-08da3d8d5a26"), "Remark", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Remark", "String", "varchar(100)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 100, 131 },
                    { new Guid("9a850f29-2dd2-4779-d4f6-08da3d8d5a26"), "Value", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Value", "String", "varchar(255)", "值", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 255, 97 },
                    { new Guid("9b1b319a-e9dc-406d-d4c4-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 16, 196 },
                    { new Guid("9bc385e0-10ee-4299-d4a9-08da3d8d5a26"), "FlowId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 16, 64 },
                    { new Guid("9c4158f4-b5b5-4928-d50f-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 16, 124 },
                    { new Guid("9c9f9672-3fa0-4c65-d4e9-08da3d8d5a26"), "RoleId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "RoleId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), 16, 85 },
                    { new Guid("9de60dd7-a403-442d-d4e7-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), 8, 83 },
                    { new Guid("a06381ef-e532-4b7a-2442-08da717dbcaa"), "DisplayName", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "DisplayName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), -1, 209 },
                    { new Guid("a0fdeb45-c9fe-439b-d48a-08da3d8d5a26"), "FlowCode", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowCode", "String", "varchar(255)", "流程编码", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 255, 39 },
                    { new Guid("a2660342-556e-4aef-d4b4-08da3d8d5a26"), "Low_Code_Table_InfoId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Low_Code_Table_InfoId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 16, 193 },
                    { new Guid("a29e0236-9c06-4a70-d4b7-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69edd8a8-1d24-478c-a909-b82039edcec0"), 8, 186 },
                    { new Guid("a61101b5-8e66-4456-d4fa-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 6, 105 },
                    { new Guid("a62bb184-93b0-40e3-d51b-08da3d8d5a26"), "ControllerDisplayName", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ControllerDisplayName", "String", "varchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 255, 13 },
                    { new Guid("a6752bd9-f3d6-451f-d547-08da3d8d5a26"), "DeleteLock", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "DeleteLock", "Boolean", "bit", "", "删除锁", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 172 },
                    { new Guid("a7263191-1e30-42c5-3396-08da716a5c08"), "FlowNodeId", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "FlowNodeId", "Guid", "uniqueidentifier", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 16, 34 },
                    { new Guid("a72c0341-82e8-48ad-d481-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 16, 24 },
                    { new Guid("a8be7873-7ce4-4cb2-d498-08da3d8d5a26"), "OpinIons", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "OpinIons", "String", "varchar(255)", "步骤审批意见", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 255, 49 },
                    { new Guid("a908815c-c0e6-4565-d512-08da3d8d5a26"), "FunctionName", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "FunctionName", "String", "varchar(100)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 100, 130 },
                    { new Guid("a932f1ce-a55a-480b-d520-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 6, 2 },
                    { new Guid("a9766bbb-21bf-46da-d54f-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), 16, 174 },
                    { new Guid("aaa312a2-73fb-4c84-d496-08da3d8d5a26"), "FlowNodeName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowNodeName", "String", "varchar(255)", "审批流节点名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 255, 46 },
                    { new Guid("aaa5fae3-8c5b-4427-d4fb-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 255, 102 },
                    { new Guid("aaecfda3-f48d-4cd5-244d-08da717dbcaa"), "ServicePath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "ServicePath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 214 },
                    { new Guid("ab5c0b3d-8871-42fd-d4f1-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Int32", "int", "id", null, true, false, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 4, 92 },
                    { new Guid("aba55ad7-7153-4658-d4f2-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "更新时间", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 8, 93 },
                    { new Guid("acf079d0-3db9-43f7-d490-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "发起人Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 16, 34 },
                    { new Guid("ae55fabc-3944-4a36-d49f-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 8, 55 },
                    { new Guid("b1f89f8d-8e22-4c4a-d504-08da3d8d5a26"), "KeepAlive", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "KeepAlive", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 1, 120 },
                    { new Guid("b24ac0e3-71ab-4d48-d541-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 6, 162 },
                    { new Guid("b52a9e8c-dffb-40b7-d506-08da3d8d5a26"), "LevelCode", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LevelCode", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 110 },
                    { new Guid("b6422cb6-498e-4ff5-d4e6-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("e79db53b-7162-4669-9b5e-f860501475ac"), 8, 84 },
                    { new Guid("b754af63-f1de-4000-d4a0-08da3d8d5a26"), "FlowApprovalStepId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowApprovalStepId", "Guid", "uniqueidentifier", "步骤Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 16, 56 },
                    { new Guid("b755e2af-1164-47de-2444-08da717dbcaa"), "IndexVuePath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "IndexVuePath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 216 },
                    { new Guid("b76500c1-91f8-4e44-d531-08da3d8d5a26"), "Code", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Code", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("0a8bdb18-758a-4798-9ffc-e7031dcbf262"), 255, 145 },
                    { new Guid("b7fbb61f-94fc-4242-d4d3-08da3d8d5a26"), "Birthday", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Birthday", "DateTime", "datetime2", "", "生日", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 75 },
                    { new Guid("b9bbab1d-0a03-4d07-d488-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 16, 31 },
                    { new Guid("b9bfca2e-f72b-4a3f-d52f-08da3d8d5a26"), "State", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "State", "Int32", "int", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 139 },
                    { new Guid("ba392537-c1c5-4ecc-d517-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 16, 1 },
                    { new Guid("bbac9a7c-6e62-4fe6-d4ef-08da3d8d5a26"), "Code", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Code", "String", "varchar(255)", "编码", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("af37f705-7ba0-4883-b1be-8a274ea4c026"), 255, 96 },
                    { new Guid("be481209-565b-4099-d53c-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 255, 155 },
                    { new Guid("be6f08b8-b14b-4253-2441-08da717dbcaa"), "CreationTime", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 8, 205 },
                    { new Guid("bf24a276-6ed0-49d4-d4d9-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Number", "String", "nvarchar(255)", "", "编号", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 71 },
                    { new Guid("bf3dbedf-ade0-4e20-338d-08da716a5c08"), "Opinions", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "Opinions", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), -1, 26 },
                    { new Guid("c1ae4945-25fc-45e9-3388-08da716a5c08"), "ApprovalDate", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "ApprovalDate", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 8, 29 },
                    { new Guid("c2f1a286-2b35-41d6-d4af-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 16, 189 },
                    { new Guid("c6042620-d052-4a60-2448-08da717dbcaa"), "ModelPath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "ModelPath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 213 },
                    { new Guid("c7b2ad1d-ecb0-4497-d515-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 4, 127 },
                    { new Guid("c82d5132-6cda-463e-d54e-08da3d8d5a26"), "Phone", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Phone", "String", "nvarchar(255)", "", "联系电话", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 170 },
                    { new Guid("ca605278-6972-48b4-d51f-08da3d8d5a26"), "Ip", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Ip", "String", "varchar(255)", "ip地址", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 255, 5 },
                    { new Guid("caae5d6f-f9c7-4edb-d48d-08da3d8d5a26"), "FormId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FormId", "String", "varchar(50)", "表单Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 50, 37 },
                    { new Guid("caff37bf-4e91-4934-2449-08da717dbcaa"), "ProjectRootPath", new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, "ProjectRootPath", "String", "varchar(50)", "", "", false, true, false, new DateTime(2022, 7, 30, 0, 16, 47, 0, DateTimeKind.Unspecified), null, new Guid("6ba9805c-916e-4d2c-99d0-216fcbc361cc"), 50, 212 },
                    { new Guid("cb4a19d3-35dd-416d-3394-08da716a5c08"), "CreationTime", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 8, 39 },
                    { new Guid("cb5f9ecf-9317-4b11-d553-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), 16, 175 },
                    { new Guid("cbd75568-2ece-4f90-d49b-08da3d8d5a26"), "State", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "State", "Int32", "int", "步骤状态（待审批、同意、不同意、回退升级审批）", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 4, 48 },
                    { new Guid("ccc3f055-79c4-4e63-3397-08da716a5c08"), "FlowNodeName", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "FlowNodeName", "String", "nvarchar(MAX)", "", "", false, true, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), -1, 35 },
                    { new Guid("ce802713-74f5-4f30-d527-08da3d8d5a26"), "Email", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Email", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 138 },
                    { new Guid("cf2e3691-ab88-4420-d529-08da3d8d5a26"), "Leader", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Leader", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 136 },
                    { new Guid("cf99d60b-2392-493c-d4ce-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 8, 197 },
                    { new Guid("d0fbf229-7204-4494-d50c-08da3d8d5a26"), "State", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "State", "Boolean", "bit", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 1, 121 },
                    { new Guid("d1eb49cf-c053-4226-d4d8-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", "会员名称", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 72 },
                    { new Guid("d41bd8db-1b3f-48fa-d543-08da3d8d5a26"), "MenuId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "MenuId", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 4, 160 },
                    { new Guid("d45ac420-e348-4d6b-d4aa-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 8, 62 },
                    { new Guid("d48c70e6-4549-41b6-d4a2-08da3d8d5a26"), "FlowNodeName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowNodeName", "String", "varchar(500)", "审批节点名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 500, 58 },
                    { new Guid("d550fb44-f912-434e-3395-08da716a5c08"), "FlowApprovalStepHistoryId", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "FlowApprovalStepHistoryId", "Guid", "uniqueidentifier", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 16, 33 },
                    { new Guid("d5e76d95-beed-43c9-3398-08da716a5c08"), "LastModificationTime", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("7f94e0db-fc63-40dc-bfe3-18c5aad75975"), 8, 38 },
                    { new Guid("d6008705-0d21-42ac-d525-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Id", "Int32", "int", "", null, true, false, true, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 132 },
                    { new Guid("db4510e1-40d2-4db4-338c-08da716a5c08"), "LastModificationTime", new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", "", false, false, false, new DateTime(2022, 7, 29, 21, 58, 5, 0, DateTimeKind.Unspecified), null, new Guid("18fbb18e-cb29-45d8-a5f3-c0121c57680a"), 8, 30 },
                    { new Guid("dbe000fc-4895-42f2-d53e-08da3d8d5a26"), "Remark", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Remark", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 255, 156 },
                    { new Guid("dd367fd5-2030-43b2-d53d-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("f3d7bbb3-c1fb-4d61-92a4-9bc101811335"), 4, 154 },
                    { new Guid("de43269d-d43b-4a77-d4d0-08da3d8d5a26"), "MaxLength", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "MaxLength", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 4, 209 },
                    { new Guid("de898f57-abe7-4d2c-d4ed-08da3d8d5a26"), "SysDataAuthorityId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "SysDataAuthorityId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), 16, 90 },
                    { new Guid("df559c6b-6f60-467c-d4ea-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("524e71b4-cbf7-4248-8b29-3f99b43f2eb2"), 16, 87 },
                    { new Guid("e0e9d3c3-b713-419c-d4c7-08da3d8d5a26"), "CsField", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CsField", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 50, 208 },
                    { new Guid("e1316750-62a4-46aa-d4f7-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 16, 100 },
                    { new Guid("e346cf76-ec76-4409-d49e-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("7ad3b915-f0bd-443a-89cd-42d41dd6c554"), 16, 53 },
                    { new Guid("e36410b5-cb7c-4fc3-d54d-08da3d8d5a26"), "Password", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Password", "String", "nvarchar(255)", "", "密码", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 169 },
                    { new Guid("e4245f5f-bffa-43f0-d4d5-08da3d8d5a26"), "FilePath", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "FilePath", "String", "nvarchar(255)", "文件地址", "文件地址", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 78 },
                    { new Guid("e4dd55f0-9697-43ae-d513-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 6, 125 },
                    { new Guid("e5418d61-916f-45fd-d549-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime2", "", "更新时间", false, true, false, new DateTime(2022, 12, 7, 11, 6, 31, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new Guid("6323638b-a45f-4a76-886e-69a9e9be0901"), null, 165 },
                    { new Guid("e571fd26-b1a8-4648-d4ae-08da3d8d5a26"), "Sort", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Sort", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("ae6d94d8-6a15-4348-b600-aa17e4b61718"), 4, 66 },
                    { new Guid("e67fd0c6-a997-4956-d49c-08da3d8d5a26"), "UserId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "UserId", "Guid", "uniqueidentifier", "步骤审批人Id", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 16, 50 },
                    { new Guid("e74c1f4b-af12-4eaa-d507-08da3d8d5a26"), "Name", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Name", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 112 },
                    { new Guid("e75b8650-ee49-4f83-d4d2-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 70 },
                    { new Guid("e7facee2-5132-4003-d4b2-08da3d8d5a26"), "ForeignKeyTableId", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "ForeignKeyTableId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("852f53ff-0d00-4c32-aa55-a9c11993751b"), 16, 194 },
                    { new Guid("e8e60481-fb7f-4f1d-d499-08da3d8d5a26"), "Sort", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Sort", "Int32", "int", "步骤顺序号", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 4, 44 },
                    { new Guid("ea63351c-c203-4d40-d52e-08da3d8d5a26"), "Phone", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Phone", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 6, 9, 21, 20, 26, 0, DateTimeKind.Unspecified), null, new Guid("d26d07cb-158a-4cb2-8b20-5dfd5181af54"), null, 137 },
                    { new Guid("eb846ac3-723e-4207-d4c8-08da3d8d5a26"), "CsType", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CsType", "String", "varchar(50)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 50, 207 },
                    { new Guid("ee8ca902-4e27-40c5-d518-08da3d8d5a26"), "ActionDisplayName", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ActionDisplayName", "String", "varchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("60cceba1-28bf-4d1d-b603-4edf95d512b8"), 255, 14 },
                    { new Guid("f00cde73-2294-40d6-d48c-08da3d8d5a26"), "FlowName", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "FlowName", "String", "varchar(255)", "流程名称", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("d8948c56-c5bd-4061-b272-5417375f38f0"), 255, 40 },
                    { new Guid("f029b676-48ac-4ba3-d509-08da3d8d5a26"), "ParentId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "ParentId", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), 4, 117 },
                    { new Guid("f03ac01c-e0cf-4f13-d4db-08da3d8d5a26"), "Photo", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Photo", "String", "nvarchar(255)", "", "头像", false, true, false, new DateTime(2022, 6, 8, 21, 20, 4, 0, DateTimeKind.Unspecified), null, new Guid("73c97832-4e7f-4758-86d2-94327971b5fd"), null, 76 },
                    { new Guid("f21d4c33-e65a-4dfe-d487-08da3d8d5a26"), "Remark", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Remark", "String", "nvarchar(255)", "备注", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 255, 30 },
                    { new Guid("f221da94-0a1d-4ce7-d4cf-08da3d8d5a26"), "Low_Code_TableId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Low_Code_TableId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("79fbd4ec-9f4e-45dc-8065-70f2eb422cdf"), 16, 199 },
                    { new Guid("f24f0e45-209e-46b7-d544-08da3d8d5a26"), "RoleId", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "RoleId", "Guid", "uniqueidentifier", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("8da38d20-8a09-4e81-8dd8-ed6702aee380"), 16, 159 },
                    { new Guid("f5193134-b39d-4ca0-d502-08da3d8d5a26"), "Icon", new DateTime(2022, 5, 24, 0, 0, 0, 0, DateTimeKind.Unspecified), null, "Icon", "String", "nvarchar(255)", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 58, 7, 0, DateTimeKind.Unspecified), null, new Guid("d2600250-6f32-4d7d-8395-96cc9fa36db4"), null, 116 },
                    { new Guid("f5c93cc7-50a6-4e0e-d492-08da3d8d5a26"), "Id", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "Id", "Guid", "uniqueidentifier", "", null, false, false, true, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 16, 41 },
                    { new Guid("f6d23541-2fca-40e6-d493-08da3d8d5a26"), "ApprovalDate", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "ApprovalDate", "DateTime", "datetime", "审批时间", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("651bb982-1130-4e1c-9070-36b90dcf2324"), 8, 52 },
                    { new Guid("f731ccd3-9a9c-4dda-d550-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("69b24f04-0ed3-45fc-91d9-0dc929175a57"), 6, 178 },
                    { new Guid("f9fd0e13-4e5d-42b4-d4fc-08da3d8d5a26"), "Number", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "Number", "Int32", "int", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("6fabc67a-8b48-49a6-8ba1-c8a32c499d36"), 4, 101 },
                    { new Guid("fbf2d2c1-454b-4898-d510-08da3d8d5a26"), "CreationTime", new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, "CreationTime", "DateTime", "datetime2", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 34, 0, DateTimeKind.Unspecified), null, new Guid("2ae9e532-7d9a-474b-b629-50a39945c44d"), 6, 126 },
                    { new Guid("fd9abf54-3c88-44b0-d484-08da3d8d5a26"), "LastModificationTime", new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, "LastModificationTime", "DateTime", "datetime", "", null, false, true, false, new DateTime(2022, 5, 24, 21, 57, 33, 0, DateTimeKind.Unspecified), null, new Guid("1a8df018-79f8-4e26-b4eb-4b735aae7275"), 8, 25 }
                });

            migrationBuilder.InsertData(
                table: "member",
                columns: new[] { "id", "birthday", "creation_time", "creator_user_id", "file_path", "introduce", "last_modification_time", "last_modifier_user_id", "name", "number", "phone", "photo", "sex", "user_id" },
                values: new object[,]
                {
                    { new Guid("96a1aa3d-a61a-42d0-954a-c71753fb2065"), new DateTime(2018, 4, 25, 23, 0, 0, 0, DateTimeKind.Unspecified), new DateTime(2020, 10, 24, 0, 7, 42, 0, DateTimeKind.Unspecified), null, "[{\"uid\":\"a6778e9d-6c2e-4d23-91c9-d0d10756d177\",\"name\":\"time_000345_old_name_hzy.png\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000345_old_name_hzy.png\",\"url\":\"/upload/files/20220731/time_000345_old_name_hzy.png\"}]", "<p>123</p>", new DateTime(2022, 7, 31, 0, 3, 48, 0, DateTimeKind.Unspecified), null, "123", "123", "123", "[{\"uid\":\"d80bbe3d-7296-4eb9-965a-cb3f03d3def7\",\"name\":\"time_000335_old_name_微信图片_20200413162625.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\",\"url\":\"/upload/files/20220731/time_000335_old_name_微信图片_20200413162625.jpg\"}]", "女", new Guid("ac18f496-e93d-42f0-b59e-e321acc85335") },
                    { new Guid("9a604aa2-9ae6-4a2f-8ddb-d9e0289ead9e"), new DateTime(2019, 7, 8, 11, 47, 24, 0, DateTimeKind.Unspecified), new DateTime(2018, 4, 25, 23, 0, 0, 0, DateTimeKind.Unspecified), null, "[{\"uid\":\"35828ad6-cbba-4bcb-9c97-141d5b31acc7\",\"name\":\"time_000320_old_name_Ko.js增删改查例子.txt\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\",\"url\":\"/upload/files/20220731/time_000320_old_name_Ko.js增删改查例子.txt\"}]", "<p>999888</p>", new DateTime(2022, 7, 31, 0, 3, 23, 0, DateTimeKind.Unspecified), null, "测试会员", "1", "18510912123", "[{\"uid\":\"6f5aed63-0fdc-4752-9c2b-3f66cbfa77bf\",\"name\":\"time_000222_old_name_微信图片_20200521081252.jpg\",\"percent\":100,\"status\":\"done\",\"thumbUrl\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\",\"url\":\"/upload/files/20220731/time_000222_old_name_微信图片_20200521081252.jpg\"}]", "男", new Guid("ac18f496-e93d-42f0-b59e-e321acc85335") }
                });

            migrationBuilder.InsertData(
                table: "quartz_job_task",
                columns: new[] { "id", "creation_time", "creator_user_id", "cron", "execute_time", "group_name", "job_point", "last_modification_time", "last_modifier_user_id", "name", "remark", "requset_mode", "state", "type" },
                values: new object[,]
                {
                    { new Guid("0af155d7-a8ee-4a07-ab1a-40dd0c77d7ea"), new DateTime(2023, 1, 29, 11, 36, 30, 0, DateTimeKind.Unspecified), new Guid("00000000-0000-0000-0000-000000000000"), "0/10 * * * * ?", null, "TEST", "http://localhost:5600/api/job/JobTest/Test", new DateTime(2023, 3, 9, 14, 33, 11, 0, DateTimeKind.Unspecified), new Guid("00000000-0000-0000-0000-000000000000"), "默认测试接口", "用于测试", 1, 0, 1 },
                    { new Guid("b871a81b-fda6-42b0-bf48-08db0369c499"), new DateTime(2023, 1, 31, 17, 1, 40, 0, DateTimeKind.Unspecified), new Guid("00000000-0000-0000-0000-000000000000"), "0/10 * * * * ?", null, "HZY.Managers.CalcDataManager", "HZY.Managers.CalcDataManager>Run", new DateTime(2023, 3, 16, 21, 47, 14, 0, DateTimeKind.Unspecified), new Guid("00000000-0000-0000-0000-000000000000"), "Run", null, null, 1, 2 }
                });

            migrationBuilder.InsertData(
                table: "sys_data_authority",
                columns: new[] { "id", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "permission_type", "role_id" },
                values: new object[,]
                {
                    { new Guid("0228a5b5-2202-4ba0-6e48-08da205da7b7"), new DateTime(2022, 4, 17, 18, 33, 4, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 4, 17, 18, 33, 4, 0, DateTimeKind.Unspecified), null, 5, new Guid("18fa4771-6f58-46a3-80d2-6f0f5e9972e3") },
                    { new Guid("d09bf250-c5b0-41cb-237d-08da00442990"), new DateTime(2022, 3, 7, 22, 9, 58, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 7, 6, 21, 53, 17, 0, DateTimeKind.Unspecified), null, 5, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3") }
                });

            migrationBuilder.InsertData(
                table: "sys_dictionary",
                columns: new[] { "id", "code", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "name", "parent_id", "sort", "value" },
                values: new object[,]
                {
                    { 1, "news_type", new DateTime(2021, 7, 25, 22, 31, 30, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 7, 25, 22, 39, 34, 0, DateTimeKind.Unspecified), null, "资讯类别", null, 1, null },
                    { 2, "news_type_nan", new DateTime(2021, 7, 25, 22, 38, 49, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 7, 25, 22, 40, 30, 0, DateTimeKind.Unspecified), null, "男", 1, 1, "1" },
                    { 3, "news_type_nv", new DateTime(2021, 7, 25, 22, 40, 47, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 7, 6, 21, 55, 30, 0, DateTimeKind.Unspecified), null, "女", 1, 2, "2" },
                    { 4, "3", new DateTime(2022, 6, 29, 20, 55, 46, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 6, 29, 20, 55, 46, 0, DateTimeKind.Unspecified), null, "未知", 1, 0, "3" }
                });

            migrationBuilder.InsertData(
                table: "sys_function",
                columns: new[] { "id", "by_name", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "name", "number", "remark" },
                values: new object[,]
                {
                    { new Guid("2401f4d0-60b0-4e2e-903f-84c603373572"), "Export", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "导出", 70, "Export" },
                    { new Guid("383e7ee2-7690-46ac-9230-65155c84aa30"), "Save", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 9, 28, 22, 12, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "保存", 50, "Save" },
                    { new Guid("9c388461-2704-4c5e-a729-72c17e9018e1"), "Delete", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "删除", 40, "Delete" },
                    { new Guid("b6fd5425-504a-46a9-993b-2f8dc9158eb8"), "Print", new DateTime(2022, 6, 16, 17, 28, 0, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "打印", 80, "Print" },
                    { new Guid("bffefb1c-8988-4ddf-b4ac-81c2b30e80cd"), "Insert", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "添加", 20, "Insert" },
                    { new Guid("c9518758-b2e1-4f51-b517-5282e273889c"), "Display", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "显示", 10, "Display" },
                    { new Guid("e7ef2a05-8317-41c3-b588-99519fe88bf9"), "Update", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "修改", 30, "Update" },
                    { new Guid("f27ecb0a-197d-47b1-b243-59a8c71302bf"), "Search", new DateTime(2016, 6, 20, 13, 40, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 4, 18, 22, 8, 6, 0, DateTimeKind.Unspecified), null, "检索", 60, "Search" }
                });

            migrationBuilder.InsertData(
                table: "sys_menu",
                columns: new[] { "id", "close", "component_name", "creation_time", "creator_user_id", "icon", "jump_url", "keep_alive", "last_modification_time", "last_modifier_user_id", "level_code", "mode", "module_url", "module_url_pro", "name", "number", "parent_id", "router", "show", "state", "type", "url" },
                values: new object[,]
                {
                    { 1, true, null, new DateTime(2021, 5, 28, 11, 49, 2, 0, DateTimeKind.Unspecified), null, "MoreOutlined", null, true, new DateTime(2022, 3, 4, 12, 25, 39, 0, DateTimeKind.Unspecified), null, "1", 1, null, null, "更多示例", 10, null, null, true, true, 1, null },
                    { 2, true, "AppComponentsCom", new DateTime(2021, 1, 16, 16, 5, 22, 0, DateTimeKind.Unspecified), null, "LayoutOutlined", null, true, new DateTime(2022, 3, 18, 12, 6, 20, 0, DateTimeKind.Unspecified), null, "1.2", 1, null, null, "查看更多组件", 10, 1, "/app/components", true, true, 2, "views/example/AppComponents.vue" },
                    { 3, true, "ButtonCom", new DateTime(2020, 12, 17, 14, 58, 5, 0, DateTimeKind.Unspecified), null, "AppstoreOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 14, 0, DateTimeKind.Unspecified), null, "1.3", 1, null, null, "按钮", 30, 1, "/button", true, true, 2, "views/example/Button.vue" },
                    { 4, true, null, new DateTime(2021, 1, 16, 16, 6, 33, 0, DateTimeKind.Unspecified), null, "PieChartOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 21, 0, DateTimeKind.Unspecified), null, "1.4", 1, null, null, "图表 AntV G2", 40, 1, null, true, true, 1, null },
                    { 5, true, "ChartBaseCom", new DateTime(2021, 1, 16, 16, 7, 24, 0, DateTimeKind.Unspecified), null, null, null, true, new DateTime(2022, 3, 4, 12, 26, 25, 0, DateTimeKind.Unspecified), null, "1.4.5", 1, null, null, "基础图表", 10, 4, "/chart/base", true, true, 2, "views/example/chart/Base.vue" },
                    { 6, true, "ChartMoreCom", new DateTime(2021, 1, 16, 16, 10, 6, 0, DateTimeKind.Unspecified), null, null, null, true, new DateTime(2022, 3, 4, 12, 26, 28, 0, DateTimeKind.Unspecified), null, "1.4.6", 1, null, null, "更多图表", 20, 4, "/chart/more", true, true, 2, "views/example/chart/More.vue" },
                    { 7, true, null, new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "TableOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 34, 0, DateTimeKind.Unspecified), null, "1.7", 1, null, null, "表格管理", 50, 1, null, true, true, 1, null },
                    { 8, true, "BaseListCom", new DateTime(2020, 12, 17, 14, 49, 12, 0, DateTimeKind.Unspecified), null, null, null, true, new DateTime(2022, 3, 4, 12, 26, 38, 0, DateTimeKind.Unspecified), null, "1.7.8", 1, null, null, "基础列表", 100, 7, "/base/list", true, true, 2, "views/example/BaseList.vue" },
                    { 9, true, "ListIndexCom", new DateTime(2020, 12, 17, 14, 51, 7, 0, DateTimeKind.Unspecified), null, null, null, true, new DateTime(2022, 3, 4, 12, 26, 41, 0, DateTimeKind.Unspecified), null, "1.7.9", 1, null, null, "标准表格", 110, 7, "/list", true, true, 2, "views/example/list/Index.vue" },
                    { 10, true, "EditorCom", new DateTime(2021, 1, 18, 19, 34, 28, 0, DateTimeKind.Unspecified), null, "PicRightOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 46, 0, DateTimeKind.Unspecified), null, "1.10", 1, null, null, "富文本编辑器", 60, 1, "/editor", true, true, 2, "views/example/Editor.vue" },
                    { 12, true, null, new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "GoldOutlined", null, true, new DateTime(2022, 3, 4, 12, 25, 43, 0, DateTimeKind.Unspecified), null, "12", 1, null, null, "基础信息", 50, null, null, true, true, 1, null },
                    { 13, true, "base_member", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "UsergroupAddOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 55, 0, DateTimeKind.Unspecified), null, "12.13", 1, null, null, "会员管理", 10, 12, "/base/member", true, true, 2, "views/base/member/Index.vue" },
                    { 14, true, null, new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "DesktopOutlined", null, true, new DateTime(2022, 3, 4, 12, 25, 46, 0, DateTimeKind.Unspecified), null, "14", 1, null, null, "系统管理", 100, null, null, true, true, 1, null },
                    { 15, true, "system_user", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "UserOutlined", null, true, new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "14.15", 1, null, null, "账户管理", 100, 14, "/system/user", true, true, 2, "views/system/sys_user/Index.vue" },
                    { 16, true, "system_role", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "TeamOutlined", null, true, new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "14.16", 1, null, null, "角色管理", 110, 14, "/system/role", true, true, 2, "views/system/sys_role/Index.vue" },
                    { 17, true, "system_function", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "ControlOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 11, 0, DateTimeKind.Unspecified), null, "14.17", 1, null, null, "功能管理", 120, 14, "/system/function", true, true, 2, "views/system/sys_function/Index.vue" },
                    { 19, true, "system_personal_center", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "FormOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 19, 0, DateTimeKind.Unspecified), null, "14.19", 1, null, null, "个人中心", 150, 14, "/system/personal/center", true, true, 2, "views/system/personal_center/Index.vue" },
                    { 20, true, "system_post", new DateTime(2021, 5, 27, 17, 29, 49, 0, DateTimeKind.Unspecified), null, "IdcardOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 23, 0, DateTimeKind.Unspecified), null, "14.20", 1, null, null, "岗位管理", 160, 14, "/system/post", true, true, 2, "views/system/sys_post/Index.vue" },
                    { 21, true, "system_organization", new DateTime(2021, 5, 27, 20, 27, 56, 0, DateTimeKind.Unspecified), null, "ClusterOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 27, 0, DateTimeKind.Unspecified), null, "14.21", 1, null, null, "组织机构", 170, 14, "/system/organization", true, true, 2, "views/system/sys_organization/Index.vue" },
                    { 22, true, "swagger", new DateTime(2018, 3, 10, 12, 17, 3, 0, DateTimeKind.Unspecified), null, "FileSearchOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 41, 0, DateTimeKind.Unspecified), null, "29.22", 1, null, null, "接口文档", 10, 29, "/development_tool/swagger", true, true, 2, "views/development_tool/Swagger.vue" },
                    { 23, true, "system_dictionary", new DateTime(2021, 7, 25, 21, 50, 1, 0, DateTimeKind.Unspecified), null, "FileDoneOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 31, 0, DateTimeKind.Unspecified), null, "14.23", 1, null, null, "数据字典", 190, 14, "/system/dictionary", true, true, 2, "views/system/sys_dictionary/Index.vue" },
                    { 24, true, "sys_operation_log", new DateTime(2021, 8, 5, 21, 24, 54, 0, DateTimeKind.Unspecified), null, "ContainerOutlined", "", true, new DateTime(2022, 3, 4, 12, 27, 35, 0, DateTimeKind.Unspecified), null, "14.24", 1, null, null, "操作日志", 200, 14, "/system/sys_operation_log", true, true, 2, "views/system/sys_operation_log/Index.vue" },
                    { 25, true, "system_menu", new DateTime(2018, 3, 10, 12, 16, 38, 0, DateTimeKind.Unspecified), null, "MenuOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 15, 0, DateTimeKind.Unspecified), null, "14.25", 1, null, null, "菜单功能", 130, 14, "/system/menu", true, true, 2, "views/system/sys_menu/Index.vue" },
                    { 28, true, "VxeTableCom", new DateTime(2021, 12, 29, 17, 13, 26, 0, DateTimeKind.Unspecified), null, "BorderlessTableOutlined", null, true, new DateTime(2022, 3, 4, 12, 26, 0, 0, DateTimeKind.Unspecified), null, "1.28", 1, null, null, "Vxe-Table", 1, 1, "/vxe/table", true, true, 2, "views/example/VxeTable.vue" },
                    { 29, true, null, new DateTime(2022, 1, 12, 14, 17, 21, 0, DateTimeKind.Unspecified), null, "CodepenOutlined", null, true, new DateTime(2022, 3, 4, 12, 25, 49, 0, DateTimeKind.Unspecified), null, "29", 1, null, null, "开发工具", 200, null, null, true, true, 1, null },
                    { 30, true, "TimedTaskCom", new DateTime(2022, 1, 12, 14, 22, 4, 0, DateTimeKind.Unspecified), null, "FieldTimeOutlined", null, true, new DateTime(2022, 3, 4, 12, 27, 44, 0, DateTimeKind.Unspecified), null, "29.30", 1, null, null, "定时任务", 20, 29, "/development_tool/timed_task", true, true, 2, "views/development_tool/timed_task/Index.vue" },
                    { 31, true, "LowCode", new DateTime(2022, 1, 12, 15, 39, 46, 0, DateTimeKind.Unspecified), null, "CodeTwoTone", null, true, new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, "29.31", 1, null, null, "代码生成", 30, 29, "/development-tool/low-code", true, true, 2, "views/development_tool/low_code/Index.vue" },
                    { 32, true, "IconsVue", new DateTime(2022, 2, 24, 10, 51, 38, 0, DateTimeKind.Unspecified), null, "TagsTwoTone", null, true, new DateTime(2022, 3, 18, 12, 6, 38, 0, DateTimeKind.Unspecified), null, "1.32", 1, null, null, "图标展示", 20, 1, "/icons", true, true, 2, "views/example/Icons.vue" },
                    { 33, true, "monitor_efcore", new DateTime(2022, 4, 10, 10, 55, 41, 0, DateTimeKind.Unspecified), null, "DashboardFilled", null, true, new DateTime(2022, 4, 10, 10, 56, 17, 0, DateTimeKind.Unspecified), null, "29.33", 1, null, null, "EFCore监控台", 40, 29, "/development_tool/monitor/efcore", true, true, 2, "views/development_tool/monitor_efcore/Index.vue" },
                    { 36, true, "base_member_info_Details", new DateTime(2022, 4, 17, 17, 45, 25, 0, DateTimeKind.Unspecified), null, null, null, true, new DateTime(2022, 4, 17, 17, 49, 13, 0, DateTimeKind.Unspecified), null, "12.13.36", 1, null, null, "详情", 1, 13, "/base/member/details/:id/:title", false, true, 2, "views/base/member/components/Details.vue" },
                    { 38, true, "iframe1", new DateTime(2023, 3, 15, 22, 47, 59, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "AlipayCircleFilled", null, true, new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "38", 2, "https://juejin.cn/", "", "微前端1", 60, null, "/iframe1", true, true, 2, "core/components/layouts/LayoutIframe.vue" },
                    { 39, true, "iframe2", new DateTime(2023, 3, 15, 22, 49, 17, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "AndroidFilled", null, true, new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "39", 2, "", "http://rapidscada.com.cn/#/", "微前端2", 70, null, "/iframe2", true, true, 2, "core/components/layouts/LayoutIframe.vue" },
                    { 40, true, "temp", new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "BugFilled", null, true, new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "40", 2, "http://localhost:5112/#/temp/{menuid}/{token}", "http://ip:port/pages/页面存放目录/index.html#/页面地址/{menuid}", "微前端 - temp", 80, null, "/temp", true, true, 2, "core/components/layouts/LayoutIframe.vue" }
                });

            migrationBuilder.InsertData(
                table: "sys_menu_function",
                columns: new[] { "id", "creation_time", "creator_user_id", "function_code", "function_name", "last_modification_time", "last_modifier_user_id", "menu_id", "number", "remark" },
                values: new object[,]
                {
                    { new Guid("0073cce2-ff42-496c-9ff6-08da204fcecb"), new DateTime(2022, 4, 17, 20, 40, 12, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 4, 17, 20, 40, 12, 0, DateTimeKind.Unspecified), null, 36, 10, "Display" },
                    { new Guid("06da768a-538b-43ca-1e0b-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Save", "保存", null, null, 38, 50, "Save" },
                    { new Guid("0984a2e1-3722-41d4-0f6d-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 70, "Export" },
                    { new Guid("0a85e4fd-5a1c-47f6-0f60-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 20, "Insert" },
                    { new Guid("0ad6a459-1d9d-4512-0f32-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 40, "Delete" },
                    { new Guid("0b27e69f-af16-4481-0f44-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 60, "Search" },
                    { new Guid("0caa6e7d-92b0-4814-0f46-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 80, "Print" },
                    { new Guid("106fb69a-8bb5-4559-0f29-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 30, "Update" },
                    { new Guid("13f3f74d-c6fc-4488-0f2f-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 10, "Display" },
                    { new Guid("14783a71-e265-4d6b-0f3b-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 50, "Save" },
                    { new Guid("14921427-44b5-4381-1e11-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Update", "修改", null, null, 39, 30, "Update" },
                    { new Guid("160e2389-459e-455c-1e18-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Insert", "添加", null, null, 40, 20, "Insert" },
                    { new Guid("17eb09ba-73b3-4d55-1e1c-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Search", "检索", null, null, 40, 60, "Search" },
                    { new Guid("1cb6fbe1-4a6c-4aad-0f22-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 34, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 34, 0, DateTimeKind.Unspecified), null, 6, 10, "Display" },
                    { new Guid("1ccee936-ebda-475a-1e08-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Insert", "添加", null, null, 38, 20, "Insert" },
                    { new Guid("1d831d57-6634-45d7-0f6e-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 80, "Print" },
                    { new Guid("1e69df5d-d1e9-4bc8-0f4d-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 70, "Export" },
                    { new Guid("20ab5395-d57c-49db-0f4a-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 40, "Delete" },
                    { new Guid("2186550d-246c-4552-e2d8-08d9fdefa8f8"), new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, 24, 60, "Search" },
                    { new Guid("22a675f6-efda-481d-0f59-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 30, "Update" },
                    { new Guid("2469188c-21de-492a-0f5e-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 80, "Print" },
                    { new Guid("2c406afd-ea49-4c91-1e1b-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Save", "保存", null, null, 40, 50, "Save" },
                    { new Guid("2fea8f87-2a13-4c95-0f3c-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 60, "Search" },
                    { new Guid("31b129ca-5977-4d4f-1e17-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Display", "显示", null, null, 40, 10, "Display" },
                    { new Guid("33c80938-82c8-4299-0f12-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 17, 9, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 17, 9, 0, DateTimeKind.Unspecified), null, 30, 10, "Display" },
                    { new Guid("37d3e492-62da-47a4-0f33-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 50, "Save" },
                    { new Guid("38b4704d-7c5d-4f89-a2e7-08da3d8e6577"), new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, 31, 60, "Search" },
                    { new Guid("3cb3cbc7-9e45-4cc3-0f62-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 40, "Delete" },
                    { new Guid("3e44c6f5-e090-40a1-0f58-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 20, "Insert" },
                    { new Guid("3f6d0af7-5386-4d3a-0f71-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 40, 52, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 40, 52, 0, DateTimeKind.Unspecified), null, 28, 10, "Display" },
                    { new Guid("414bf13f-d98b-44e6-1e0c-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Search", "检索", null, null, 38, 60, "Search" },
                    { new Guid("41cb1942-573a-4d63-0f4b-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 50, "Save" },
                    { new Guid("437fbf85-8704-4e87-0f3d-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 70, "Export" },
                    { new Guid("4461c732-6076-4da3-1e1a-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Delete", "删除", null, null, 40, 40, "Delete" },
                    { new Guid("45e2ca86-4823-4fb9-0f57-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 10, "Display" },
                    { new Guid("46c68201-6aa9-4df9-1e19-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Update", "修改", null, null, 40, 30, "Update" },
                    { new Guid("48f0a694-0539-4e69-a2e4-08da3d8e6577"), new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, 31, 10, "Display" },
                    { new Guid("4a67fcdb-a7a9-4e3c-0f49-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 30, "Update" },
                    { new Guid("4bbbe120-0cc6-4a08-0f4e-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 80, "Print" },
                    { new Guid("4dbf096d-d3d3-4565-a2e5-08da3d8e6577"), new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 5, 24, 22, 5, 57, 0, DateTimeKind.Unspecified), null, 31, 40, "Delete" },
                    { new Guid("523b53b5-8159-4a16-0f2b-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 50, "Save" },
                    { new Guid("52b6b95e-32c3-4b32-1e09-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Update", "修改", null, null, 38, 30, "Update" },
                    { new Guid("53fdb4a0-ca6e-4568-0f3f-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 10, "Display" },
                    { new Guid("541d9045-47b2-4629-0f2e-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 80, "Print" },
                    { new Guid("54743c86-ac73-4345-0f5d-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 70, "Export" },
                    { new Guid("550f874b-e804-44a0-0f37-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 10, "Display" },
                    { new Guid("55750f56-edc9-4771-e2d6-08d9fdefa8f8"), new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, 24, 10, "Display" },
                    { new Guid("5e4e87bd-c179-4b5b-0f5c-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 60, "Search" },
                    { new Guid("616c4e4a-fb61-49cf-0f5b-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 50, "Save" },
                    { new Guid("687254ae-0d76-4788-a4e8-08da1a9d9949"), new DateTime(2022, 4, 10, 10, 56, 17, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 4, 10, 10, 56, 17, 0, DateTimeKind.Unspecified), null, 33, 10, "Display" },
                    { new Guid("69da651e-787b-42e5-0f5a-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 36, 0, DateTimeKind.Unspecified), null, 20, 40, "Delete" },
                    { new Guid("6b009415-eadf-4dab-0f3e-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 80, "Print" },
                    { new Guid("6b209d5a-b366-4a61-0f63-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 50, "Save" },
                    { new Guid("6c09c0c0-72fa-4842-0f1f-08d9fdad00ab"), new DateTime(2022, 3, 18, 12, 6, 38, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 18, 12, 6, 38, 0, DateTimeKind.Unspecified), null, 32, 10, "Display" },
                    { new Guid("6c1404cc-19f0-4779-1e12-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Delete", "删除", null, null, 39, 40, "Delete" },
                    { new Guid("6deb31ee-c655-4972-1e1d-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Export", "导出", null, null, 40, 70, "Export" },
                    { new Guid("71d3ccf0-4bc6-4333-1e10-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Insert", "添加", null, null, 39, 20, "Insert" },
                    { new Guid("7694fbf5-e28d-424c-e2d7-08d9fdefa8f8"), new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 23, 0, 2, 0, DateTimeKind.Unspecified), null, 24, 40, "Delete" },
                    { new Guid("7e0f6c84-d7f1-4243-0f4c-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 60, "Search" },
                    { new Guid("7ea8f706-bfe5-42b2-0f42-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 40, "Delete" },
                    { new Guid("823ac05d-65e4-4216-0f39-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 30, "Update" },
                    { new Guid("8564e4d8-d7f4-4f12-0f31-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 30, "Update" },
                    { new Guid("86465238-c51c-45d5-0f40-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 20, "Insert" },
                    { new Guid("86ff83fd-d34a-4290-0f41-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 30, "Update" },
                    { new Guid("92b39a10-3927-4ee7-0f6a-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 40, "Delete" },
                    { new Guid("9426768e-b90d-41e1-0f67-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 10, "Display" },
                    { new Guid("9dee28bd-43ab-4520-1e15-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Export", "导出", null, null, 39, 70, "Export" },
                    { new Guid("a03d56d7-4b0d-47cc-0f6b-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 50, "Save" },
                    { new Guid("a1602e70-cbe9-4be3-1e0e-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Print", "打印", null, null, 38, 80, "Print" },
                    { new Guid("a1ddd02f-8c21-4d79-0f21-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 30, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 30, 0, DateTimeKind.Unspecified), null, 5, 10, "Display" },
                    { new Guid("a3754771-f6e9-4a23-0f2c-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 60, "Search" },
                    { new Guid("a46e07d3-c722-4548-0f35-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 70, "Export" },
                    { new Guid("a726455f-1c29-4be0-0f45-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 70, "Export" },
                    { new Guid("a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab"), new DateTime(2022, 3, 18, 12, 6, 20, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 18, 12, 6, 20, 0, DateTimeKind.Unspecified), null, 2, 10, "Display" },
                    { new Guid("a9503588-e6f7-420b-0f65-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 70, "Export" },
                    { new Guid("aec4386d-9f29-4510-1e0f-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Display", "显示", null, null, 39, 10, "Display" },
                    { new Guid("b005a2e0-1574-49b5-1e0a-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Delete", "删除", null, null, 38, 40, "Delete" },
                    { new Guid("b5881044-afb8-40b2-0f28-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 20, "Insert" },
                    { new Guid("b7533a90-dae4-4263-0f24-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 43, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 43, 0, DateTimeKind.Unspecified), null, 9, 10, "Display" },
                    { new Guid("b96f977c-a36e-4e7f-0f2d-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Export", "导出", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 70, "Export" },
                    { new Guid("b98a365e-6fb4-4efb-0f69-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 30, "Update" },
                    { new Guid("bd6ae6da-1ca6-46c2-0f3a-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 40, "Delete" },
                    { new Guid("bd802618-d6eb-46a3-1e13-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Save", "保存", null, null, 39, 50, "Save" },
                    { new Guid("beb87004-5cfb-417a-0f34-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 60, "Search" },
                    { new Guid("bf676d02-26c6-4070-1e0d-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Export", "导出", null, null, 38, 70, "Export" },
                    { new Guid("c67a0abe-daec-491b-0f38-08d9fdad00ab"), new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 4, 22, 22, 24, 3, 0, DateTimeKind.Unspecified), null, 16, 20, "Insert" },
                    { new Guid("c6ba141b-99ba-4114-0f5f-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 10, "Display" },
                    { new Guid("c77c812a-1601-4311-0f70-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 26, 0, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 26, 0, 0, DateTimeKind.Unspecified), null, 19, 10, "Display" },
                    { new Guid("c8edbb79-567e-461b-0f36-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 80, "Print" },
                    { new Guid("c9e5fff0-6744-47d7-0f66-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Print", "打印", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 80, "Print" },
                    { new Guid("cce82eb4-7fc5-4308-0f30-08d9fdad00ab"), new DateTime(2022, 12, 4, 16, 28, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 14, 0, DateTimeKind.Unspecified), null, 15, 20, "Insert" },
                    { new Guid("d2e6ea60-2cf6-478a-0f23-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 40, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 40, 0, DateTimeKind.Unspecified), null, 8, 10, "Display" },
                    { new Guid("db3ab8bd-7709-41a2-0f47-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 10, "Display" },
                    { new Guid("dee401b1-e20e-496e-0f43-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, "Save", "保存", new DateTime(2022, 3, 4, 15, 25, 21, 0, DateTimeKind.Unspecified), null, 17, 50, "Save" },
                    { new Guid("e2319118-42cc-41a2-0f6c-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 60, "Search" },
                    { new Guid("e3cf0647-a115-445f-1e1e-08db256445a2"), new DateTime(2023, 3, 15, 23, 29, 14, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Print", "打印", null, null, 40, 80, "Print" },
                    { new Guid("e991934a-0d30-416b-0f68-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 50, 0, DateTimeKind.Unspecified), null, 23, 20, "Insert" },
                    { new Guid("ea89b300-3dbd-4f0a-1e07-08db256445a2"), new DateTime(2023, 3, 15, 22, 53, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Display", "显示", null, null, 38, 10, "Display" },
                    { new Guid("eb958545-6449-40db-0f27-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 10, "Display" },
                    { new Guid("ec535908-8671-4928-0f25-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 47, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 47, 0, DateTimeKind.Unspecified), null, 10, 10, "Display" },
                    { new Guid("ef70b789-21ee-4850-0f1b-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 16, 44, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 16, 44, 0, DateTimeKind.Unspecified), null, 22, 10, "Display" },
                    { new Guid("f06a638e-bf09-42dd-1e14-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Search", "检索", null, null, 39, 60, "Search" },
                    { new Guid("f36b9b06-2826-425f-0f64-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Search", "检索", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 60, "Search" },
                    { new Guid("f3c15f15-3b82-4f1a-1e16-08db256445a2"), new DateTime(2023, 3, 15, 22, 50, 2, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "Print", "打印", null, null, 39, 80, "Print" },
                    { new Guid("f4621fbe-6b40-4454-0f2a-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, "Delete", "删除", new DateTime(2022, 3, 4, 15, 25, 7, 0, DateTimeKind.Unspecified), null, 13, 40, "Delete" },
                    { new Guid("f4c73ac0-c66d-4988-0f61-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, "Update", "修改", new DateTime(2022, 3, 4, 15, 25, 40, 0, DateTimeKind.Unspecified), null, 21, 30, "Update" },
                    { new Guid("f64cfe50-1ef1-457f-0f20-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 24, 24, 0, DateTimeKind.Unspecified), null, "Display", "显示", new DateTime(2022, 3, 4, 15, 24, 24, 0, DateTimeKind.Unspecified), null, 3, 10, "Display" },
                    { new Guid("fe6465bf-e429-45bd-0f48-08d9fdad00ab"), new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, "Insert", "添加", new DateTime(2022, 3, 4, 15, 25, 28, 0, DateTimeKind.Unspecified), null, 25, 20, "Insert" }
                });

            migrationBuilder.InsertData(
                table: "sys_organization",
                columns: new[] { "id", "creation_time", "creator_user_id", "email", "last_modification_time", "last_modifier_user_id", "leader", "level_code", "name", "order_number", "parent_id", "phone", "state" },
                values: new object[,]
                {
                    { 1, new DateTime(2021, 5, 27, 20, 50, 31, 0, DateTimeKind.Unspecified), null, "18410912184@qq.com", new DateTime(2021, 5, 27, 20, 50, 31, 0, DateTimeKind.Unspecified), null, "hzy", "1", "阿里巴巴集团", 1, null, "18410912184", 1 },
                    { 2, new DateTime(2021, 5, 27, 22, 33, 44, 0, DateTimeKind.Unspecified), null, "13131", new DateTime(2021, 12, 28, 16, 13, 34, 0, DateTimeKind.Unspecified), null, "北京分部", "1.2", "北京分部", 3, 1, "132123", 1 },
                    { 3, new DateTime(2021, 5, 27, 22, 33, 57, 0, DateTimeKind.Unspecified), null, "234234@qq.com", new DateTime(2021, 5, 27, 22, 33, 57, 0, DateTimeKind.Unspecified), null, "市场部门", "1.2.3", "市场部门", 1, 2, "234124234", 1 },
                    { 4, new DateTime(2021, 5, 27, 22, 34, 11, 0, DateTimeKind.Unspecified), null, "123@qq.com", new DateTime(2021, 5, 27, 22, 34, 11, 0, DateTimeKind.Unspecified), null, "财务部门", "1.2.4", "财务部门", 2, 2, "435543535", 1 },
                    { 5, new DateTime(2021, 5, 27, 21, 1, 50, 0, DateTimeKind.Unspecified), null, "123@qq.com", new DateTime(2021, 5, 27, 22, 31, 45, 0, DateTimeKind.Unspecified), null, "成都分部", "1.5", "成都分部", 2, 1, "123123123", 1 },
                    { 7, new DateTime(2021, 5, 27, 22, 32, 8, 0, DateTimeKind.Unspecified), null, "12312@qq.com", new DateTime(2021, 5, 27, 22, 32, 29, 0, DateTimeKind.Unspecified), null, "研发部门", "1.5.7", "研发部门", 1, 5, "1234323423", 1 },
                    { 9, new DateTime(2021, 5, 27, 22, 33, 25, 0, DateTimeKind.Unspecified), null, "12341@qq.com", new DateTime(2022, 3, 8, 17, 7, 47, 0, DateTimeKind.Unspecified), null, "运维部门", "1.5.9", "运维部门", 4, 5, "1232133452", 1 },
                    { 10, new DateTime(2021, 5, 27, 22, 32, 59, 0, DateTimeKind.Unspecified), null, "123123@qq.com", new DateTime(2021, 5, 27, 22, 32, 59, 0, DateTimeKind.Unspecified), null, "测试部门", "1.5.10", "测试部门", 3, 5, "12313", 1 },
                    { 11, new DateTime(2022, 3, 8, 17, 0, 20, 0, DateTimeKind.Unspecified), null, "12345678901@qq.com", new DateTime(2022, 12, 4, 17, 50, 10, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "技术部门", "1.5.11", "技术部门", 2, 5, "12345678911", 1 }
                });

            migrationBuilder.InsertData(
                table: "sys_post",
                columns: new[] { "id", "code", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "name", "number", "remarks", "state" },
                values: new object[,]
                {
                    { new Guid("0716b4b0-9a06-43e9-8ae8-82c74875f83e"), "se", new DateTime(2021, 5, 27, 20, 26, 35, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 5, 27, 20, 26, 35, 0, DateTimeKind.Unspecified), null, "项目经理", 2, null, 1 },
                    { new Guid("96927c30-41d0-4ced-8e29-cbed35c90fb0"), "ceo", new DateTime(2021, 5, 27, 20, 26, 22, 0, DateTimeKind.Unspecified), null, new DateTime(2021, 5, 27, 20, 26, 22, 0, DateTimeKind.Unspecified), null, "董事长", 1, null, 1 },
                    { new Guid("e46af329-6d08-442c-9837-f22cff954411"), "user", new DateTime(2021, 5, 27, 20, 26, 52, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 4, 23, 21, 50, 55, 0, DateTimeKind.Unspecified), null, "普通员工", 4, null, 1 },
                    { new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), "dotnet_engineer", new DateTime(2022, 3, 8, 10, 13, 18, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 10, 13, 18, 0, DateTimeKind.Unspecified), null, "DotNet软件工程师", 5, null, 1 },
                    { new Guid("f0c67537-8094-429a-b474-f54ac518609e"), "hr", new DateTime(2021, 5, 27, 20, 26, 44, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 12, 4, 17, 3, 50, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "人力资源", 3, null, 1 }
                });

            migrationBuilder.InsertData(
                table: "sys_role",
                columns: new[] { "id", "creation_time", "creator_user_id", "delete_lock", "is_admin", "last_modification_time", "last_modifier_user_id", "name", "number", "remark" },
                values: new object[,]
                {
                    { new Guid("18fa4771-6f58-46a3-80d2-6f0f5e9972e3"), new DateTime(2016, 7, 6, 17, 59, 20, 0, DateTimeKind.Unspecified), null, true, true, new DateTime(2022, 12, 4, 14, 2, 19, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "超级管理员", 1, "超级管理员" },
                    { new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new DateTime(2016, 7, 6, 17, 59, 20, 0, DateTimeKind.Unspecified), null, true, false, new DateTime(2022, 12, 4, 14, 4, 32, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "普通用户", 2, "普通用户" }
                });

            migrationBuilder.InsertData(
                table: "sys_role_menu_function",
                columns: new[] { "id", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "menu_function_id", "menu_id", "role_id" },
                values: new object[,]
                {
                    { new Guid("7af695f2-0a26-464d-15e0-08dad5c66e71"), new DateTime(2022, 12, 4, 15, 9, 5, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), null, null, new Guid("a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab"), 2, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3") },
                    { new Guid("cd6175d8-67cc-4f62-15e2-08dad5c66e71"), new DateTime(2022, 12, 4, 15, 9, 5, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), null, null, new Guid("c77c812a-1601-4311-0f70-08d9fdad00ab"), 19, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3") },
                    { new Guid("cf8e1d9e-74e5-4f1e-15e1-08dad5c66e71"), new DateTime(2022, 12, 4, 15, 9, 5, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), null, null, new Guid("f64cfe50-1ef1-457f-0f20-08d9fdad00ab"), 3, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3") }
                });

            migrationBuilder.InsertData(
                table: "sys_user",
                columns: new[] { "id", "creation_time", "creator_user_id", "delete_lock", "email", "last_modification_time", "last_modifier_user_id", "login_name", "name", "organization_id", "password", "phone" },
                values: new object[,]
                {
                    { new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2017, 4, 6, 19, 55, 53, 0, DateTimeKind.Unspecified), null, true, "1396510655@qq.com", new DateTime(2022, 3, 8, 17, 27, 36, 0, DateTimeKind.Unspecified), null, "admin", "超级管理员", 7, "E10ADC3949BA59ABBE56E057F20F883E", "10000000000" },
                    { new Guid("3739f349-7995-4c63-62d8-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 17, 58, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 3, 8, 17, 17, 58, 0, DateTimeKind.Unspecified), null, "白居易", "白居易", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" },
                    { new Guid("4fd6a740-0cf1-4975-62d6-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, "李商隐", "李商隐", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" },
                    { new Guid("5722af0f-2366-4fc9-62d5-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, "杜甫", "杜甫", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" },
                    { new Guid("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 19, 55, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 12, 4, 12, 6, 0, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), "屈原", "屈原", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" },
                    { new Guid("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, "陶渊明 ", "陶渊明 ", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" },
                    { new Guid("ac18f496-e93d-42f0-b59e-e321acc85335"), new DateTime(2017, 4, 6, 19, 55, 53, 0, DateTimeKind.Unspecified), null, true, "12345678900@live.com", new DateTime(2022, 3, 8, 10, 12, 14, 0, DateTimeKind.Unspecified), null, "libai", "李白", 7, "E10ADC3949BA59ABBE56E057F20F883E", "12345678900" },
                    { new Guid("e225e163-31c9-4da9-62d7-08da00e3d8a0"), new DateTime(2022, 3, 8, 17, 15, 7, 0, DateTimeKind.Unspecified), null, false, "12345678900@qq.com", new DateTime(2022, 3, 8, 17, 15, 7, 0, DateTimeKind.Unspecified), null, "苏轼", "苏轼", 7, "46F94C8DE14FB36680850768FF1B7F2A", "12345678900" }
                });

            migrationBuilder.InsertData(
                table: "sys_user_post",
                columns: new[] { "id", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "post_id", "user_id" },
                values: new object[,]
                {
                    { new Guid("0c1a55ba-6bd3-4810-a494-a6b9b7374d4d"), new DateTime(2022, 3, 8, 10, 13, 35, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 10, 13, 35, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("ac18f496-e93d-42f0-b59e-e321acc85335") },
                    { new Guid("12c6bb86-494a-48c8-b8f4-1fad0e20ce49"), new DateTime(2022, 9, 28, 21, 49, 23, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), null, null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("fff73fa3-4298-4794-0d99-08daa158397b") },
                    { new Guid("14f4aa4e-c910-40b3-ae8f-158d91bd06d9"), new DateTime(2022, 12, 12, 10, 36, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 3, 8, 17, 15, 8, 0, DateTimeKind.Unspecified), null, new Guid("e46af329-6d08-442c-9837-f22cff954411"), new Guid("e225e163-31c9-4da9-62d7-08da00e3d8a0") },
                    { new Guid("3d1b49b9-bd55-4f75-aad7-e7b10e080d00"), new DateTime(2022, 12, 4, 12, 6, 0, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 6, 21, 19, 59, 2, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0") },
                    { new Guid("575bf085-47bb-42f2-8b68-620cf460b164"), new DateTime(2022, 3, 8, 17, 29, 22, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 29, 22, 0, DateTimeKind.Unspecified), null, new Guid("96927c30-41d0-4ced-8e29-cbed35c90fb0"), new Guid("0198459e-2034-4533-b843-5d227ad20740") },
                    { new Guid("6c34f115-28dd-441a-81d5-f6598c97d44a"), new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0") },
                    { new Guid("6f671077-c98d-4106-9736-bf2edb6db58d"), new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new Guid("e46af329-6d08-442c-9837-f22cff954411"), new Guid("4fd6a740-0cf1-4975-62d6-08da00e3d8a0") },
                    { new Guid("8af7ff30-7411-423d-85a3-13740c5fef87"), new DateTime(2022, 12, 12, 10, 36, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 3, 8, 17, 15, 7, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("e225e163-31c9-4da9-62d7-08da00e3d8a0") },
                    { new Guid("9eb74344-044d-4d86-a9f0-197ba416b964"), new DateTime(2022, 10, 20, 21, 2, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 3, 8, 17, 17, 58, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("3739f349-7995-4c63-62d8-08da00e3d8a0") },
                    { new Guid("ade7e59b-0163-49ee-b2ce-12a59b90b0cf"), new DateTime(2022, 9, 28, 21, 49, 42, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), null, null, new Guid("0716b4b0-9a06-43e9-8ae8-82c74875f83e"), new Guid("4c178551-1f0f-463c-0d9a-08daa158397b") },
                    { new Guid("af1bec7e-3309-4629-9606-72eefa1826b3"), new DateTime(2022, 3, 8, 17, 20, 20, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 20, 20, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("cc186fe2-ee27-4292-62db-08da00e3d8a0") },
                    { new Guid("b669ec48-aa60-441a-b59d-7f9be7b94155"), new DateTime(2022, 7, 6, 21, 49, 13, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 7, 6, 21, 49, 13, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("1550d6d4-0529-4fdd-62dc-08da00e3d8a0") },
                    { new Guid("b797ff16-d6f7-45db-83ec-f910b2612926"), new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("4fd6a740-0cf1-4975-62d6-08da00e3d8a0") },
                    { new Guid("b97331a7-e281-4027-aade-9f068558826a"), new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, new Guid("f0bd38c2-f1de-4bd9-e2db-08da00a93622"), new Guid("5722af0f-2366-4fc9-62d5-08da00e3d8a0") }
                });

            migrationBuilder.InsertData(
                table: "sys_user_role",
                columns: new[] { "id", "creation_time", "creator_user_id", "last_modification_time", "last_modifier_user_id", "role_id", "user_id" },
                values: new object[,]
                {
                    { new Guid("1c9f81df-c8a0-45bb-a272-c84bd3af0c19"), new DateTime(2022, 3, 8, 17, 29, 22, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 29, 22, 0, DateTimeKind.Unspecified), null, new Guid("18fa4771-6f58-46a3-80d2-6f0f5e9972e3"), new Guid("0198459e-2034-4533-b843-5d227ad20740") },
                    { new Guid("3da871b8-fda5-4935-b532-0ff0b3c3913b"), new DateTime(2022, 12, 4, 12, 6, 0, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 6, 21, 19, 59, 2, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0") },
                    { new Guid("982f0a52-e8c8-4b9f-91c7-beb592d6502d"), new DateTime(2022, 12, 12, 10, 36, 51, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 3, 8, 17, 15, 7, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("e225e163-31c9-4da9-62d7-08da00e3d8a0") },
                    { new Guid("a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097"), new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 14, 13, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("4fd6a740-0cf1-4975-62d6-08da00e3d8a0") },
                    { new Guid("ce9f61ac-79d8-426f-9066-36962c017bf6"), new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 13, 2, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("5722af0f-2366-4fc9-62d5-08da00e3d8a0") },
                    { new Guid("dbc656a6-4264-417d-97d8-577e1218feca"), new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 17, 19, 22, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0") },
                    { new Guid("e5396c4c-2b8c-468d-94c3-8d5be0e559c1"), new DateTime(2022, 10, 20, 21, 2, 11, 0, DateTimeKind.Unspecified), new Guid("0198459e-2034-4533-b843-5d227ad20740"), new DateTime(2022, 3, 8, 17, 17, 58, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("3739f349-7995-4c63-62d8-08da00e3d8a0") },
                    { new Guid("fa1fdf14-3847-4194-894c-cd935a3dd9e6"), new DateTime(2022, 3, 8, 10, 13, 35, 0, DateTimeKind.Unspecified), null, new DateTime(2022, 3, 8, 10, 13, 35, 0, DateTimeKind.Unspecified), null, new Guid("40ff1844-c099-4061-98e0-cd6e544fcfd3"), new Guid("ac18f496-e93d-42f0-b59e-e321acc85335") }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "algorithm_function");

            migrationBuilder.DropTable(
                name: "flow");

            migrationBuilder.DropTable(
                name: "flow_approval");

            migrationBuilder.DropTable(
                name: "flow_approval_step_history");

            migrationBuilder.DropTable(
                name: "flow_approval_step_history_user");

            migrationBuilder.DropTable(
                name: "flow_node");

            migrationBuilder.DropTable(
                name: "low_code_list");

            migrationBuilder.DropTable(
                name: "low_code_search");

            migrationBuilder.DropTable(
                name: "low_code_table");

            migrationBuilder.DropTable(
                name: "low_code_table_info");

            migrationBuilder.DropTable(
                name: "member");

            migrationBuilder.DropTable(
                name: "quartz_job_task");

            migrationBuilder.DropTable(
                name: "quartz_job_task_log");

            migrationBuilder.DropTable(
                name: "sys_data_authority");

            migrationBuilder.DropTable(
                name: "sys_data_authority_custom");

            migrationBuilder.DropTable(
                name: "sys_dictionary");

            migrationBuilder.DropTable(
                name: "sys_function");

            migrationBuilder.DropTable(
                name: "sys_menu");

            migrationBuilder.DropTable(
                name: "sys_menu_function");

            migrationBuilder.DropTable(
                name: "sys_operation_log");

            migrationBuilder.DropTable(
                name: "sys_organization");

            migrationBuilder.DropTable(
                name: "sys_post");

            migrationBuilder.DropTable(
                name: "sys_role");

            migrationBuilder.DropTable(
                name: "sys_role_menu_function");

            migrationBuilder.DropTable(
                name: "sys_user");

            migrationBuilder.DropTable(
                name: "sys_user_post");

            migrationBuilder.DropTable(
                name: "sys_user_role");

            migrationBuilder.DropTable(
                name: "three_app");

            migrationBuilder.DropTable(
                name: "three_app_classify");

            migrationBuilder.DropTable(
                name: "three_component");

            migrationBuilder.DropTable(
                name: "three_component_classify");

            migrationBuilder.DropTable(
                name: "three_model");

            migrationBuilder.DropTable(
                name: "three_model_classify");

            migrationBuilder.DropTable(
                name: "three_template");

            migrationBuilder.DropTable(
                name: "three_template_classify");

            migrationBuilder.DropTable(
                name: "three_texture");

            migrationBuilder.DropTable(
                name: "three_texture_classify");
        }
    }
}
