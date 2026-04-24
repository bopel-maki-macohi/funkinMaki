package;

import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxG;

class PlayState extends ConductorState
{
	var bf:Character;

	var strumNotes:FlxTypedSpriteGroup<StrumNote>;

	override public function create()
	{
		super.create();

		conductor.bpm = 140.0;
		FlxG.sound.playMusic(AssetHandler.music('Test'), 1, false);
		ChartParser.parse('Test', 1);

		bf = new Character(0, 0);
		bf.screenCenter();
		add(bf);

		strumNotes = new FlxTypedSpriteGroup<StrumNote>();
		add(strumNotes);

		makeStrumNotes();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		conductor.time += elapsed * 1000;
		conductor.update();
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
}
