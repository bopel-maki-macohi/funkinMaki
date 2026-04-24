import flixel.util.FlxColor;
import flixel.FlxSprite;

enum abstract NoteDir(Int) from Int to Int
{
	var LEFT = 0;
	var DOWN = 1;
	var UP = 2;
	var RIGHT = 3;
}

class Note extends FlxSprite
{
    public static final NOTE_SIZE:Int = 64;

	override public function new(dir:NoteDir, ?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

		makeGraphic(NOTE_SIZE, NOTE_SIZE, FlxColor.WHITE);

		switch (dir)
		{
			case LEFT:
				color = 0xFF0000;
			case DOWN:
				color = 0x00FFFF;
			case UP:
				color = 0x00FF00;
			case RIGHT:
				color = 0xFF00FF;
		}
	}
}
