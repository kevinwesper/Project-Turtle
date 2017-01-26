package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

/**
 * ...
 * @author shaq
 */
class Cards extends Sprite 
{
	public var strength:Int;
	public var healing:Int;
	public var type:String;
	public var defence:Int;
	public var imageName:String;

	var deck:Array<Bitmap> = new Array<Bitmap>();
	
	public function new()
	{
		super();
		
		createDeck();
		
	}
	
	public function pop()
	{
		return deck.pop();
	}
	
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
								
						
						var cardData:BitmapData = Assets.getBitmapData( imageName );
						var card:Bitmap = new Bitmap( cardData);
						addChild( card );
					    deck.push( card ); 
					
					}
				     
				}
			}
		}
	}
	
}