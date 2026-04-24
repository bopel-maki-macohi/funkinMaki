package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var bf:Character;

	override public function create()
	{
		super.create();

		FlxG.sound.playMusic(AssetHandler.music('Test'));

		bf = new Character(0,0);
		bf.screenCenter();
		add(bf);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
