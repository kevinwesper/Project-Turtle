package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;

import motion.Actuate;

/**
 * Class for the 4th Battle
 *  
 * @author Kevin Beijer
 */

class Battle4Screen extends Screen
{
	var type:String;
	var strength:Int;
	var healing:Int;
	var defence:Int;
	var imagePath:String;
		
	var deck:Array<Cards> = new Array<Cards>();
	var selection:Array<Cards> = new Array<Cards>();
	
	var playerToPlayerDamage:Int;
	var enemyToPlayerDamage:Int;
	var enemyToEnemyDamage:Int;
	var playerToEnemyDamage:Int;
	
	var playerDamage:Int;
	var enemyDamage:Int;
	var oldPlayerHealth:Int;
	var newPlayerHealth:Int;
	var oldEnemyHealth:Int;
	var newEnemyHealth:Int;
	var maxPlayerHealth:Int;
	var maxEnemyHealth:Int;
	
	var playerData:BitmapData;
	var player:Bitmap;
	var playerHPData:BitmapData;
	var playerHP:Bitmap;
	
	var enemyData:BitmapData;
	var enemy:Bitmap;
	var enemyHPData:BitmapData;
	var enemyHP:Bitmap;
	
	public function new()
	{
		super();
		
		var backgroundData:BitmapData = Assets.getBitmapData( "img/Battle_Background.png" );
		var background:Bitmap = new Bitmap( backgroundData );
		addChild( background );

		createDeck();
		shuffleDeck();
		createPlacedCards();
		createPlayer();
		createEnemy(); 
	}
	
	// Create an deck (array) with the cards (total of 25 cards)
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
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Attack";
		var strength:Int = 15;
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
		var strength:Int = 25;
		var healing:Int = 0;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Attack";
		var strength:Int = 40;
		var healing:Int = 0;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Attack";
		var strength:Int = 50;
		var healing:Int = 0;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
		deck.push( new Cards( type, strength, healing, defence, imagePath ) );
		
		var type:String = "Heal";
		var strength:Int = 0;
		var healing:Int = 20;
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
		
		var type:String = "Heal";
		var strength:Int = 0;
		var healing:Int = 40;
		var defence:Int = 0;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
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
		var healing:Int = 0;
		var defence:Int = 25;
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
		
		var type:String = "Defence";
		var strength:Int = 0;
		var healing:Int = 10;
		var defence:Int = 50;
		var imagePath:String = ( "img/" + type + "_" + strength + "_" + healing + "_" + defence + ".png" );
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
	// Create sprite of the player
	function createPlayer()
	{
		playerData = Assets.getBitmapData( "img/SheldonBattle.png");
		player = new Bitmap( playerData );
		player.x = 60;
		player.y = 230;
		addChild(player);
	}
	
	// Create sprite of the enemy
	function createEnemy()
	{
		enemyData = Assets.getBitmapData( "img/Crane.png");
		enemy = new Bitmap( enemyData );
		enemy.x = 485;
		enemy.y = 240;
		addChild(enemy);
	}
	
