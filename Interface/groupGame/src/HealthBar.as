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
		}
	}
}