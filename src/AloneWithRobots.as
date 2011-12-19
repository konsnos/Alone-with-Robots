package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import worlds.Menu;
	import worlds.Play;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class AloneWithRobots extends Engine 
	{
		
		public function AloneWithRobots():void 
		{
			super(600, 600);
			FP.screen.color = 0x888888;
			GlobalVariables.score = 0;
			FP.world = new Menu();
			SoundSystem.reset();
			SoundSystem.loop(new Sfx(GlobalVariables.sndTHEME));
			//FP.console.enable();
			Input.define("UP", Key.UP, Key.W);
			Input.define("DOWN", Key.DOWN, Key.S);
			Input.define("RIGHT", Key.RIGHT,Key.D);
			Input.define("LEFT", Key.LEFT, Key.A);
			Input.define("MUTE", Key.M);
		}
		
	}
	
}