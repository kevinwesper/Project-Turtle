package screens;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.Event;
import flash.system.System;
import screens.Screen;

import buttons.*;
/**
 * ...
 * 
 * @author Kevin Beijer
 */
class Dead3Screen extends Screen
{

	public function new() 
	{
		super();
		
		var deadData:BitmapData = Assets.getBitmapData( "img/YouDied.png");
		var dead:Bitmap = new Bitmap( deadData );
		addChild(dead);
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
		
		var toContinue:Button = new Button(Assets.getBitmapData("img/Button_Turtle_Up_Continue.png"), 
		Assets.getBitmapData("img/Button_Turtle_Over_Continue.png"), 
		Assets.getBitmapData("img/Button_Turtle_Down_Continue.png"), 
		"", onContinueClick);
		toContinue.y = 210;
		toContinue.x = 674;
		addChild( toContinue );
		
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
	
	private function onContinueClick()
	{
		Main.instance.loadScreen( ScreenTypes.Battle3 );
	}
	
	private function onQuitClick()
	{
		Sys.exit(0);
	}
}
