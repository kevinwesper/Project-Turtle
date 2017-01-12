package screens;

import openfl.Assets;

import openfl.display.Sprite;

/**
 * Simple screen in the application.
 * Shows a text and a button.
 *
 * @author Kevin Beijer, Deborah ..., Dea ..., Shaquille ... & George ...
 */
class MenuScreen extends Screen
{
	public function new()
	{
		super();
	}
	
	override public function onLoad():Void
	{
		var it:InstructionText = new InstructionText( "This is the menu screen. Choice is plentyful" );
		it.x = (stage.stageWidth - it.width) / 2;
		it.y = stage.stageHeight / 2;
		addChild( it );

		var toGame:Button = new Button( 
			Assets.getBitmapData("img/Button.png"), 
			Assets.getBitmapData("img/Button_over.png"), 
			Assets.getBitmapData("img/Button_pressed.png"), 
			"Play", 
			onPlayClick );

		toGame.x = (stage.stageWidth-toGame.width) / 2;
		toGame.y = stage.stageHeight / 3;
		addChild( toGame );
	}

	private function onPlayClick()
	{
		Main.instance.loadScreen( ScreenType.Game );
	}

}
