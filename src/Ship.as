package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;
	
	public class Ship extends Entity
	{
		[Embed(source = "assets/ship.png")] private var spr_ship:Class;
		
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
			if (x < 16)
			{
				x = 16;
			}
			else if (x > FP.screen.width-width - 16)
			{
				x = FP.screen.width-width - 16;
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
				world.add(new Bullet(x+36,y+12));
			}
		}
		
		private function collision():void
		{
			var alien:Alien = collide("alien", x, y) as Alien;
			if (alien)
			{
				alien.destroy();
				destroy();
			}
		}
		
		public function destroy():void 
		{
			// delete the player
			FP.world.remove(this);
		}
	}	
}