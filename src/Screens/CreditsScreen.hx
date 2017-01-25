package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;

/**
 * Class for the Credits Screen
 * 
 * @author Kevin Beijer
 */

class CreditsScreen extends Screen
{
	public function new()
	{
		super();
		
		var creditsData:BitmapData = Assets.getBitmapData( "img/Credits.png");
		var credits:Bitmap = new Bitmap( creditsData );
		addChild(credits);
	}
	
	override public function onLoad():Void
	{	var toMenu:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Main.png"), 
		"Menu", onMenuClick);
		toMenu.y = 150;
		toMenu.x = 674;
		addChild( toMenu );
		

		
		var toQuit:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Quit.png"), 
		"Quit game", onQuitClick);
		toQuit.y = 270;
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
