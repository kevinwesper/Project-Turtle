package; 

import openfl.Assets; 
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite; 
import screens.Battle1Screen;

import openfl.events.MouseEvent;

import motion.Actuate;

/**
 * Class for creating the playable cards on the screen.
 * 
 * @author Kevin Beijer & Shaquille Nedd
 */

class PlacingCards extends Sprite
{
	// the name of the table
	var tableName:String;
	
	// the cards on the table
	var cards:Array<Cards>; 
	
	// connecting to game screens
	
	var deck:Array<Cards> = new Array<Cards>();
	
	var selection:Array<Cards> = new Array<Cards>();
	
	public function new( newTableName:String )
	{ 
		super();
		
		cards = new Array<Cards>(); 
		tableName = newTableName;
	}
	
	// Adds the card from the parameter to the cards array
	public function addCard( newCard:Cards )
	{ 
		cards.push( newCard );
		displayCards();
	} 
	
	// To display cards
	function displayCards()
	{ 
		removeChildren();
		var xPos:Float = 0;
		var yPos:Float = 0;
		for ( card in cards )
		{ 
			addChild( card );
		}
	} 
}