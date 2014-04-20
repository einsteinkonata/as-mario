package konata 
{
	import flash.geom.Matrix;
	import KO.K;
	import konata.button.BPlayGame;
	import konata.button.BReturnOP;
	import konata.button.BStart;
	import konata.button.BStartCompleted;
	import konata.button.BStartLock;
	import konata.button.KOverReset;
	import konata.button.KOverReturnOP;
	import konata.config.CData;
	import konata.config.CGame;
	import konata.Helper.TextHelper;
	import konata.mapTool.TableC;
	import konata.mono.Player;
	import konata.panel.CameraUpdate;
	import konata.panel.Controller;
	import konata.panel.GameBackground;
	import konata.panel.GameMenu;
	import konata.panel.GameOP;
	import konata.panel.GameOver;
	import konata.panel.GameOverPoint;
	import konata.panel.GamePoint;
	import konata.panel.GameStart;
	import konata.panel.MapPanel;
	import konata.panel.MapUpdate;
	import konata.particle.BlackCloth;
	import konata.pig.PigA;
	import konata.pig.PigG;
	import konata.pig.PigH;
	import konata.pig.PigI;
	import konata.pig.PigJ;
	
	public class Game
	{
		public static var T:Game;
		
		public function Game()
		{
			CData.Create();
			TextHelper.CreateTextDic();
			
			K.game.addLayer(G.LayerItem);						
			K.game.addLayer(G.LayerMap);
			K.game.addLayer(G.LayerPig);
			K.game.addLayer(G.LayerPlayer);
		}
		
		public function InGameOP(bool:Boolean = false):void
		{
			K.game.add1(new GameOP());
			K.game.add1(new BPlayGame());
			if (bool == true) {
				K.game.add1(new BlackCloth(1), K.LayerMain);
			}
		}
		
		public function InGameMenu():void {
			K.Camera.x = K.Camera.y = 0;
			K.game.add1(new GameMenu());
			K.game.add1(new BReturnOP());
			const num:int = 6;
			var isLv:Array;
			var lvNum:String = "1-1";
			for (var i:int = 0; i < 24; i++ ) {
				var _x:Number = i % num * (64 * 2) + 12 * 2;
				var _y:Number = Math.floor(i / num) * 49 * 2 + 40 * 2;
				var ix:int = i % 6;
				var iy:int = Math.floor(i / 6);
				lvNum = (iy + 1) + "-" + (ix + 1);
				isLv = CData.DataLevel[iy];
				
				if (isLv[ix] == 0) {
					if ((i == 0) 
						|| (ix - 1 >= 0 && isLv[ix - 1] > 0)
						|| (ix == 0 && iy - 1 >= 0 && CData.DataLevel[iy - 1][3] > 0)) {
						K.game.add1(new BStart(_x, _y, lvNum));
					}else {
						K.game.add1(new BStartLock(_x, _y));
					}
				}else {
					K.game.add1(new BStartCompleted(_x, _y, lvNum));
				}
			}
			
			K.game.add1(new BlackCloth(1), K.LayerMain);
		}
		
		public function InGameStart():void {
			// 主角所有状态
			// 地图
			// 开始渲染
			test();
			
			K.game.add1(new BlackCloth(1), K.LayerMain);
			//K.game.add(new GameStart());
		}
		
		public function InGameOver():void {
			//K.game.removeAll();
			//K.Camera.x = K.Camera.y = 0;
			K.game.add1(new GameOverPoint());
			K.game.add1(new KOverReturnOP());
			K.game.add1(new KOverReset());
		}
		
		private function test():void
		{
			CGame.Create();
			
			K.game.add1(new Controller());
			K.game.add1(new GameBackground(), K.Layer0);
			K.game.add1(new MapUpdate());
			K.game.add(new Player(), G.LayerPlayer);			
			K.game.add(new MapPanel(), G.LayerMap);
			
			K.game.add(new GamePoint());
			K.game.add(new CameraUpdate());
			
			
			CGame.player.state = 4;
			
			//K.game.add(new PigG(1, 2), G.LayerPig);
			//K.game.add(new PigG(21, 0), G.LayerPig);
			//K.game.add(new PigG(22, 0), G.LayerPig);
			//K.game.add(new PigG(23, 0), G.LayerPig);
			//
			//K.game.add(new PigH(18, 0), G.LayerPig);
			//
			//K.game.add(new PigI(25, 0), G.LayerPig);
			//
			//K.game.add(new TableC(15, 2), G.LayerMap);
			//K.game.add(new PigJ(12, 2), G.LayerMap);
		}
	}
}
















