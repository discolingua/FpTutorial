package 
{
	import flashpunk.*;
	import net.flashpunk.Engine;
	[SWF(width = "640", height = "480")]
	
	public class Main extends Engine 
	{
			public function Main():void
			{
				super(640, 480, 60, false); // construct the game
				FP.world = new GameRoom;    // load the game
			}
	}
	
}