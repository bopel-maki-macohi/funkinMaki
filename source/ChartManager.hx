package;

import lime.utils.Assets;
import flixel.FlxG;
import haxe.Json;
import flixel.util.FlxStringUtil;

using StringTools;

typedef SongMetadata =
{
	bpm:Float,
	sectionCount:Int,

	?playerSections:Array<Int>,
}

typedef ChartData =
{
	bpm:Float,

	sections:Array<Array<SongSectionBitData>>,

	?scrollspeed:Float,
}

typedef SongSectionBitData =
{
	notes:Array<Int>,
	sustains:Array<Int>,
}

class ChartParser
{
	public static function parseSong(songName:String):ChartData
	{
		var metadata:SongMetadata = null;

		try
		{
			metadata = Json.parse(Assets.getText(AssetHandler.json('data/$songName/_meta')));
		}
		catch (e)
		{
			FlxG.stage.window.alert(e.message, 'Song Metadata Parsing Error');
		}

		var data:ChartData = {
			bpm: metadata?.bpm ?? 150.0,
			sections: [],
			scrollspeed: 1,
		};

		for (i in 0...metadata?.sectionCount)
		{
			var section = parseSection(songName, i + 1);

			// if (section.filter(f -> return f != null).length == 0)
			// 	data.sections.push([]);
			// else
			
			data.sections.push(section);
		}

		trace(data);

		return data;
	}

	public static function parseSection(songName:String, section:Int)
	{
		var regex:EReg = new EReg("[ \t]*((\r\n)|\r|\n)[ \t]*", "g");

		var csvData = FlxStringUtil.imageToCSV(AssetHandler.baseAssetTmage('data/$songName/section_$section'));

		var baseRows:Array<String> = regex.split(csvData).filter(function(line) return line != "");

		var newRows:Array<String> = [];

		for (row in baseRows)
		{
			row = row.trim().replace(', ', '.');

			newRows.push(row);
			// trace('"$row"');
		}

		var returnData:Array<SongSectionBitData> = [];

		for (row in newRows)
		{
			var data = row.split('.');

			var parsing:SongSectionBitData = {
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

			if (parsing.notes.length == 0 && parsing.sustains.length == 0)
				returnData.push(null);
			else
				returnData.push(parsing);
		}

		// trace('$songName : $returnData');
		return returnData;
	}
}
