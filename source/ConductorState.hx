import flixel.FlxState;

class ConductorState extends FlxState
{
	public var conductor(get, never):Conductor;

	function get_conductor():Conductor
	{
		return Conductor.instance;
	}
}
