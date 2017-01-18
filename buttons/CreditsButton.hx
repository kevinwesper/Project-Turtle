package buttons;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * Class for the Credits Button
 * 
 * @author Kevin
 */

class CreditsButton extends Sprite
{

	var callback:Void->Void;
	
	public function new( callback:Void->Void ) 
	{
		super();
		
		var creditsButtonData:BitmapData = Assets.getBitmapData( "img/Credits_Button.png");
		var creditsButton:Bitmap = new Bitmap( creditsButtonData );
		addChild(creditsButton);
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		this.addEventListener ( MouseEvent.CLICK, playCreditsButton );
	}
	
	function playCreditsButton( e:MouseEvent ):Void
	{
		callback();
	}
	
}