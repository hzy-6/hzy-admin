namespace HZY.Api.Admin.Models.Dtos.Systems;

public class SysDictionaryDto : SysDictionary
{

    public int Key
    {
        get
        {
            return Id;
        }
    }

    public string? Title
    {
        get
        {
            return Name;
        }
    }

    public List<SysDictionaryDto> Children { get; set; }

    /// <summary>
    /// 父级名称
    /// </summary>
    public string? ParentName { get; set; }


}