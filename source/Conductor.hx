import flixel.util.FlxTimer;
import flixel.FlxBasic;
import flixel.FlxG;

class Conductor extends FlxBasic
{
	public var bpm:Float = 150.0;

	public var bps(get, never):Float;

	function get_bps():Float
		return bpm / 60;

	public var bpsTimer:FlxTimer;

	public function new(bpm:Float = 150.0)
	{
		super();

		this.bpm = bpm;
	}

	public function playMusic(track:String)
	{
		if (bpsTimer == null)
			bpsTimer = new FlxTimer();

		bpsTimer.cancel();

		curSecond = 0;

		FlxG.sound.playMusic(AssetHandler.music(track));
		FlxG.sound.music.onComplete = function()
		{
			trace('Music done');
			bpsTimer.cancel();
		}

		if (FlxG.sound.music != null)
			bpsTimer.start(1, t -> onBeatSecond(), Math.round(FlxG.sound.music.length / 1000));
	}

	public var curSecond:Int = 0;

	public var curMinute(get, never):Int;

	function get_curMinute():Int
		return Math.round(curSecond / 60);

	public function onBeatSecond()
	{
		curSecond++;

		if (curSecond > 0 && curSecond % 60 == 0)
			onBeatMinute();

		trace('Music Second: $curSecond (minute: $curMinute proper second: ${curSecond % 60})');
	}

	public function onBeatMinute() {}
}
