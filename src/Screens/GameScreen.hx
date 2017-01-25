package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;

/**
 * Class for the Game Screen
 * 
 * @author Kevin Beijer
 */

class GameScreen extends Screen
{
	private var game:TurtleGame;
	
	public function new()
	{
		super();
		
		game = new TurtleGame();
		addChild( game );
	}
	
	override public function onLoad():Void
	{
	package screens;

import flash.display.SimpleButton;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;

/**
 * Class for the Title Screen
 * 
 * @author Kevin
 */

class TitleScreen extends Screen
{
	public function new() 
	{
		super();
		
		var titleData:BitmapData = Assets.getBitmapData( "img/Starting screen_right size.png");

		var title:Bitmap = new Bitmap( titleData );
	
		addChild(title);
	}

	override public function onLoad():Void
	{
		var toGame:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Start.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Start.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Start.png"), 
		"Start", onPlayClick);
		toGame.y = 150;
		toGame.x = 344;
		addChild( toGame );
		
		var toCredits:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Credits.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Credits.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Credits.png"), 
		"Credits", onCreditsClick);
		toCredits.y = 210;
		toCredits.x = 344;
		addChild( toCredits );
		
		var toQuit:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Quit.png"), 
		"Quit game", onQuitClick);
		toQuit.y = 270;
		toQuit.x = 344;
		addChild( toQuit );
	}

	private function onPlayClick()
	{
		Main.instance.loadScreen( ScreenTypes.Cutscene1 );
	}
	
	private function onCreditsClick()
	{
		Main.instance.loadScreen( ScreenTypes.Credits );
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}
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
