package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;
import openfl.events.MouseEvent;


/**
 * Class for the Game Screen
 * 
 * @author Kevin
 */

class Battle1Screen extends Screen
{
	var deck:Array<Cards> = new Array<Cards>();
	var selection1:Array<Cards> = new Array<Cards>();
	var selection2:Array<Cards> = new Array<Cards>();
	
	var playerHealth:Int = 100;
	var enemyHealth:Int = 100;
	
	public function new()
	{
		super();
		
		var backgroundData:BitmapData = Assets.getBitmapData( "img/Battle_Background.png" );
		var background:Bitmap = new Bitmap( backgroundData );
		addChild( background );

		var uiData:BitmapData = Assets.getBitmapData( "img/UI.png" );
		var ui:Bitmap = new Bitmap( uiData );														// Check this
		addChild( ui );

		createDeck();
		shuffleDeck();
		createPlacedCards();
		createPlayer();
		createEnemy();
	}
	
	/** * Create an deck (array) with the cards * */ 
/*	function createDeck() 
	{
		var types:Array<String> = [ "Attack", "Heal", "Defence" ];
		var strengths:Array<Int> = [ 0, 10, 20, 50 ];												// Balancing stuff
		var healings:Array<Int> = [ 0, 10, 25 ];
		var defences:Array<Int> = [ 0, 10, 25, 50 ];
		var imagePath:String;
		for ( type in types )
		{ 
			for ( strength in strengths )
			{
				for ( healing in healings )
				{
					for (defence in defences )
					{
						var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
						
						deck.push( new Cards( type, strength, healing, defence, imagePath ) );
						deck.push( new Cards( type, strength, healing, defence, imagePath ) );
						deck.push( new Cards( type, strength, healing, defence, imagePath ) );
						deck.push( new Cards( type, strength, healing, defence, imagePath ) );
					}
				}
			}
		}
	}
*/	
	function createDeck() 
	{
		var type:String = "Attack";
		var strength:Int = 10;
		var healing:Int = 0;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Attack";
		var strength:Int = 20;
		var healing:Int = -10;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Attack";
		var strength:Int = 50;
		var healing:Int = 0;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Heal";
		var strength:Int = 0;
		var healing:Int = 25;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Defence";
		var strength:Int = 0;
		var healing:Int = 0;
		var defence:Int = 10;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Defence";
		var strength:Int = 0;
		var healing:Int = 10;
		var defence:Int = 50;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Defence";
		var strength:Int = 10;
		var healing:Int = 0;
		var defence:Int = 25;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
	}
	
	// Shuffles the cards in the deck
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
	
	function createPlayer()
	{
		var playerData:BitmapData = Assets.getBitmapData( "img/SheldonBattle.png");
		var player:Bitmap = new Bitmap( playerData );
		player.x = 15;
		player.y = 150;
		addChild(player);
		
		var playerHPData:BitmapData = Assets.getBitmapData( "img/Button.png");
		var playerHP:Bitmap = new Bitmap( playerHPData );
		playerHP.x = 45;
		playerHP.y = 30;
		addChild(playerHP);
	}
	
	function createEnemy()
	{
		var enemyData:BitmapData = Assets.getBitmapData( "img/HagridHamster.png");
		var enemy:Bitmap = new Bitmap( enemyData );
		enemy.x = 480;
		enemy.y = 140;
		addChild(enemy);
		
		var enemyHPData:BitmapData = Assets.getBitmapData( "img/Button.png");
		var enemyHP:Bitmap = new Bitmap( enemyHPData );
		enemyHP.x = 500;
		enemyHP.y = 30;
		addChild(enemyHP);
	}
	
	// Create the playable cards on screen
	function createPlacedCards() 
	{ 
		var card : Cards;		
		var box : PlacingCards = new PlacingCards( "Start", this );
		for ( column in 0...5 )
		{
			var card:Cards = deck.pop();
			box.addCard( card );
			card.x = 50 + column * 120;
			card.y = 330;
			if ( isPlayerAlive() == true && canPlayerPlay() == true )
			{
				card.addEventListener ( MouseEvent.CLICK, seeCard );
			}	
			if ( isPlayerAlive() == true && canPlayerPlay() == false)
			{
				enemyTurn();
			}
			if ( isPlayerAlive() == false && canPlayerPlay() == true || isPlayerAlive() == false && canPlayerPlay() == false)
			{
				Main.instance.loadScreen (ScreenTypes.Dead1);
			}
		} 
		addChild(box);
	}	
	
	public function isPlayerAlive() 
	{ 
		if (playerHealth <= 0)
		{
			return false; 
		}
		else
		{
			return true;
		}
	}
	
	public function canPlayerPlay()
	{
		if ( selection1.length == 1 )
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
	private function seeCard( event:MouseEvent )
	{
		
		var card:Cards = cast(event.target);
		card.x = 290;
		card.y = 40;
		card.scaleX = card.scaleY = 2;
		if (selection1.indexOf(card) == -1)
		{
			selection1.push (card);
		}
		if (selection1.length == 1)
		{
			card.addEventListener ( MouseEvent.CLICK, playCard );
			card.addEventListener ( MouseEvent.RIGHT_CLICK, deselectCard );
		}
	}
	
	private function playCard( event:MouseEvent )
	{
		
	}
	
	private function deselectCard( event:MouseEvent )
	{
		
	}
	
	function enemyTurn()
	{
		
	}
	// function to click cards
	// function to play cards
	// function to deselect card
	// function that checks enemy hp > 0
	// if dead go to next cutscene (5)
	// enemy turn
	

	
	
	
	override public function onLoad():Void
	{
		var toMenu:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Main.png"), 
		"", onMenuClick);
		toMenu.y = 150;
		toMenu.x = 674;
		addChild( toMenu );
		
				
		var toNext:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Next.png"), 
		"", onSkipClick);
		toNext.y = 210;
		toNext.x = 674;
		addChild( toNext );
		
		var toQuit:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Quit.png"), 
		"", onQuitClick);
		toQuit.y = 270;
		toQuit.x = 674;
		addChild( toQuit );
	}

	private function onMenuClick()
	{
		Main.instance.loadScreen( ScreenTypes.Title );
	}
	
	private function onSkipClick()
	{
		Main.instance.loadScreen (ScreenTypes.Cutscene5);
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}
