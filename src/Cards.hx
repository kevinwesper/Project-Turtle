package; 

import openfl.Assets; 
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * Code for determining cards
 * 
 * @author Kevin Beijer
 */

class Cards extends Sprite
{
	public var type:String;
	public var strength:Int;
	public var healing:Int;
	public var defence:Int;
	public var imageName:String;
	
	var deck:Array<Cards> = new Array<Cards>();
	
	public function new( thisType:String, thisStrength:Int, thisHealing:Int, thisDefence:Int, thisImage:String )
	{
		super();
		strength = thisStrength;
		healing = thisHealing;
		defence = thisDefence;
		type = thisType;
		imageName = thisImage;
		
		var cardData:BitmapData = Assets.getBitmapData( imageName );
		var card:Bitmap = new Bitmap( cardData);
		
		card.scaleX = card.scaleY = 1 / 2;
		
		addChild( card );
	}
}
