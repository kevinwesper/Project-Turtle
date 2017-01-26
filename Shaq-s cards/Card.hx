package;

import flash.display.Bitmap;
import openfl.display.Sprite;
import oprnfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.Sprites;


/**
 * ...
 * @author shaq
 */
class Card extends Sprite 
{
	
	var attack:Int;
	var heal: Int;
	var defence: Int;
	var imageName: String;
	var type: String

	public function new(thisattack:Int , thisheal:Int , thisdefence:Int , thistype:String , thisimageName:String) 
	{
		super();
		attack = thisattack;
		heal = thisheal;
		defence: = thisdefence;
		type = thistype;
		imageName = thisimageName
		
		
		
		var cardDataBitmapData = Assets.getBitmapData ( imageName );
		var card:Bitmap = new Bitmap( cardData );
		addChild ( card );
	}
	
}