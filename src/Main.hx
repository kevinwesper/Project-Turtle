package;

import openfl.display.Sprite;
//import screens.Cutscene1Screen;
//import screens.Screen;
import screens.*;
import buttons.*;

/**
 * Class for the screens to change. For all the screens to come together and have a great time
 * 
 * @author Kevin
 */

class Main extends Sprite 
{
	private var currentScreen:Screen;
	public static var instance(get, null):Main;

	private function new () 
	{
		super ();
	}

	public function loadScreen( which:ScreenTypes )
	{
		if( currentScreen != null && contains( currentScreen ) )
		{
			removeChild( currentScreen );
			currentScreen.onDestroy();
		}
		switch ( which ) 
		{
			case ScreenTypes.Title:
				currentScreen = new TitleScreen();
			case ScreenTypes.Game:
				currentScreen = new GameScreen();
			case ScreenTypes.Credits:
				currentScreen = new CreditsScreen();
			case ScreenTypes.Cutscene1:
				currentScreen = new Cutscene1Screen();
		}
		addChild( currentScreen );
		currentScreen.onLoad();
	}

	public static function get_instance():Main
	{
		if( instance == null )
			instance = new Main();
		return instance;
	}

	public static function main()
	{
		var m:Main = Main.instance;
		openfl.Lib.current.stage.addChild( m );

		m.loadScreen( ScreenTypes.Title );
	}
}