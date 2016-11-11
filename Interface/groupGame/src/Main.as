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
		public var target:Target = new Target;
		private var xPos:int = 350;
		private var yPos:int = 350;
		private var textBox:TextField = new TextField();
		private var textStyle:TextFormat = new TextFormat("Arial", 18, 0x000000);
		
		[Embed(source = "../res/goodClick.mp3")]
		private var GoodClick:Class; 		 
		private var goodClickSound:Sound;		     
		
		public function Main() 
		{	
			addChild(cam);
			
			target.x = xPos;
			target.y = yPos;
			cam.addChild(target);
			
			textBox.x = 10;
			textBox.y = 10;
			textBox.defaultTextFormat = textStyle;
			addChild(textBox);
			
			goodClickSound = (new GoodClick) as Sound; 	
			
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mDown);
			cam.setChildIndex(target, cam.numChildren - 1);
		}
		
		public function mDown(e:MouseEvent):void
		{
			if ((mouseX < (target.x + (target.width / 2))) && (mouseX > (target.x - (target.width / 2))) && 
				(mouseY < (target.y + (target.height / 2))) && (mouseY > (target.y - (target.height / 2))))
			{
				goodClickSound.play(0, 1);
				score += 1;
				target.x = (Math.round(Math.random() * 800));
				target.y = (Math.round(Math.random() * 600));
				
				if ((Math.round(Math.random() * 2)) < 2)
				{
					target.xSpeed *= -1;
				}
				if ((Math.round(Math.random() * 600)) < 2)
				{
					target.ySpeed *= -1;
				}
				
				if (target.xSpeed < 1)
				{
					target.xSpeed -= 1;
				}
				else
				{
					target.xSpeed += 1;
				}
				if (target.ySpeed < 1)
				{
					target.ySpeed -= 1;
				}
				else
				{
					target.ySpeed += 1;
				}
				target.adjust();
			}
		}
		
		
		public function checkStuff(e:Event):void
		{
			textBox.text = "Score: " + score;
			target.adjust();
		}
	}
	
}