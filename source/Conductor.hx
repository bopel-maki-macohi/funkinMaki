import flixel.FlxBasic;
import flixel.FlxG;

class Conductor extends FlxBasic
{
	public var bpm:Float = 150.0;

	public function new(bpm:Float = 150.0)
	{
		super();

		this.bpm = bpm;
	}

	public function playMusic(track:String)
	{
		FlxG.sound.playMusic(track);
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
