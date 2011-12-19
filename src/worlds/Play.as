package worlds 
{
	import actors.Explosion;
	import actors.Player;
	import actors.Robot;
	import actors.ui.buttons.BtnPlay;
	import actors.ui.FloatingText;
	import actors.ui.LostObj;
	import actors.ui.Stats;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Konstantinos Egarhos
	 */
	public class Play extends World 
	{
		private var moves:Array;
		private var move:String;
		private var robots:Array;	
		private var player:Player;
		private var stats:Stats;
		private var sndLostLife:Sfx;
		private var difficultyTimer:Number;
		private var scoreToAdd:int;
		
		// ACHIEVEMENTS
		private var continuousCombo:uint; private const continuousComboNumber:uint = 15; //TODO: CHANGE IT TO 15
		private var fastReflexes:Number; private const fastReflexesTime:Number = 0.35; //TODO: CHANGE IT TO 0.35
		
		public function Play() 
		{
			super();
			
			moves = new Array(GlobalVariables.NONE, GlobalVariables.UP,
			GlobalVariables.DOWN, GlobalVariables.RIGHT, GlobalVariables.LEFT,
			GlobalVariables.UPRIGHT, GlobalVariables.UPLEFT, 
			GlobalVariables.DOWNRIGHT, GlobalVariables.DOWNLEFT);
			
			robots = new Array();
			player = new Player(300, 300);
			GlobalVariables.score = 0;
			stats = new Stats();
			stats.livesS = player.livesG;
			stats.fillGraphiclist();
			
			sndLostLife = new Sfx(GlobalVariables.sndLOST);
			
			resetCombo();
		}
		
		override public function begin():void 
		{
			super.begin();
			
			difficultyTimer = 2;
			scoreToAdd = 1;
			
			addGraphic(new Image(GlobalVariables.ROOM01), 0, 0, 0);
			
			robots.push(new Robot(145, 146, FP.rand(0xffffff)), new Robot(358, 478, FP.rand(0xffffff)),
			new Robot(467, 318, FP.rand(0xffffff)), new Robot(128, 465, FP.rand(0xffffff)),
			new Robot(431, 106, FP.rand(0xffffff)), new Robot(114, 284, FP.rand(0xffffff)),
			new Robot(276, 144, FP.rand(0xffffff)), new Robot(495, 506, FP.rand(0xffffff)));
			
			for (var i:uint = 0; i < robots.length; i++)
			{
				add(robots[i]);
			}
			
			add(player);
			
			add(stats);
			
			GlobalVariables.state = GlobalVariables.PLAYING;
			
			move = GlobalVariables.NONE;
			FP.alarm(2, newMove);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (player.mimicedG && GlobalVariables.state == GlobalVariables.PLAYING)
			{
				stats.add(scoreToAdd); // Adds to score
				if (fastReflexes < fastReflexesTime)
				{
					FloatingText(create(FloatingText)).reset(FP.halfWidth, FP.halfHeight, "fast reflexes", 0x00ff00, 1);
					Explosion(create(Explosion)).reset(FP.halfWidth, 250, 0, 0x00ff00);
					if (fastReflexes < fastReflexesTime)
					{
						fastReflexes = 1;
						GlobalVariables.score += 1000;
					}
				}
			}else
			{
				fastReflexes += FP.elapsed;
			}
			
			if (Input.check("MUTE"))
			{
				SoundSystem.reverseMute();
			}
		}
		
		public function newMove():void 
		{
			if (GlobalVariables.state != GlobalVariables.MAINMENU && GlobalVariables.state != GlobalVariables.LOST)
			{
				if (!player.mimicedG && move != GlobalVariables.NONE)
				{
					player.livesS = player.livesG - 1;
					SoundSystem.play(sndLostLife);
					if (player.livesG <= 0)
					{
						add(new LostObj);
						GlobalVariables.state = GlobalVariables.LOST;
						if (Kongregate.getUsername != "Guest")
						{
							Kongregate.submit("HighestScores", GlobalVariables.score);
						}
					}
					stats.livesS = player.livesG;
					stats.fillGraphiclist();
					makeEasier();
				}else
				{
					makeHarder();
					if (continuousCombo > continuousComboNumber)  // CONTINUOUS COMBO ACHIEVEMENT.
					{
						FloatingText(create(FloatingText)).reset(FP.halfWidth, FP.halfHeight, continuousComboNumber + " consecutive", 0xff0000, 1);
						continuousCombo = 0;
						GlobalVariables.score += 1000;
						FP.console.log("ACHIEVEMENT");
						Explosion(create(Explosion)).reset(500, FP.halfHeight, 0, 0xff0000);
						Explosion(create(Explosion)).reset(100, FP.halfHeight, 0, 0xff0000);
					}
				}
				var moveT:String;
				moveT = moves[FP.rand(moves.length -1)];
				while (move == moveT) 
				{
					moveT = moves[FP.rand(moves.length -1)];
				}
				move = moveT;
				//FP.console.log(move);
				
				for (var i:uint = 0; i < robots.length; i++)
				{
					Robot(robots[i]).move(move);
				}
				player.toStateS = move;
				
				fastReflexes = 0;
				FP.alarm(difficultyTimer, newMove);
			}
		}
		
		public function makeHarder():void 
		{
			difficultyTimer -= 0.05;
			scoreToAdd += 1;
			if (move != GlobalVariables.NONE)
			{
				continuousCombo += 1;
			}
			FP.console.log(difficultyTimer);
		}
		
		public function makeEasier():void 
		{
			FloatingText(create(FloatingText)).reset(FP.halfWidth, FP.halfHeight, "careful", 0x87cefa, 0.8);
			difficultyTimer += 0.5;
			scoreToAdd -= 10;
			if (scoreToAdd <= 2 || scoreToAdd >= 10000)
			{
				scoreToAdd = 2;
			}
			continuousCombo = 0;
		}
		
		public function resetCombo():void 
		{
			continuousCombo = 0;
		}
		
	}

}