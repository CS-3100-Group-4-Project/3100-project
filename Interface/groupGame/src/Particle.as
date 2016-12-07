package 
{
	import flash.display.MovieClip;
	

	public class Particle extends MovieClip 
	{
		public var ySpeed:int = 0;
		public var xSpeed:int = 0;
		public var rSpeed:int = 0;
		public var timer:int = 0;
		public var grav:int = 0;
		public var timeMax:int = 0;
		public function Particle(size:int,grav:int, color:int, shape:String, time:int) 
		{
			this.graphics.beginFill(color, 1);
			if (shape == "circle")
				this.graphics.drawCircle(x, y, size / 2);
			else
				this.graphics.drawRect(x - size / 2, y - size / 2, size, size);
			this.graphics.endFill();
			this.grav = grav;
			this.timeMax = time;
		}
		
		public function update():void
		{
			x += xSpeed;
			y += ySpeed;
			rotation += rSpeed;
			ySpeed+= grav;
			alpha -= 1 / timeMax;
			timer++;
			if (xSpeed > 0)
				xSpeed -= .5;
			else
				xSpeed += .5;
		}
	}
}