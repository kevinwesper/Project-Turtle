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
	public var healing:Int;
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
		var types:Array<String> = [ "Attack", "Heal" ];
		var strengths:Array<Int> = [ 5, 10, 20, 25 ];				//Balancing stuff
		var healings:Array<Int> = [ 10, 25, 50 ];
		for ( type in types )
		{ 
			for ( strength in strengths )
			{
				for ( healing in healings )
				{
					public var imageName:String = ( "img/" + type + "_" + strength + healing + ".png" );
				}
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
