package actors.ui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import worlds.Menu;
	import worlds.Play;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class LostObj extends Entity 
	{
		private var lost:Text;
		private var tryAgain:Text;
		private var back:Text;
		private var graphiclist:Graphiclist;
		
		public function LostObj() 
		{
			lost = new Text("You wake up! Phew, for a moment you thought you saw about " + GlobalVariables.score + " robots.\n\n");
			lost.wordWrap = true;
			lost.align = "center";
			lost.color = 0x72ff71;
			lost.smooth = true;
			lost.size = 30;
			lost.width = 500;
			lost.height = 100;
			lost.x = FP.halfWidth - lost.width / 2;
			lost.y = FP.halfHeight - lost.height / 2 - 100;
			
			tryAgain = new Text("Wanna sleep again?");
			tryAgain.wordWrap = true;
			tryAgain.align = "center";
			tryAgain.color = 0xb02019;
			tryAgain.smooth = true;
			tryAgain.size = 25;
			tryAgain.width = 300;
			tryAgain.height = 50;
			tryAgain.x = FP.halfWidth - tryAgain.width / 2;
			tryAgain.y = FP.halfHeight - tryAgain.height / 2 + 100;
			
			back = new Text("Back to safety.");
			back.wordWrap = true;
			back.align = "center";
			back.color = 0xabfffb;
			back.smooth = true;
			back.size = 25;
			back.width = 300;
			back.height = 50;
			back.x = FP.halfWidth - back.width / 2;
			back.y = FP.halfHeight - back.height / 2 + 200;
			
			graphiclist = new Graphiclist(lost, tryAgain, back);
			graphic = graphiclist;
		}
		
		override public function update():void 
		{
			super.update();
			
			checkButtons();
		}
		
		public function checkButtons():void 
		{
			if (Input.mouseReleased)
			{
				if (Input.mouseX > tryAgain.x && Input.mouseX < tryAgain.x + tryAgain.width &&
				Input.mouseY > tryAgain.y && Input.mouseY < tryAgain.y + tryAgain.height)
				{
					FP.world = new Play();
				}else if(Input.mouseX > back.x && Input.mouseX < back.x + back.width &&
				Input.mouseY > back.y && Input.mouseY < back.y + back.height)
				{
					FP.world = new Menu();
				}
			}
		}
		
	}

}