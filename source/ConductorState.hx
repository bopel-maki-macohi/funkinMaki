import flixel.FlxState;

class ConductorState extends FlxState
{
	public var conductor(get, never):Conductor;

	function get_conductor():Conductor
	{
		return Conductor.instance;
	}

	override function destroy()
	{
		super.destroy();

		conductor.onBeatSecondSignal.remove(onBeatSecond);
		conductor.onBeatMinuteSignal.remove(onBeatMinute);
	}

	override public function new()
	{
		super();

		conductor.onBeatSecondSignal.add(onBeatSecond);
		conductor.onBeatMinuteSignal.add(onBeatMinute);
	}

	function onBeatSecond() {}

	function onBeatMinute() {}
}
