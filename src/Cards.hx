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

class Card extends Sprite
{
	public var strength:Int;
	public var healing:Int;
	public var type:String;
	public var defence:Int;
	public var imageName:String;
	
	var deck:Array<Card> = new Array<Card>();
	
	public function new(thisStrength:Int, thisHealing:Int, thisType:String, thisImage:String, thisDefence:Int))
	{
		super();
		strength = thisStrength;
		healing = thisHealing;
		defence = thisDefence;
		type = thisType;
		imageName = thisImage;
		createCards();
		createDeck();
		shuffleDeck();
		
		var cardData:BitmapData = Assets.getBitmapData( imageName )
		var card:Bitmap = new Bitmap( cardData);
		addChild( card );
	}
	/** * Create an deck (array) with the cards * */ 
	function createDeck() 
	{
		var types:Array<String> = [ "Attack", "Heal", "Defence" ];
		var strengths:Array<Int> = [ 0, 5, 10, 20, 25 ];				//Balancing stuff
		var healings:Array<Int> = [ 0, 10, 25, 50 ];
		var defences:Array<Int> = [ 0, 10, 25, 50 ];
		for ( type in types )
		{ 
			for ( strength in strengths )
			{
				for ( healing in healings )
				{
					for (defence in defences )
					{
						var imageName:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
				 
					    deck.push( imageName ); 
					}
				     
				}
			}
		}
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
