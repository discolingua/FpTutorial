package  
{
	import net.flashpunk.*;
	import net.flashpunk.graphics.*;
	import net.flashpunk.utils.*;

	public class HUD extends Entity
	{
		// reference font by fontFamily, not var name
		
		[Embed(source = "assets/nokiafc22.ttf", embedAsCFF="false", fontFamily = "nokiafc22")] private var font:Class;
		
		// static vars = same variable across all instances, ergo can be accessed from another class
		
		private var scoreText:Text;
		public static var gameOverText1:Text;
		public static var gameOverText2:Text;
		private var display:Graphiclist;
		public static var score:Number = 0;
		public static var gameOver:Boolean = false;
				
		public function HUD() 
		{
			// higher layers rendered first, we want HUD rendered last (on top)
			layer = -100;
			
			// set up textfields
			scoreText = new Text(String(score), 10, 8, 200, 50);
			scoreText.font = "nokiafc22";
			scoreText.color = 0x960028;
			scoreText.size = 32;
			
			gameOverText1 = new Text("", FP.screen.width / 2 - 55, FP.screen.height / 2 - 8, 110, 18);
			gameOverText1.font = "nokiafc22";
			gameOverText1.color = 0x960028;
			gameOverText1.size = 16;
			
			gameOverText2 = new Text("", FP.screen.width / 2 - 138, FP.screen.height / 2 + 8, 276, 18);
			gameOverText2.font = "nokiafc22";
			gameOverText2.color = 0x960028;
			gameOverText2.size = 16;
			
			// to display multiple graphics (e.g. text), use a GraphicList
			
			display = new Graphiclist(scoreText, gameOverText1, gameOverText2);
			
			// set the Graphiclist to the graphic property of an Entity to make it draw
			// all the Images passed to the Graphiclist
			
			graphic = display;
		}
		
		override public function update():void 
		{
			gameOverText1.x = 265 + FP.camera.length;
			gameOverText2.x = 182 + FP.camera.length;
			scoreText.x = 10 + FP.camera.length;
			
			//update score
			scoreText.text = String(score);
			
			//restarts if game over
			if (gameOver && Input.check(Key.ENTER))
			{
				FP.world = new GameRoom;
				gameOverText1.text = "";
				gameOverText2.text = "";
				score = 0;
				gameOver = false;
			}
		}
		
	}

}