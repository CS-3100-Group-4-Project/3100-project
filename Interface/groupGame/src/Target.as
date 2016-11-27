package 
{
	import flash.display.MovieClip;
	public class Target extends MovieClip 
	{
		public var xSpeed:int = 5;
		public var ySpeed:int = 5;
		public var radius:int = 25;
		public var radiusTimer:int = 10;
		public var radiusTimerMax:int = 10;
		public var radiusMin:int = 5;
		
		
		public function Target() 
		{
			this.graphics.beginFill(0x0000FF, 1);
			this.graphics.drawCircle(this.x, this.y, radius);
			this.graphics.endFill();
		}
		
		public function adjust():void
		{
			this.y += ySpeed;
			this.x += xSpeed;
			
			if (this.y + (this.height / 2) > 600)
			{
				this.ySpeed *= -1;
				this.y = 600 - (this.height / 2);
			}
			else if(this.y - (this.height / 2) < 100)
			{
				this.ySpeed *= -1;
				this.y = 100 + (this.height / 2);
			}
			
			if (this.x + (this.width / 2) > 800)
			{
				this.xSpeed *= -1;
				this.x = 800 - (this.width / 2);
			}
			else if(this.x - (this.width / 2) < 0)
			{
				this.xSpeed *= -1;
				this.x = (this.width / 2);
			}
			
			/*
			radiusTimer -= 1;
			if (radiusTimer < 0)
			{
				radiusTimer = radiusTimerMax;
				radius -= 1;
			}
			if (radius < radiusMin)
			{
				radius = radiusMin;
			}*/
		}
		
	}

}