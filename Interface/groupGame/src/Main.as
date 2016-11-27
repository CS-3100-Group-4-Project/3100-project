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
	
	[SWF(backgroundColor="0xec9900")]
	public class Main extends Sprite 
	{
		private var cam:MovieClip = new MovieClip();
		public var target:Target = new Target;
		private var playing:Boolean = true;
		private var hud:HUD = new HUD();
		private var score:int = 0;
		private var time:int = 5;
		private var timeFrames:int = 45;
		private var xPos:int = 350;
		private var yPos:int = 350;
		private var textBox:TextField = new TextField();
		private var timeBox:TextField = new TextField();
		private var gameOver:TextField = new TextField();
		private var replay:TextField = new TextField();
		private var textStyle:TextFormat = new TextFormat("Arial", 18, 0x000000);
		
		[Embed(source = "../res/goodClick.mp3")]
		private var GoodClick:Class; 		 
		private var goodClickSound:Sound;		     
		
		public function Main() 
		{
			addChild(cam);
			
			hud.x = 5;
			hud.y = 5;
			addChild(hud);
			
			target.x = xPos;
			target.y = yPos;
			cam.addChild(target);
			
			textBox.x = 10;
			textBox.y = 10;
			textBox.defaultTextFormat = textStyle;
			addChild(textBox);
			
			timeBox.x = 10;
			timeBox.y = 40;
			timeBox.defaultTextFormat = textStyle;
			addChild(timeBox);
			
			this.graphics.lineStyle(0, 0x000000, 0.5);
			this.graphics.drawRect(0, 0, 799, 599);
			
			goodClickSound = (new GoodClick) as Sound; 	
			
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mDown);
			cam.setChildIndex(target, cam.numChildren - 1);
		}
		
		public function mDown(e:MouseEvent):void
		{
			if (playing == true)
			{
				if ((mouseX < (target.x + (target.width / 2))) && (mouseX > (target.x - (target.width / 2))) && 
					(mouseY < (target.y + (target.height / 2))) && (mouseY > (target.y - (target.height / 2))))
				{
					goodClickSound.play(0, 1);
					score += 10;
					time = 5;
					timeFrames = 45;
					target.x = (Math.round(Math.random() * 800));
					target.y = (Math.round(Math.random() * 600));
					target.radius = 25;
					
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
			if (playing == false)
			{
				timeFrames = 45;
				time = 5;
				score = 0;
				target.xSpeed = 5;
				target.ySpeed = 5;
				target.x = (Math.round(Math.random() * 800));
				target.y = (Math.round(Math.random() * 600));
				playing = true;
				removeChild(gameOver);
				removeChild(replay);
				
			}
		}
		
		
		public function checkStuff(e:Event):void
		{
			if (playing == true)
			{
				timeFrames -= 1;
				if (timeFrames < 1)
				{
					timeFrames = 45;
					time -= 1;
					if (time < 0)
					{
						time = 0;
						playing = false;
						
						gameOver.x = 330;
						gameOver.y = 270;
						gameOver.defaultTextFormat = textStyle;
						gameOver.text = "Game Over";
						addChild(gameOver);
						
						replay.x = 330;
						replay.y = 300;
						replay.defaultTextFormat = textStyle;
						replay.text = "Play Again?";
						addChild(replay);
					}
				}
				textBox.text = "Score: " + score;
				timeBox.text = "Time: " + time;
				target.adjust();
			}
		}
	}
	
}