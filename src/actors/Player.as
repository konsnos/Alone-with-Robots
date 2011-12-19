package actors 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class Player extends Entity 
	{
		//private var state:String;
		private var toState:String;
		private var sprite:Spritemap;
		private var graphiclist:Graphiclist;
		private var image:Image;
		private var mimiced:Boolean;
		private var lives:uint;
		private var sndCorrect:Sfx;
		
		// GET-SET
		public function set toStateS(setValue:String):void 
		{
			toState = setValue;
			mimiced = false;
		}
		public function get mimicedG():Boolean
		{
			return mimiced;
		}
		public function get livesG():uint 
		{
			return lives;
			//FP.console.log(lives);
		}
		public function set livesS(setValue:uint):void 
		{
			if (setValue < 0)
			{
				setValue = 0;
			}else if (setValue > 10)
			{
				setValue = 10;
			}
			lives = setValue;
			//FP.console.log(lives);
		}
		
		public function Player(x:uint, y:uint) 
		{
			mimiced = false;
			lives = 3;
			toState = GlobalVariables.NONE;
			sndCorrect = new Sfx(GlobalVariables.sndCORRECT);
			
			image = new Image(GlobalVariables.imgFACE);
			image.centerOO();
			this.x = x;
			this.y = y;
			
			sprite = new Spritemap(GlobalVariables.imgROBOT, 150, 150);
			sprite.centerOO();
			sprite.add(GlobalVariables.NONE, [0], 0, false);
			sprite.add(GlobalVariables.UP, [1], 0, false);
			sprite.add(GlobalVariables.DOWN, [2], 0, false);
			sprite.add(GlobalVariables.RIGHT, [3], 0, false);
			sprite.add(GlobalVariables.LEFT, [4], 0, false);
			sprite.add(GlobalVariables.UPRIGHT, [5], 0, false);
			sprite.add(GlobalVariables.UPLEFT, [6], 0, false);
			sprite.add(GlobalVariables.DOWNRIGHT, [7], 0, false);
			sprite.add(GlobalVariables.DOWNLEFT, [8], 0, false);
			
			sprite.color = 0xffffff;
			
			graphiclist = new Graphiclist(sprite, image);
			graphic = graphiclist;
			sprite.play(GlobalVariables.NONE);
		}
		
		override public function update():void 
		{
			//FP.console.log(sprite.currentAnim + " | " + toState);
			if (sprite.currentAnim == toState)
			{
				if (mimiced != true && sprite.currentAnim != GlobalVariables.NONE)
				{
					mimiced = true;
					SoundSystem.play(sndCorrect);
				}
			}else
			{
				checkInput();
			}
		}
		
		
		private function checkInput():void 
		{
			if (Input.check(GlobalVariables.UP))
			{
				sprite.play(GlobalVariables.UP);
				if (Input.check(GlobalVariables.RIGHT))
				{
					sprite.play(GlobalVariables.UPRIGHT);
				}else if (Input.check(GlobalVariables.LEFT))
				{
					sprite.play(GlobalVariables.UPLEFT);
				}
			}else if(Input.check(GlobalVariables.DOWN)) 
			{
				sprite.play(GlobalVariables.DOWN);
				if (Input.check(GlobalVariables.RIGHT))
				{
					sprite.play(GlobalVariables.DOWNRIGHT);
				}else if (Input.check(GlobalVariables.LEFT))
				{
					sprite.play(GlobalVariables.DOWNLEFT);
				}
			}else if(Input.check(GlobalVariables.RIGHT))
			{
				sprite.play(GlobalVariables.RIGHT);
			}else if(Input.check(GlobalVariables.LEFT))
			{
				sprite.play(GlobalVariables.LEFT);
			}else
			{
				sprite.play(GlobalVariables.NONE);
			}
		}
		
		public function move(todo:String):void 
		{
			sprite.play(todo);
		}
	}

}