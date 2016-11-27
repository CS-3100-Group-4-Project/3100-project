package 
{

	import flash.display.MovieClip;
	
	public class HUD extends MovieClip
	{
		
		public function HUD() 
		{
			this.graphics.beginFill(0x00BBFF, 1);
			this.graphics.drawRect(x, y, 800 - 10 - x, 100 - 5 - y);
			this.graphics.endFill();
		}
		
	}

}