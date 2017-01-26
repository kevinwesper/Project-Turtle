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

class Cutscene2Screen extends Screen
{
	public function new()
	{
		super();
		
		var cutscene2Data:BitmapData = Assets.getBitmapData( "img/Art#2.png");
		var cutscene2:Bitmap = new Bitmap( cutscene2Data );
		addChild(cutscene2);
	}
	
	override public function onLoad():Void
	{
		var toMenu:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Main.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Main.png"), 
		"Menu", onMenuClick);
		toMenu.y = 150;
		toMenu.x = 674;
		addChild( toMenu );
		
			var toNext:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Next.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Next.png"), 
		"Next", onSkipClick);
		toNext.y = 210;
		toNext.x = 674;
		addChild( toNext );
		
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
	
	private function onSkipClick()
	{
		Main.instance.loadScreen( ScreenTypes.Cutscene3);
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}
