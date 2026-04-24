package;

import flixel.FlxG;

class PlayState extends ConductorState
{
	var bf:Character;

	override public function create()
	{
		super.create();

		conductor.bpm = 140.0;
		FlxG.sound.playMusic(AssetHandler.music('Test'), 1, false);

		bf = new Character(0, 0);
		bf.screenCenter();
		add(bf);
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
}
