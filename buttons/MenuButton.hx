package buttons;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * Class for the Menu Button
 * 
 * @author Kevin
 */

class MenuButton extends Sprite
{

	var callback:Void->Void;
	
	public function new( callback:Void->Void ) 
	{
		super();
		
		var menuButtonData:BitmapData = Assets.getBitmapData( "img/Menu_Button.png");
		var menuButton:Bitmap = new Bitmap( menuButtonData );
		addChild(menuButton);
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		this.addEventListener ( MouseEvent.CLICK, playMenuButton );
	}
	
	function playMenuButton( e:MouseEvent ):Void
	{
		callback();
	}
	
}