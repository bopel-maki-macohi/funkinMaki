package;

class PlayState extends ConductorState
{
	var bf:Character;

	override public function create()
	{
		super.create();

		conductor.bpm = 140.0;

		bf = new Character(0, 0);
		bf.screenCenter();
		add(bf);
	}

	override function onBeatMinute()
	{
		super.onBeatMinute();

		bf.dance();
	}
}
