package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
		
	public class Alien extends Entity
	{
		[Embed(source="assets/alien.png")] private var spr_alien:Class
		
		private var speed:Number = 200;
		
		// _x and _y are sent by the calling function
		
		public function Alien(_x:Number, _y:Number ):void 
		{
			// initialize alien properties
			x = _x;
			y = _y;
			width = 36;
			height = 32;
			graphic = new Image(spr_alien);
			type = "alien";
		}
		
	}

}