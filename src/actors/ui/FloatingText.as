package actors.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.NumTween;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class FloatingText extends Entity 
	{
		public var title:Text;
		public var speed:int;
		public var duration:Number;
		public var timeElapsed:Number;
		public var alpha:NumTween;
		
		/**
		 * Creates a floating text.
		 */
		public function FloatingText() 
		{
			title = new Text("");
			title.align = "center";
			title.centerOO();
			//title.font = 'FONT_STATS';
			speed = 50;
			super();
		}
		
		/**
		 * Fades the floating text, and lifts it up.
		 */
		override public function update():void 
		{
			title.alpha = alpha.value;
			this.y -= speed * FP.elapsed;
		}
		
		/**
		 * Recycles the floating text.
		 */
		public function disappeared():void 
		{
			FP.world.recycle(this);
		}
		
		/**
		 * Resets the floating text.
		 * @param	x Location in the x (right-left) axis.
		 * @param	y Location in the y (top-bottom) axis.
		 * @param	text The number concatenated with a '+' in front.
		 * @param	duration The time it takes to fade out.
		 */
		public function reset(x:Number,y:Number, text:String, color:uint = 0xff0000, duration:Number=0.6):void 
		{
			title.text = String(text);
			
			this.duration = duration;
			timeElapsed = 0;
			title.color = color;
			title.size = 40;
			alpha = new NumTween(disappeared);
			alpha.tween(1, 0, duration, Ease.cubeIn);
			addTween(alpha);
			graphic = new Graphiclist(title);
			this.x = x - title.width / 2;
			this.y = y - title.height / 2;
		}
		
	}

}