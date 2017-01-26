package;

import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;


/**
 * ...
 * @author shaq
 */
class Main extends Sprite 
{
	var deck:Cards;
 
	public function new() 
	{
		super();
		
		deck = new Cards();
		createHand();
	}
	
	function createHand() 
	{   
		var card : Bitmap;
		var box : Sprite = new Sprite(); 
		card = deck.pop();   
		box.addChild( card ); 
		card = deck.pop();   
		card.x = 180;   
		box.addChild( card ); 
		box.x = 200;   
		box.y = 0; 
		addChild( box ); 
	}
	
}