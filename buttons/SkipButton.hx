package buttons;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * Class for the Skip Button
 * 
 * @author Kevin
 */

class SkipButton extends Sprite
{

	var callback:Void->Void;
	
	public function new( callback:Void->Void ) 
	{
		super();
		
		var skipButtonData:BitmapData = Assets.getBitmapData( "img/Skip_Button.png");
		var skipButton:Bitmap = new Bitmap( skipButtonData );
		addChild(skipButton);
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		this.addEventListener ( MouseEvent.CLICK, playSkipButton );
	}
	
	function playSkipButton( e:MouseEvent ):Void
	{
		callback();
	}
	
}