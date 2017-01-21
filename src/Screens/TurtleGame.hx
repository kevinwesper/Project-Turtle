package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * Class for the actual game
 * 
 * @author Kevin Beijer
 */

class TurtleGame extends Screen
{
	public function new() 
	{
		super();
		
		var gameData:BitmapData = Assets.getBitmapData( "img/Game.png");
		var game:Bitmap = new Bitmap( gameData );
		addChild(game);
	}
}
