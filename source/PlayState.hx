package;

import ChartManager;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxG;

class PlayState extends ConductorState
{
	var bf:Character;

	var strumNotes:FlxTypedSpriteGroup<StrumNote>;
	var regularNotes:FlxTypedSpriteGroup<Note>;

	var chart:ChartData;

	override public function create()
	{
		super.create();

		chart = ChartParser.parseSong('Test');

		conductor.bpm = chart.bpm;
		FlxG.sound.playMusic(AssetHandler.music('Test'), 1, false);

		bf = new Character(0, 0);
		bf.screenCenter();
		add(bf);

		strumNotes = new FlxTypedSpriteGroup<StrumNote>();
		add(strumNotes);

		makeStrumNotes();

		regularNotes = new FlxTypedSpriteGroup<Note>();
		add(regularNotes);

		makeNotes();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		conductor.time += elapsed * 1000;
		conductor.update();

		for (note in regularNotes)
		{
			note.y = note.time - conductor.time;
		}
	}

	override function beatHit(beat:Float)
	{
		super.beatHit(beat);

		bf.dance();
	}

	public function makeStrumNotes()
	{
		for (i in 0...8)
		{
			var strumNote:StrumNote = new StrumNote(20, 20);

			strumNote.x += (i % 4) * strumNote.width * 2;

			if (i >= 4)
			{
				strumNote.x += FlxG.width / 2 + strumNote.width * 2;
			}

			strumNotes.add(strumNote);
		}
	}

	public function makeNotes()
	{
		var t = 0.0;

		var totalLength = 0;

		for (sectionNum => section in chart.sections)
		{
			for (step => sectionBit in section)
			{
				var daStrumTime:Float = ((step * conductor.quaver) + (conductor.crotchet * 8 * totalLength)) + ((conductor.crotchet * sectionNum) * 1);

				for (i in sectionBit.notes)
				{
					var note:Note = new Note(i, 20, 20);

					note.x += (i % 4) * note.width * 2;
					note.x += FlxG.width / 2 + note.width * 2;

					note.time = daStrumTime;

					regularNotes.add(note);
				}
			}

			totalLength += Math.round((sectionNum / 4));
		}
	}
}
