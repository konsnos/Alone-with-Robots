package actors.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class Stats extends Entity 
	{
		private var score:Text;
		private var lives:uint;
		private var hearts:Array;
		private var graphiclist:Graphiclist;
		
		// GET-SET
		public function set livesS(setValue:uint):void 
		{
			lives = setValue;
		}
		
		public function Stats() 
		{
			score = new Text(GlobalVariables.score.toString());
			score.color = 0xffff00;
			score.smooth = true;
			score.size = 40;
			score.x = FP.halfWidth - score.width / 2;
			score.y = FP.height - score.height - 10;
			
			fillGraphiclist();
			
			graphic = graphiclist;
		}
		
		public function addHearts():void 
		{
			hearts = new Array();
			for (var i:uint = 0; i < lives; i++)
			{
				hearts.push(new Image(GlobalVariables.imgHEART));
				Image(hearts[i]).scale = 2;
				Image(hearts[i]).x = 25 * (i + 1) - 10;
				Image(hearts[i]).y = FP.height - Image(hearts[i]).height - 30;
				
			}
		}
		
		public function fillGraphiclist():void 
		{
			addHearts();
			
			graphiclist = new Graphiclist();
			graphiclist.add(score);
			for (var i:uint = 0; i < hearts.length; i++)
			{
				graphiclist.add(Image(hearts[i]));
			}
			
			graphic = graphiclist;
		}
		
		public function add(value:uint):void 
		{
			GlobalVariables.score += value;
			score.text = GlobalVariables.score.toString();
			
		}
		
		public function resetGraphic():void 
		{
			
		}
		
	}

}