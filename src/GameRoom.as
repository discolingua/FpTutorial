package  
{
	import net.flashpunk.*;

	public class GameRoom extends World
	{
		private var spawnTimer:Number;
		private var spawnInterval:Number = 2.5;
		
		public function GameRoom() 
		{
			FP.screen.color = 0xC2C2C2; 
			add(new Ship);
			add(new HUD);
			resetSpawnTimer();
		}
		
		override public function update():void 
		{
			spawnTimer -= FP.elapsed;
			if (spawnTimer < 0)
			{
				spawnAlien();
				resetSpawnTimer();
			}
			super.update();
		}
		
		override public function render():void
		{
			super.render();
		}
		
		private function spawnAlien():void 
		{
			var _x:Number = FP.screen.width;
			var _y:Number = Math.random() * (FP.screen.height - 100) + 50;
			
			add(new Alien(_x, _y));
		}
		
		private function resetSpawnTimer():void
		{
			spawnTimer = spawnInterval;
			
			// speed up rate gradually
			spawnInterval *= 0.95;
			
			if (spawnInterval < 0.1)
			{
				spawnInterval = 0.1;
			}
		}
		
	}
}