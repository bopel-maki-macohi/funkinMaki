package;

import flixel.FlxState;

class PlayState extends FlxState
{
	var bf:Character;

	override public function create()
	{
		super.create();

		bf = new Character(0,0);
		bf.screenCenter();
		add(bf);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
