package screens;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;

import buttons.*;
/**
 * ...
 * @author Kevin Beijer
 */
class Cutscene4Screen extends Screen
{
	public function new()
	{
		super();
		
		var cutscene4Data:BitmapData = Assets.getBitmapData( "img/Art#4.png");
		var cutscene4:Bitmap = new Bitmap( cutscene4Data );
		addChild(cutscene4);
	}
	
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
		Main.instance.loadScreen( ScreenTypes.Battle1);
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
	
	// function to test cutscenes to move automaticaly

}