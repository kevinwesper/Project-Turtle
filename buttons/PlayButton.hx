package buttons;

import openfl.Assets;

import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

import openfl.events.Event;
import openfl.events.MouseEvent;

/**
 * Class for the Play Button
 * 
 * @author Kevin
 */

class PlayButton extends Sprite
{

	var callback:Void->Void;
	
	public function new( callback:Void->Void ) 
	{
		super();
		
		var playButtonData:BitmapData = Assets.getBitmapData( "img/Play_Button.png");
		var playButton:Bitmap = new Bitmap( playButtonData );
		addChild(playButton);
		
		this.callback = callback;
		
		addEventListener( Event.ADDED_TO_STAGE, init );
	}
	
	function init( e:Event )
	{
		removeEventListener( Event.ADDED_TO_STAGE, init );
		this.addEventListener ( MouseEvent.CLICK, playPlayButton );
	}
	
	function playPlayButton( e:MouseEvent ):Void
	{
		callback();
	}
	
}