	// Create the playable cards on screen
	function createPlacedCards() 
	{ 
		var card : Cards;		
		var box : PlacingCards = new PlacingCards( "Start" );
		for ( column in 0...5 )
		{
			var card:Cards = deck.pop();
			box.addCard( card );
			card.x = 5 + column * 150;
			card.y = 5;
			if ( isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage) == true && isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage) == true && playerTurn() == true )
			{
				card.addEventListener ( MouseEvent.CLICK, playCard );
			}	
			if ( isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage) == true && isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage) == true && playerTurn() == false )
			{
				enemyTurn();
			}
			if ( isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage) == false && isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage) == true )
			{
				Main.instance.loadScreen (ScreenTypes.Dead4);
			}
			if ( isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage) == false && isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage) == false )
			{
				Main.instance.loadScreen (ScreenTypes.Cutscene9);
			}
		} 
		addChild(box);
	}	
	
	// Checks if the player is still alive
	public function isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage)
	{
		if (oldPlayerHealth == null)
		{
			oldPlayerHealth = 100;
		}
		if (playerToPlayerDamage == null)
		{
			playerToPlayerDamage = 0;
		}
		if (enemyToPlayerDamage == null)
		{
			enemyToPlayerDamage = 0;
		}
		playerDamage = playerToPlayerDamage + enemyToPlayerDamage;
		if (playerDamage == null)
		{
			playerDamage = 0;
		}
		newPlayerHealth = (oldPlayerHealth - playerDamage);
		oldPlayerHealth = newPlayerHealth;
		removeChild (playerHP);
		maxPlayerHealth = 100;
		if ( newPlayerHealth >= maxPlayerHealth )
		{
			newPlayerHealth = 100;
		}
		
		playerToPlayerDamage = 0;
		enemyToPlayerDamage = 0;
		playerDamage = 0;
		
		if ( newPlayerHealth <= 100 && newPlayerHealth >= 96 )
		{
			playerHPData = Assets.getBitmapData( "img/5 full.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 95 && newPlayerHealth >= 91 )
		{
			playerHPData = Assets.getBitmapData( "img/5 3-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 90 && newPlayerHealth >= 86 )
		{
			playerHPData = Assets.getBitmapData( "img/5 1-2.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 85 && newPlayerHealth >= 81 )
		{
			playerHPData = Assets.getBitmapData( "img/5 1-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 80 && newPlayerHealth >= 76 )
		{
			playerHPData = Assets.getBitmapData( "img/4 full.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 75 && newPlayerHealth >= 71 )
		{
			playerHPData = Assets.getBitmapData( "img/4 3-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 70 && newPlayerHealth >= 66 )
		{
			playerHPData = Assets.getBitmapData( "img/4 1-2.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 65 && newPlayerHealth >= 61 )
		{
			playerHPData = Assets.getBitmapData( "img/4 1-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 60 && newPlayerHealth >= 56 )
		{
			playerHPData = Assets.getBitmapData( "img/3 full.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 55 && newPlayerHealth >= 51 )
		{
			playerHPData = Assets.getBitmapData( "img/3 3-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 50 && newPlayerHealth >= 46 )
		{
			playerHPData = Assets.getBitmapData( "img/3 1-2.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 45 && newPlayerHealth >= 41 )
		{
			playerHPData = Assets.getBitmapData( "img/3 1-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 40 && newPlayerHealth >= 36 )
		{
			playerHPData = Assets.getBitmapData( "img/2 full.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 35 && newPlayerHealth >= 31 )
		{
			playerHPData = Assets.getBitmapData( "img/2 3-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 30 && newPlayerHealth >= 26 )
		{
			playerHPData = Assets.getBitmapData( "img/2 1-2.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 25 && newPlayerHealth >= 21 )
		{
			playerHPData = Assets.getBitmapData( "img/2 1-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 20 && newPlayerHealth >= 16 )
		{
			playerHPData = Assets.getBitmapData( "img/1 full.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 15 && newPlayerHealth >= 11 )
		{
			playerHPData = Assets.getBitmapData( "img/1 3-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 10 && newPlayerHealth >= 6 )
		{
			playerHPData = Assets.getBitmapData( "img/1 1-2.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		if ( newPlayerHealth <= 5 && newPlayerHealth >= 1 )
		{
			playerHPData = Assets.getBitmapData( "img/1 1-4.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			return true;
		}
		else
		{
			playerHPData = Assets.getBitmapData( "img/1 empty.png" );
			playerHP = new Bitmap( playerHPData );
			playerHP.scaleX = playerHP.scaleY = 1/3;
			playerHP.x = 45;
			playerHP.y = 400;
			addChild(playerHP);
			Main.instance.loadScreen (ScreenTypes.Dead4);
			return false;
		}
	}
	
	// Check for if the player can play a card
	public function playerTurn()
	{
		if ( selection.length == 1 )
		{
			return false;
		}
		else
		{
			return true;
		}
	}
	
	// What happens when you play a card
	private function playCard( event:MouseEvent )
	{
		var card:Cards = cast(event.target);
		if (selection.indexOf(card) == -1 )
		{
			selection.push (card);
		}
		if (selection.length == 1)
		{
			if ( selection[0].strength == 10 && selection[0].healing == 0 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 10;
				removeChild(card);
			}
			if ( selection[0].strength == 15 && selection[0].healing == 0 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 15;
				removeChild(card);
			}
			if ( selection[0].strength == 20 && selection[0].healing == -10 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 20;
				playerToPlayerDamage = 10;
				removeChild(card);
			}
			if ( selection[0].strength == 25 && selection[0].healing == 0 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 25;
				removeChild(card);
			}
			if ( selection[0].strength == 40 && selection[0].healing == 0 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 40;
				removeChild(card);
			}
			if ( selection[0].strength == 50 && selection[0].healing == 0 && selection[0].defence == 0 )
			{
				playerToEnemyDamage = 50;
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 20 && selection[0].defence == 0 )
			{
				var chance:Int =  Math.ceil( 2 * Math.random() );
				if (chance == 1)
				{
					playerToPlayerDamage = -20;
				}
				else 
				{
					playerToPlayerDamage = 10;
				}
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 25 && selection[0].defence == 0 )
			{
				playerToPlayerDamage = -25;
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 40 && selection[0].defence == 0 )
			{
				playerToPlayerDamage = -40;
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 0 && selection[0].defence == 10 )
			{
				if (enemyToPlayerDamage >= 0 && enemyToPlayerDamage <= 10)
				{
					enemyToPlayerDamage = 0;
				}
				else
				{
					playerToPlayerDamage = -10;
				}
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 0 && selection[0].defence ==25 )
			{
				if (enemyToPlayerDamage >= 0 && enemyToPlayerDamage <= 25)
				{
					enemyToPlayerDamage = 0;
				}
				else
				{
					playerToPlayerDamage = -25;
				}
				removeChild(card);
			}
			if ( selection[0].strength == 10 && selection[0].healing == 0 && selection[0].defence == 25 )
			{
				if (enemyToPlayerDamage >= 0 && enemyToPlayerDamage <= 25)
				{
					enemyToPlayerDamage = 0;
				}
				else
				{
					playerToPlayerDamage = -25;
				}
				playerToEnemyDamage = 10;
				removeChild(card);
			}
			if ( selection[0].strength == 0 && selection[0].healing == 10 && selection[0].defence == 50 )
			{
				if (enemyToPlayerDamage >= 0 && enemyToPlayerDamage <= 50)
				{
					enemyToPlayerDamage = 0;
				}
				else
				{
					playerToPlayerDamage = -50;
				}
				playerToPlayerDamage = -10;
				removeChild(card);
			}
			
			for (selectedCard in selection)	
			{
				var nextCard:Cards = deck.pop();
				Actuate.tween(nextCard, 2.0, { rotation: 360 , x: selectedCard.x, y:selectedCard.y});
				removeChild(selectedCard);	
				addChild(nextCard);
				nextCard.addEventListener( MouseEvent.CLICK, playCard );
				deck.push (selectedCard);
				shuffleDeck();
			}
			addChild(selection[0]);
			removeChild(selection[0]);
			Actuate.tween (player, 1, { x: (enemy.x - 100), y: enemy.y }).repeat (1).reflect ();
			enemyTurn();
			playerToEnemyDamage = 0;
			enemyToEnemyDamage = 0;
		}
	}
	
	// Checks if the enemy is still alive
	public function isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage)
	{
		if (oldEnemyHealth == null)
		{
			oldEnemyHealth = 100;
		}
		if (enemyToEnemyDamage == null)
		{
			enemyToEnemyDamage = 0;
		}
		if (playerToEnemyDamage == null)
		{
			playerToEnemyDamage = 0;
		}
		enemyDamage = enemyToEnemyDamage + playerToEnemyDamage;
		if (enemyDamage == null)
		{
			enemyDamage = 0;
		}
		
		newEnemyHealth = (oldEnemyHealth - enemyDamage);
		oldEnemyHealth = newEnemyHealth;
		removeChild (enemyHP);
		maxEnemyHealth = 100;
		if ( newEnemyHealth >= maxEnemyHealth )
		{
			newEnemyHealth = 100;
		}
		enemyToEnemyDamage = 0;
		playerToEnemyDamage = 0;
		enemyDamage = 0;
		
		if ( newEnemyHealth <= 100 && newEnemyHealth >= 96 )
		{
			enemyHPData = Assets.getBitmapData( "img/5 full.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 95 && newEnemyHealth >= 91 )
		{
			enemyHPData = Assets.getBitmapData( "img/5 3-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 90 && newEnemyHealth >= 86 )
		{
			enemyHPData = Assets.getBitmapData( "img/5 1-2.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 85 && newEnemyHealth >= 81 )
		{
			enemyHPData = Assets.getBitmapData( "img/5 1-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 80 && newEnemyHealth >= 76 )
		{
			enemyHPData = Assets.getBitmapData( "img/4 full.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 75 && newEnemyHealth >= 71 )
		{
			enemyHPData = Assets.getBitmapData( "img/4 3-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 70 && newEnemyHealth >= 66 )
		{
			enemyHPData = Assets.getBitmapData( "img/4 1-2.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 65 && newEnemyHealth >= 61 )
		{
			enemyHPData = Assets.getBitmapData( "img/4 1-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 60 && newEnemyHealth >= 56 )
		{
			enemyHPData = Assets.getBitmapData( "img/3 full.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 55 && newEnemyHealth >= 51 )
		{
			enemyHPData = Assets.getBitmapData( "img/3 3-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 50 && newEnemyHealth >= 46 )
		{
			enemyHPData = Assets.getBitmapData( "img/3 1-2.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 45 && newEnemyHealth >= 41 )
		{
			enemyHPData = Assets.getBitmapData( "img/3 1-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 40 && newEnemyHealth >= 36 )
		{
			enemyHPData = Assets.getBitmapData( "img/2 full.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 35 && newEnemyHealth >= 31 )
		{
			enemyHPData = Assets.getBitmapData( "img/2 3-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 30 && newEnemyHealth >= 26 )
		{
			enemyHPData = Assets.getBitmapData( "img/2 1-2.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 25 && newEnemyHealth >= 21 )
		{
			enemyHPData = Assets.getBitmapData( "img/2 1-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 20 && newEnemyHealth >= 16 )
		{
			enemyHPData = Assets.getBitmapData( "img/1 full.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 15 && newEnemyHealth >= 11 )
		{
			enemyHPData = Assets.getBitmapData( "img/1 3-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 10 && newEnemyHealth >= 6 )
		{
			enemyHPData = Assets.getBitmapData( "img/1 1-2.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		if ( newEnemyHealth <= 5 && newEnemyHealth >= 1 )
		{
			enemyHPData = Assets.getBitmapData( "img/1 1-4.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return true;
		}
		else
		{
			enemyHPData = Assets.getBitmapData( "img/1 empty.png" );
			enemyHP = new Bitmap( enemyHPData );
			enemyHP.scaleX = enemyHP.scaleY = 1/3;
			enemyHP.x = 457;
			enemyHP.y = 400;
			addChild(enemyHP);
			return false;
		}
	}
	
	// Action of the enemy
	function enemyTurn()
	{
		if ( isEnemyAlive(enemyToEnemyDamage, playerToEnemyDamage) == false)
		{
			Main.instance.loadScreen (ScreenTypes.Cutscene9);
		}
		else
		{
			var attackType : Int = Math.ceil( 5 * Math.random() );
			if ( attackType == 1 || attackType == 2 || attackType == 3 )
			{
				enemyToPlayerDamage = Math.ceil( 10 + (20 * Math.random()) );
				Actuate.tween (enemy, 1, { x: (player.x + 125), y: player.y }).repeat (1).reflect ();
				selection.pop();
				isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage);
				playerTurn();
				enemyToPlayerDamage = 0;
				playerToPlayerDamage = 0;
			}
			else
			{
				enemyToEnemyDamage = Math.ceil( 0 - (20 * Math.random()) );
				Actuate.tween (enemy, 1, { x: (player.x + 125), y: player.y }).repeat (1).reflect ();
				selection.pop();
				isPlayerAlive(playerToPlayerDamage, enemyToPlayerDamage);
				playerTurn();
				enemyToPlayerDamage = 0;
				playerToPlayerDamage = 0;
			}
		}
	}
	
	override public function onLoad():Void
	{
		var toMenu:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Main.png"), 
		"", onMenuClick);
		toMenu.y = 320;
		toMenu.x = 674;
		addChild( toMenu );
		
		var toQuit:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Quit.png"), 
		"", onQuitClick);
		toQuit.y = 390;
		toQuit.x = 674;
		addChild( toQuit );
	}

	private function onMenuClick()
	{
		Main.instance.loadScreen( ScreenTypes.Title );
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}