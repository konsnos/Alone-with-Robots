package actors.ui.buttons 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class BtnPlay extends Entity 
	{
		private var image:Image;
		
		public function BtnPlay() 
		{
			image = new Image(GlobalVariables.btnPLAY);
			width = image.width;
			height = image.height;
			
			graphic = image;
		}
		
	}

}