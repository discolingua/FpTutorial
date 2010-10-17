package  
{
	import net.flashpunk.*;
	
	public class GameRoom extends World
	{
		public function GameRoom() 
		{
			FP.screen.color = 0xC2C2C2; 
			add(new Ship);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		override public function render():void
		{
			super.render();
		}
		
	}
}