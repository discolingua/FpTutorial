package 
{
	import net.flashpunk.*;
	[SWF(width = "800", height = "600")]
	
	public class Main extends Engine 
	{
			public function Main():void
			{
				super(800, 600, 60, false); // construct the game
				FP.world = new GameRoom;    // load the game
			}
	}
}