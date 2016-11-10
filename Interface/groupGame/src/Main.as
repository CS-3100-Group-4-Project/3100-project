package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Main extends Sprite 
	{
		private var cam:MovieClip = new MovieClip();
		private var score:int = 0;
		private var textBox:TextField = new TextField();
		private var textStyle:TextFormat = new TextFormat("Arial", 18, 0x000000);
		
		public function Main() 
		{	
			addChild(cam);
			
			textBox.x = 10;
			textBox.y = 10;
			textBox.defaultTextFormat = textStyle;
			addChild(textBox);
			
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mDown);
		}
		
		public function mDown(e:MouseEvent):void
		{
			score += 1;
		}
		
		
		public function checkStuff(e:Event):void
		{
			textBox.text = "Score: " + score;
		}
	}
	
}