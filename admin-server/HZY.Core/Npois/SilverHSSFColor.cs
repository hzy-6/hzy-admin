using NPOI.HSSF.Util;

namespace HZY.Core.Npois;

public class SilverHSSFColor : HSSFColor
{
    public const short Index = 0x16;
    public static readonly byte[] Triplet = { 192, 192, 192 };
    public const string HexString = "0:0:0";

    public override short Indexed
    {
        get { return Index; }
    }

    public override byte[] GetTriplet()
    {
        return Triplet;
    }

    public override String GetHexString()
    {
        return HexString;
    }

}
