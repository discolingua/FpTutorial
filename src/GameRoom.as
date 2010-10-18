package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import flash.geom.Point;
		
	public class GameRoom extends World
	{
		[Embed(source = "assets/explosion.png")] private var spr_explosion:Class;
		
		private var spawnTimer:Number;
		private var spawnInterval:Number = 2.5;
		private static var explode:Emitter;
//		private var explosion:Image;
		
		public function GameRoom() 
		{
			explode = new Emitter(spr_explosion, 2, 2);
			explode.newType("explosion", [0]);
			explode.setMotion("explosion", 0, 50, 0.1, 360, 50, 0.9);
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
			explode.update();
			super.update();
		}
		
		override public function render():void
		{
			explode.render(new Point, FP.camera);
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
		
		public static function particleExplosion(_x:Number, _y:Number):void 
		{
			for (var i:int = 0; i < 11; i++)
			{
				explode.emit("explosion", _x, _y);
			}
		}
		
	}
}