package;

class PlayState extends ConductorState
{
	var bf:Character;

	override public function create()
	{
		super.create();

		conductor.setBpm(140.0);
		conductor.playMusic('Test');
		add(conductor);

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
