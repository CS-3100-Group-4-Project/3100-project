package 
{

	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class HUD extends MovieClip
	{
		private var hpText:TextField = new TextField();
		public var hp:HealthBar = new HealthBar(0xCC0000);
		private var hpTotal:HealthBar = new HealthBar(0x000000);
		public var numberHealth:int = 100;
		
		public function HUD(textStyle:TextFormat) 
		{
			hpText.x = 575;
			hpText.y = 23;
			hpText.defaultTextFormat = textStyle;
			hpText.text = "Health:";
			addChild(hpText);
			hpTotal.x = 650;
			hpTotal.y = 36;
			addChild(hpTotal);
			hp.x = 650;
			hp.y = 36;
			addChild(hp);
			
			this.graphics.beginFill(0x00BBFF, 1);
			this.graphics.drawRect(x, y, 800 - 10 - x, 100 - 5 - y);
			this.graphics.endFill();
			
			this.graphics.lineStyle(0, 0x000000, 1);
			this.graphics.drawRect(x, y, 800 - 10 - x - 1, 100 - 5 - y - 1);
		}
		
	}

}