package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
	
	public class Ship extends Entity
	{
		[Embed(source = "assets/ship.png")] private var spr_ship:Class;
		[Embed(source = "assets/explosionShip.mp3")] private var snd_shipDie:Class;
		[Embed(source = "assets/Bullet.mp3")] private var snd_bulletShoot:Class;
		
		private var shipDie:Sfx;
		private var bulletShoot:Sfx;
		
		private var speed:Number = 250;
		
		public function Ship():void 
		{
			// initiate the properties of the object
			graphic = new Image(spr_ship);
			x = 50;
			y = 50;
			width = 40;
			height = 16;
			type = "ship";
			
			shipDie = new Sfx(snd_shipDie);
			bulletShoot = new Sfx(snd_bulletShoot);
		}

		override public function update():void 
		{
			move();
			constrain();
			shoot();
			collision();
		}
		
		private function move():void
		{
			// move the player
			
			x += 2; // track with camera
			
			if (Input.check(Key.RIGHT))
			{
				x += speed * FP.elapsed;
			}
			else if (Input.check(Key.LEFT))
			{
				x -= speed * FP.elapsed;
			}
			else if (Input.check(Key.UP))
			{
				y -= speed * FP.elapsed;
			}
			else if (Input.check(Key.DOWN))
			{
				y += speed * FP.elapsed;
			}
		}
		
		private function constrain():void
		{
			// keep player from moving offscreen
			if (x < 16 + FP.camera.length)
			{
				x = 16 + FP.camera.length;
			}
			else if (x > FP.screen.width- width - 16 + FP.camera.length)
			{
				x = FP.screen.width-width - 16 + FP.camera.length;
			}
			else if (y < 0)
			{
				y = 0;
			}
			else if (y > FP.screen.height - height - 16)
			{
				y = FP.screen.height - height - 16;
			}
		}
		
		private function shoot():void
		{
			if (Input.pressed(Key.Z))
			{
				world.add(new Bullet(x + 36, y + 12));
				bulletShoot.play();
			}
		}
		
		private function collision():void
		{
			var alien:Alien = collide("alien", x, y) as Alien;
			if (alien)
			{
				shipDie.play();
				GameRoom.particleExplosion(x, y);
				alien.destroy();
				destroy();
				HUD.gameOverText1.text = "GAME OVER";
				HUD.gameOverText2.text = "PRESS ENTER TO PLAY AGAIN";
				HUD.gameOver = true;
			}
		}
		
		public function destroy():void 
		{
			// delete the player
			FP.world.remove(this);
		}
	}	
}