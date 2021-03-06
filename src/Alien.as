package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
		
	public class Alien extends Entity
	{
		[Embed(source = "assets/ralien1.png")] private var spr_alien:Class;
//		[Embed(source = "assets/explosionalien.mp3")] private var snd_alienDie:Class;
		
		private var speed:Number = 200;
		private var alienDie:Sfx;
		
		// _x and _y are sent by the calling function
		
		public function Alien(_x:Number, _y:Number ):void 
		{
			// initialize alien properties
			x = _x + FP.camera.length;
			y = _y;
			width = 36;
			height = 32;
			graphic = new Image(spr_alien);
			type = "alien";
//			alienDie = new Sfx(snd_alienDie);

		}
		
		override public function update():void
		{
			x -= speed * FP.elapsed + 2;   // +2 to compensate for camera movement
			y += (Math.cos(x / 50) * 50) * FP.elapsed;
			if (x < -40 + FP.camera.length)
			{
				destroy();
			}
			
			// collision detection between bullet and alien
			
			var bullet:Bullet = collide("bullet", x, y) as Bullet;
			if (bullet)
			{
				bullet.destroy();
//				alienDie.play();
				Ship.padLoop.volume = 1;
				GameRoom.particleExplosion(x, y);
				destroy();
				HUD.score++;
			}
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}
}