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
			case ScreenTypes.Battle1:
				currentScreen = new Battle1Screen();
			case ScreenTypes.Battle2:
				currentScreen = new Battle2Screen();
			case ScreenTypes.Battle3:
				currentScreen = new Battle3Screen();
			case ScreenTypes.Battle4:
				currentScreen = new Battle4Screen();
			case ScreenTypes.Battle5:
				currentScreen = new Battle5Screen();
			case ScreenTypes.Credits:
				currentScreen = new CreditsScreen();
			case ScreenTypes.Cutscene1:
				currentScreen = new Cutscene1Screen();
			case ScreenTypes.Cutscene2:
				currentScreen = new Cutscene2Screen();
			case ScreenTypes.Cutscene3:
				currentScreen = new Cutscene3Screen();
			case ScreenTypes.Cutscene4:
				currentScreen = new Cutscene4Screen();
			case ScreenTypes.Cutscene5:
				currentScreen = new Cutscene5Screen();
			case ScreenTypes.Cutscene6:
				currentScreen = new Cutscene6Screen();
			case ScreenTypes.Cutscene7:
				currentScreen = new Cutscene7Screen();
			case ScreenTypes.Cutscene8:
				currentScreen = new Cutscene8Screen();
			case ScreenTypes.Cutscene9:
				currentScreen = new Cutscene9Screen();
			case ScreenTypes.Cutscene10:
				currentScreen = new Cutscene10Screen();
			case ScreenTypes.Cutscene11:
				currentScreen = new Cutscene11Screen();
			case ScreenTypes.Cutscene12:
				currentScreen = new Cutscene12Screen();
			case ScreenTypes.Cutscene13:
				currentScreen = new Cutscene13Screen();
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
