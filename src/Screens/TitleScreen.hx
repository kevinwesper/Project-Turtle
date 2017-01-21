package screens;

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
 * @author Kevin Beijer
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
		var toGame:PlayButton = new PlayButton( onPlayClick );
		toGame.x = 500;
		toGame.y = 50;
		addChild( toGame );
		
		var toCredits:CreditsButton = new CreditsButton( onCreditsClick );
		toCredits.x = 500;
		toCredits.y = 150;
		addChild( toCredits );
		
		var toQuit:QuitButton = new QuitButton( onQuitClick );
		toQuit.x = 744;
		toQuit.y = 424;
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
