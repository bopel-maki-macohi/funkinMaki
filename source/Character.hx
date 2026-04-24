import flixel.FlxSprite;

class Character extends FlxSprite
{
	override public function new(?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);

        frames = AssetHandler.getSparrow('bf_assets');

        animation.addByPrefix('idle', 'bf anim idle', 24, false);
        
        animation.addByPrefix('left', 'bf anim left', 24, false);
        animation.addByPrefix('down', 'bf anim down', 24, false);
        animation.addByPrefix('up', 'bf anim up', 24, false);
        animation.addByPrefix('right', 'bf anim right', 24, false);

        dance();
	}

    public function dance()
    {
        animation.play('idle');
    }
}
