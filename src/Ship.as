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
		
		public function destroy():void 
		{
			// delete the player
			FP.world.remove(this);
		}
	}

}