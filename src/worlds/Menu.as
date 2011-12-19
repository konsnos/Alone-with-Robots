package worlds 
{
	import actors.ui.buttons.BtnPlay;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class Menu extends World 
	{
		private var directions:Text;
		private var instructions:Text;
		private var credits:Text;
		private var btnPlay:BtnPlay;
		private const imgTITLE:Image = new Image(GlobalVariables.imgTITLE);
		private const imgINSTRUCTIONS:Image = new Image(GlobalVariables.imgARROWS);
		private var sndClick:Sfx = new Sfx(GlobalVariables.sndCLICK);
		
		public function Menu() 
		{
			directions = new Text("You are dreaming.\n\nYou find yourself alone in a closed room, full of robots. You know the robots don't like humans, so you have to trick them to think that you are one of their own.\n\nYou start by mimiking them...\n              but how long will you last?",
			10, 50);
			directions.color = 0x000000;
			directions.wordWrap = true;
			directions.smooth = true;
			directions.size = 25;
			directions.width = 580;
			directions.height = 400;
			
			instructions = new Text("Try copying the robots by pointing where they do, with the arrow keys.\n\nPress 'M' key for mute.",
			10,300);
			instructions.color = 0x000000;
			instructions.wordWrap = true;
			instructions.smooth = true;
			instructions.size = 25;
			instructions.width = 340;
			instructions.height = 300;
			
			credits = new Text("Made for Ludum Dare 22, by konsnos",FP.halfWidth + 50, 500);
			credits.color = 0x8fbc8f;
			credits.wordWrap = true;
			credits.smooth = true;
			credits.size = 25;
			credits.width = 280;
			credits.height = 300;
			
			btnPlay = new BtnPlay();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			GlobalVariables.state = GlobalVariables.MAINMENU;
			
			addGraphic(imgTITLE,0, 130, 4);
			addGraphic(directions);
			addGraphic(instructions);
			addGraphic(credits);
			addGraphic(imgINSTRUCTIONS, 0, FP.width / 10 * 6, FP.height / 11 * 5+10);
			
			//FP.world.addGraphic(btnPlay, 0, 209, 500);
			btnPlay.x = 100;
			btnPlay.y = 480;
			add(btnPlay);
		}
		
		override public function update():void 
		{
			if (Input.mouseReleased)
			{
				if (Input.mouseX > btnPlay.x && Input.mouseX < btnPlay.x + btnPlay.width && 
				Input.mouseY > btnPlay.y && Input.mouseY < btnPlay.y + btnPlay.height)
				{
					FP.console.log("Play is touched");
					SoundSystem.play(sndClick);
					GlobalVariables.score = 0;
					FP.world = new Play();
				}
			}
			
			if (Input.check("MUTE"))
			{
				SoundSystem.reverseMute();
			}
			
			super.update();
		}
		
	}

}