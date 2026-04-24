package;

import flixel.util.FlxStringUtil;

using StringTools;

class ChartParser
{
	static public function parse(songName:String, section:Int)
	{
		var regex:EReg = new EReg("[ \t]*((\r\n)|\r|\n)[ \t]*", "g");

		var csvData = FlxStringUtil.imageToCSV(AssetHandler.baseAssetTmage('data/$songName/section_$section'));

		var lines:Array<String> = regex.split(csvData);
		var rows:Array<String> = lines.filter(function(line) return line != "");
		csvData.replace("\n", ',');

		var heightInTiles = rows.length;
		var widthInTiles = 8;

        trace(rows);
	}
}
