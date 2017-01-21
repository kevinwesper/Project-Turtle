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
		var toMenu:MenuButton = new MenuButton( onMenuClick );
		toMenu.x = 500;
		toMenu.y = 50;
		addChild( toMenu );
		
		var toQuit:QuitButton = new QuitButton( onQuitClick );
		toQuit.x = 744;
		toQuit.y = 424;
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
