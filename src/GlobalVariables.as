package  
{
	import flash.display.BitmapData;
	import flash.ui.ContextMenuItem;
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class GlobalVariables 
	{
		// IMAGES
		[Embed(source = "../assets/images/arrows.png")] public static const imgARROWS:Class;
		[Embed(source = "../assets/images/play.png")] public static const btnPLAY:Class;
		[Embed(source = "../assets/images/title.png")] public static const imgTITLE:Class;
		[Embed(source = "../assets/images/robot.png")] public static const imgROBOT:Class;
		[Embed(source = "../assets/images/face.png")] public static const imgFACE:Class;
		[Embed(source = "../assets/images/room-01.png")] public static const ROOM01:Class;
		[Embed(source = "../assets/images/heart.png")] public static const imgHEART:Class;
		public static const imgPARTICLE:BitmapData = new BitmapData(4, 4, false);
		
		// SOUDNS
		[Embed(source = "../assets/sounds/FrozenJam_tgfcoder.mp3")] public static const sndTHEME:Class;
		
		// SOUND EFFECTS
		[Embed(source = "../assets/sounds/correct.mp3")] public static const sndCORRECT:Class;
		[Embed(source = "../assets/sounds/click.mp3")] public static const sndCLICK:Class;
		[Embed(source = "../assets/sounds/lostLife.mp3")] public static const sndLOST:Class;
		
		// ROBOT STATES
		public static const NONE:String = "NONE";
		public static const UP:String = "UP";
		public static const DOWN:String = "DOWN";
		public static const RIGHT:String = "RIGHT";
		public static const LEFT:String = "LEFT";
		public static const UPRIGHT:String = "UPRIGHT";
		public static const UPLEFT:String = "UPLEFT";
		public static const DOWNRIGHT:String = "DOWNRIGHT";
		public static const DOWNLEFT:String = "DOWNLEFT";
		
		// GAME STATES
		public static var state:uint;
		public static const PLAYING:uint = 0;
		public static const PREPARING:uint = 1;
		public static const FOUND:uint = 2;
		public static const PAUSED:uint = 3;
		public static const MAINMENU:uint = 4;
		public static const LOST:uint = 5;
		
		// GAME VARIABLES
		public static var score:uint;
		
		public function GlobalVariables() 
		{
			
		}
		
	}

}