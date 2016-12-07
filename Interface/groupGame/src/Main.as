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
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequestMethod;
	
	[SWF(backgroundColor="0x00CC00")]
	public class Main extends Sprite 
	{
		private var cam:MovieClip = new MovieClip();
		public var target:Target = new Target(0x0000FF);
		private var playing:Boolean = true;
		private var score:int = 0;
		private var time:int = 5;
		private var timeFrames:int = 45;
		private var xPos:int = 350;
		private var yPos:int = 350;
		private var particles:Array = [];
		private var textBox:TextField = new TextField();
		private var timeBox:TextField = new TextField();
		private var gameOver:TextField = new TextField();
		private var replay:TextField = new TextField();
		private var textStyle:TextFormat = new TextFormat("Arial", 18, 0x000000);
		
		private var hud:HUD = new HUD(textStyle);
		
		private var distractions:Array = new Array();
		private var distractionSize:int = 0;
		
		[Embed(source = "../res/gameBackgroundMusic.mp3")]
		private var music:Class;
		private var bgm:Sound;
		
		[Embed(source="../res/badClick.mp3")]
		private var BadClick:Class;
		private var badClickSound:Sound;
		
		[Embed(source = "../res/goodClick.mp3")]
		private var GoodClick:Class; 		 
		private var goodClickSound:Sound;		     
		
		public function Main() 
		{
			bgm = (new music) as Sound; 			     
			bgm.play(0, 9999);
			
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
			
			badClickSound = (new BadClick) as Sound;
			goodClickSound = (new GoodClick) as Sound; 	
			
			stage.addEventListener(Event.ENTER_FRAME, checkStuff);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mDown);
			cam.setChildIndex(target, cam.numChildren - 1);
		}
		
		public function mDown(e:MouseEvent):void
		{
			if (playing == true)
			{
				var i:int; 
				for (i = 0; i < distractionSize; i++) 
				{
					if ((mouseX < (distractions[i].x + (distractions[i].width / 2))) && (mouseX > (distractions[i].x - (distractions[i].width / 2))) && 
					(mouseY < (distractions[i].y + (distractions[i].height / 2))) && (mouseY > (distractions[i].y - (distractions[i].height / 2))))
					{
						hud.numberHealth -= 10;
						badClickSound.play(0, 1);
					}
				}
				
				if (hud.numberHealth < 0)
				{
					hud.numberHealth = 0;
				}
				
				if ((mouseX < (target.x + (target.width / 2))) && (mouseX > (target.x - (target.width / 2))) && 
					(mouseY < (target.y + (target.height / 2))) && (mouseY > (target.y - (target.height / 2))))
				{
					distractions.push(new Target(0xCC0000));
					distractions[distractionSize].x = (Math.round(Math.random() * 800));
					distractions[distractionSize].y = 100 + (Math.round(Math.random() * 500));
					addChild(distractions[distractionSize]);
					distractionSize += 1;
					
					makeParticles(20, target.x, target.y, target.xSpeed, target.ySpeed, 20, 0, 0x00BBFF, 10, "circle");
					makeParticles(10, target.x, target.y, target.xSpeed / 2, target.ySpeed / 2, 20, 0, 0x00BBFF, 5);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.5, target.ySpeed / 1.5, 20, 0, 0x00BBFF, 5);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.25, target.ySpeed / 1.25, 20, 0, 0x00BBFF, 5);
					makeParticles(20, target.x, target.y, target.xSpeed, target.ySpeed, 5, 0, 0x0000FF, 20, "circle");
					makeParticles(10, target.x, target.y, target.xSpeed / 2, target.ySpeed / 2, 20, 0, 0x0000FF, 2);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.5, target.ySpeed / 1.5, 20, 0, 0x0000FF, 2);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.25, target.ySpeed / 1.25, 20, 0, 0x0000FF, 2);
					makeParticles(20, target.x, target.y, target.xSpeed, target.ySpeed, 20, 0, 0x00BBFF, 2, "circle");
					makeParticles(10, target.x, target.y, target.xSpeed / 2, target.ySpeed / 2, 20, 0, 0x00BBFF, 1);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.5, target.ySpeed / 1.5, 20, 0, 0x00BBFF, 1);
					makeParticles(10, target.x, target.y, target.xSpeed / 1.25, target.ySpeed / 1.25, 20, 0, 0x00BBFF, 1);
						
					goodClickSound.play(0, 1);
					score += 10;
					time = 5;
					timeFrames = 45;
					target.x = (Math.round(Math.random() * 800));
					target.y = 100 + (Math.round(Math.random() * 500));
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
					
					hud.numberHealth += 25;
					if (hud.numberHealth > 100)
					{
						hud.numberHealth = 100;
					}
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
				hud.numberHealth = 100;
				removeChild(gameOver);
				removeChild(replay);
			}
			
			hud.hp.scaleX = hud.numberHealth / 100;
		}
		
		public function makeParticles(num:int,xPos:int, yPos:int, xSpeed:int, ySpeed:int, variance:int, grav:int, color:int, size:int, shape:String = "rect", time:int = 10):void
		{
			for (var v:int = 0; v < num; v++)
			{
				var part:Particle = new Particle(Math.round(Math.random()) * size + 5,grav, color, shape, time);
				part.x = xPos;
				part.y = yPos;
				part.xSpeed = xSpeed + Math.random() * variance - variance / 2;
				part.ySpeed = ySpeed + Math.random() * variance - variance / 2;
				part.rSpeed = Math.random() * 10 + 20;
				cam.addChild(part);
				particles.push(part);
			}
		}
		
		public function checkStuff(e:Event):void
		{
			for (var p:int = particles.length - 1; p >= 0; p--)
			{
				particles[p].update();
				if (particles[p].timer == 20)
				{
					cam.removeChild(particles[p]);
					particles.splice(p, 1);
				}
			}
			
			if (playing == true)
			{
				timeFrames -= 1;
				if (timeFrames < 1)
				{
					timeFrames = 45;
					time -= 1;
					if (time < 0)
					{
						var i:int; 
						for (i = 0; i < distractionSize; i++) 
						{ 
							 removeChild(distractions[0]);
							 distractions.splice(0,1);
						}
						distractionSize = 0;
						
						time = 0;
						playing = false;
						
						gameOver.x = 330;
						gameOver.y = 270;
						gameOver.defaultTextFormat = textStyle;
						gameOver.text = "Game Over";
						addChild(gameOver);
						
						var loader:URLLoader = new URLLoader();
						var request:URLRequest = new URLRequest('gamepage.php');
						var variables:URLVariables = new URLVariables();
						variables.score = score;
						
						request.data = variables;
						request.method = URLRequestMethod.POST;
						
						loader.load(request);
						
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
				
				var index:int; 
				for (index = 0; index < distractionSize; index++) 
				{ 
					 distractions[index].adjust();
				}
				
				if (hud.numberHealth <= 0)
				{
					var tempI:int; 
					for (tempI = 0; tempI < distractionSize; tempI++) 
					{ 
						 removeChild(distractions[0]);
						 distractions.splice(0,1);
					}
					distractionSize = 0;
					
					hud.numberHealth = 0;
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
		}
	}
	
}