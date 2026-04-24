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

		conductor.stepHit.remove(stepHit);
		conductor.beatHit.remove(beatHit);
	}

	override public function new()
	{
		super();

		conductor.stepHit.add(stepHit);
		conductor.beatHit.add(beatHit);
	}

	function stepHit(step:Float) {}

	function beatHit(beat:Float) {}
}
