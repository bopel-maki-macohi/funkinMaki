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
		var baseRows:Array<String> = lines.filter(function(line) return line != "");

        var newRows:Array<String> = [];

		for (row in baseRows)
		{
			row = row.trim().replace(', ', '.');

            newRows.push(row);
            trace('"$row"');
		}

		csvData.replace("\n", ',');

		var heightInTiles = newRows.length;
		var widthInTiles = newRows[0].split('.').length;
	}
}
