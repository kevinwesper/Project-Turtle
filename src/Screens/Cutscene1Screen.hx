package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;

/**
 * Class for Cutscene 1
 * 
 * @author Kevin Beijer
 */

class Cutscene1Screen extends Screen
{
	public function new()
	{
		super();
		
		var cutscene1Data:BitmapData = Assets.getBitmapData( "img/Art#1.png");
		var cutscene1:Bitmap = new Bitmap( cutscene1Data );
		addChild(cutscene1);
	}
	
	override public function onLoad():Void
	{
		var toMenu:MenuButton = new MenuButton( onMenuClick );
		toMenu.x = 500;
		toMenu.y = 50;
		addChild( toMenu );
		
		var toSkip:SkipButton = new SkipButton( onSkipClick );
		toSkip.x = 500;
		toSkip.y = 150;
		addChild( toSkip );
		
		var toQuit:QuitButton = new QuitButton( onQuitClick );
		toQuit.x = 744;
		toQuit.y = 424;
		addChild( toQuit );
	}

	private function onMenuClick()
	{
		Main.instance.loadScreen( ScreenTypes.Title );
	}
	
	private function onSkipClick()
	{
		Main.instance.loadScreen( ScreenTypes.Game );
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
	
	// function to test cutscenes to move automaticaly
	private function wait()
	{
		Sys.sleep(.20);
		Main.instance.loadScreen( ScreenTypes.Game );
	}
}
