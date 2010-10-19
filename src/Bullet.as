package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	
	
	public class Bullet extends Entity
	{
		private var speed:Number = 1000;
		
		
		public function Bullet(_x:Number, _y:Number) 
		{
			x = _x;
			y = _y;
			graphic = Image.createRect(16, 16, 0x6B6B6B);  // rectangle for bullet
			type = "bullet";
		}
		
		override public function update():void
		{
			x += speed * FP.elapsed + 2;   // +2 to track w/camera movement
			if (x > FP.screen.width + FP.camera.length)
			{
				destroy();
			}
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}

}