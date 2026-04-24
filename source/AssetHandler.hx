import flixel.graphics.frames.FlxAtlasFrames;

class AssetHandler
{
	public static inline function assetFile(file:String)
		return 'assets/$file';

	public static inline function image(file:String)
		return assetFile('images/$file.png');

	public static inline function xml(file:String)
		return assetFile('$file.xml');

	public static inline function audio(file:String)
		return assetFile('$file.wav');

	public static inline function music(file:String)
		return audio('music/$file');

	public static inline function sound(file:String)
		return audio('sounds/$file');

	public static inline function getSparrow(img:String)
	{
		return FlxAtlasFrames.fromSparrow(image(img), xml('images/$img'));
	}
}
