package;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState
{
	var conductor:Conductor;

	var bf:Character;

	override public function create()
	{
		super.create();

		conductor = new Conductor(140);
		conductor.playMusic('Test');
		add(conductor);

		bf = new Character(0,0);
		bf.screenCenter();
		add(bf);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
