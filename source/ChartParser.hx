package;

import flixel.util.FlxStringUtil;

using StringTools;

typedef NoteData =
{
	notes:Array<Int>,
	sustains:Array<Int>,
}

class ChartParser
{
	static public function parse(songName:String, section:Int)
	{
		var regex:EReg = new EReg("[ \t]*((\r\n)|\r|\n)[ \t]*", "g");

		var csvData = FlxStringUtil.imageToCSV(AssetHandler.baseAssetTmage('data/$songName/section_$section'));

		var baseRows:Array<String> = regex.split(csvData).filter(function(line) return line != "");

		var newRows:Array<String> = [];

		for (row in baseRows)
		{
			row = row.trim().replace(', ', '.');

			newRows.push(row);
			trace('"$row"');
		}

		var returnData:Array<NoteData> = [];

		for (row in newRows)
		{
			var data = row.split('.');

			var parsing:NoteData = {
				notes: [],
				sustains: [],
			};

			for (i => bit in data)
			{
				if (bit == '1')
				{
					if (i < 4)
						parsing.notes.push(i);
                    else
						parsing.sustains.push(i % 4);
				}
			}
		}

        trace('$songName : $returnData');
		return returnData;
	}
}
