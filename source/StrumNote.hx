import flixel.util.FlxColor;
import flixel.FlxSprite;

class StrumNote extends FlxSprite
{
	override public function new(?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

		makeGraphic(Note.NOTE_SIZE, Note.NOTE_SIZE, FlxColor.GRAY);
	}
}
