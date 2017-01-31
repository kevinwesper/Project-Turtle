package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;

/**
 * Class for a small disclaimer
 * @author Kevin
 */
class DisclaimerScreen extends Screen
{

	public function new()
	{
		super();
		
		var cutscene1Data:BitmapData = Assets.getBitmapData( "img/Disclaimer.png");
		var cutscene1:Bitmap = new Bitmap( cutscene1Data );
		addChild(cutscene1);
	}
	
	override public function onLoad():Void
	{
		var toNext:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Next.png"), 
		"", onSkipClick);
		toNext.y = 340;
		toNext.x = 550;
		addChild( toNext );
		
		var toQuit:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Quit.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Quit.png"), 
		"", onQuitClick);
		toQuit.y = 340;
		toQuit.x = 674;
		addChild( toQuit );
	}
	
	private function onSkipClick()
	{
		Main.instance.loadScreen( ScreenTypes.Cutscene1 );
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}