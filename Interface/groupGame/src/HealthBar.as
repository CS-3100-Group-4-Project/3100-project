package 
{
	import flash.display.MovieClip;
	public class HealthBar extends MovieClip
	{
		public function HealthBar(color:int) 
		{
			this.graphics.beginFill(color, 1);
			this.graphics.drawRect(x, y - 13, 100, 25);
			this.graphics.endFill();
			
			this.graphics.lineStyle(0, 0x000000, 1);
			this.graphics.drawRect(x, y - 13, 100 - 1, 25 - 1);
		}
	}
}