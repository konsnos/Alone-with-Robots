package actors 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class Robot extends Entity 
	{
		private var state:String;
		private var sprite:Spritemap;
		
		public function Robot(x:uint, y:uint, color:uint = 0xffffff) 
		{
			state = GlobalVariables.NONE;
			this.x = x;
			this.y = y;
			sprite = new Spritemap(GlobalVariables.imgROBOT, 150, 150);
			sprite.color = color;
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
			
			//sprite.color = 0x00ff00;
			graphic = sprite;
			sprite.play(GlobalVariables.NONE);
		}
		
		override public function update():void 
		{
			
		}
		
		public function move(todo:String):void 
		{
			sprite.play(todo);
		}
		
	}

}