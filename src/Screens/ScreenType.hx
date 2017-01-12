package screens;

// for explanation on see: http://haxe.org/manual/types-enum-instance.html or http://haxecoder.com/post.php?id=13
// for now, see them as identifiers of something. in this case a screen must be either the menu screen or the game screen

/**
 * The base class for all screens.
 * The onLoad and onDestroy can be implemented in the derived classes.
 * 
 * @author Kevin Beijer, Deborah ..., Dea ..., Shaquille ... & George ...
 */

enum ScreenType
{
	Menu;
	Game;
}
