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
			x += speed * FP.elapsed;
			if (x > FP.screen.width)
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