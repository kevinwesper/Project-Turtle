package buttons;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * Class for the Quit Button
 * 
 * @author Kevin
 */

class QuitButton extends Sprite
{

	var callback:Void->Void;
	
	public function new( callback:Void->Void ) 
	{
		super();
		
		var quitButtonData:BitmapData = Assets.getBitmapData( "img/Quit_Button.png");
		var quitButton:Bitmap = new Bitmap( quitButtonData );
		addChild(quitButton);
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		this.addEventListener ( MouseEvent.CLICK, playQuitButton );
	}
	
	function playQuitButton( e:MouseEvent ):Void
	{
		callback();
	}
	
}