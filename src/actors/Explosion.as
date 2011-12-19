package actors
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	
	/**
	 * ...
	 * @author konsnos
	 */
	public class Explosion extends Entity 
	{
		private var explosion:Emitter;
		protected var explosionSize:uint;
		
		public function Explosion() // Need also color
		{
			explosion = new Emitter(GlobalVariables.imgPARTICLE);
			explosion.newType("explode", [0]);
			explosion.relative = false;
			collidable = false;
		}
		
		override public function update():void
		{
			/*if ((GlobalVariables.state == GlobalVariables.PAUSE) && explosion.active)
			{
				explosion.active = false;
			}else if (!explosion.active && GlobalVariables.state != GlobalVariables.PAUSE)
			{
				explosion.active = true;
			}*/
			
			if (explosion.active && explosion.particleCount == 0)
			{
				this.world.recycle(this);
			}
		}
		
		/**
		 * Emits the particles.
		 */
		public function explode():void
		{
			for (var i:uint = 0; i < explosionSize; i++)
			{
				explosion.emit("explode", x, y);
			}
		}
		
		/**
		 * Starts the recycled or new particle at the given parameters.
		 * @param	x Position in the x axis.
		 * @param	y Position in the y axis.
		 * @param	sign Minus or plus for enemies or the player respectively.
		 * @param	color The color of the particles.
		 * @param	size The amount of particles.
		 */
		public function reset(x:Number, y:Number, sign:Number, color:uint, size:uint = 50):void
		{
			explosionSize = size;
			explosion.x = x;
			explosion.y = y;
			explosion.setMotion("explode", 0, 300, 1, 360, -100, 1);
			explosion.setColor("explode", color);
			
			graphic = new Graphiclist(explosion);
			
			explode();
		}
		
	}

}