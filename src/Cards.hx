package; 

import openfl.Assets; 
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * Code for determining cards
 * 
 * @author Kevin
 */

class Card extends Sprite
{
	public var strength:Int;
	public var type:String;
	public var imageName:String;
	
	var deck:Array<Card> = new Array<Card>();
	
	public function new()
	{
		createCards();
		createDeck();
		shuffleDeck();
	}
	/** * Create an deck (array) with the cards * */ 
	function createDeck() 
	{
		var types:Array<String> = [ "Attack", "Defence", "Other", "Heal" ];
		var strengths:Array<Int> = [ 1, 2, 3, 4 ];
		for ( type in types )
		{ 
			for ( strength in strengths )
			{
		public var imageName:String = ( "img/" + type + "_" + strenth + ".png" );
			}
		}
	}
	
	function createCards()
	{ 
		var cardData:BitmapData = Assets.getBitmapData( imageName );
		var card:Bitmap = new Bitmap( cardData );
		
		addChild( card );	
	}
	
	/** * Shuffle the deck * */
	function shuffleDeck() 
	{ 
		var deckLength:Int = deck.length; 
		for (i in 0...deckLength )
		{
			var change:Int = i + Math.floor( Math.random() * (deckLength - i) );
			var tempCard = deck[i];
			deck[i] = deck[change]; 
			deck[change] = tempCard;
		} 
	}
}