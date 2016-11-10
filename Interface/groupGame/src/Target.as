package 
{
	import flash.display.MovieClip;
	public class Target extends MovieClip 
	{
		public var xSpeed:int = 5;
		public var ySpeed:int = 5;
		
		
		public function Target() 
		{
			this.graphics.beginFill(0x0000FF, 1);
			this.graphics.drawCircle(this.x, this.y, 25);
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
			else if(this.y - (this.height / 2) < 0)
			{
				this.ySpeed *= -1;
				this.y = (this.height / 2);
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
		}
		
	}

}