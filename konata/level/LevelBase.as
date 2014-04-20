package konata.level 
{
	import KO.K;
	import konata.config.CGame;
	import konata.G;
	import konata.mapTool.TableA;
	import konata.pig.PigB;
	import konata.pig.PigC;
	import konata.pig.PigD;
	import konata.pig.PigE;
	import konata.pig.PigF;
	import konata.pig.PigFA;
	
	public class LevelBase
	{
		// [0,0]	空
		// [0,90]	金币
		// [1,0~10] 带分,砖
		// [1,11~13] 能力,砖
		// [1,50~60] 可一直向上顶,砖
		// [2,0~10]	木板
		// [3,0~10] 带分,石砖
		// [3,11~13] 能力,石砖
		
		public var W:int;
		public var H:int;
		public var px:int = K.W * 0.5;
		public var py:int = CGame.CH - 10 * G.Size;
		public var cameraX:Number = -2;
		public var cameraY:Number = -2;
		public var grid:Array;
		
		public var map:Array;
		
		public function LevelBase()
		{
			//InitGrid();
			
			//K.game.add(new PigE(5, 4), G.LayerPig);
			//K.game.add(new PigB(5, 4));
			//K.game.add(new PigC(4, 4, [3, 0]));
			//K.game.add(new PigD(6, 6, [0]), G.LayerPig);
			//K.game.add(new PigD(5, 4, [1]));
			//K.game.add(new PigD(5, 4, [1]));
			//K.game.add(new PigD(4, 2, [2]));
			//K.game.add(new PigD(6, 2, [3]));
			//
			//K.game.add(new PigF(8, 0, [0]), G.LayerPig);
			//
			//K.game.add(new PigF(9, 0, [2]), G.LayerPig);
			//
			//grid[7][4] = [3, 1];
			//grid[5][4] = [3, 23];
			//grid[5][3] = [3, 20];
			//grid[5][2] = [3, 20];
			//grid[5][1] = [3, 24];
			//
			//grid[W - 12][2] = [1, 99];
			//grid[20][3] = [1, 99];
			
			trace(CGame.lvNum);
		}
		public function InitGrid():void {
			grid = new Array(W);
			var i:int,j;
			for (i = 0; i < W; i++ ) {
				grid[i] = new Array(H);
				for (j = 0; j < H; j++ ) {
					grid[i][j] = [0, 0];
				}
			}
			//
			var item:Array;
			var itemB:Array;
			for (i = 0; i < map.length; i++ ) {
				item = map[i];
				itemB = [];
				for (j = 2; j < item.length; j++ ) {
					itemB.push(item[j]);
				}
				grid[item[0]][item[1]] = itemB;
			}
			
			InitRender();
		}
		
		private function InitRender():void {
			var i:int, j:int;
			var item:Array;
			var a:Boolean, b, c, d;
			for (i = 0; i < W; i++ ) {
				for (j = 0; j < H; j++ ) {
					item = grid[i][j];
					if (item[0] == 3 && (item[1] == 50 || item[1] == 60)) {
						
						a = (i - 1 <  0) || (grid[i - 1][j][0] == 3 && grid[i - 1][j][1] >= 50 && grid[i - 1][j][1] < 80);
						b = (i + 1 >= W) || (grid[i + 1][j][0] == 3 && grid[i + 1][j][1] >= 50 && grid[i + 1][j][1] < 80);
						c = (j - 1 >= 0 && (grid[i][j - 1][0] == 3 && grid[i][j - 1][1] >= 50 && grid[i][j - 1][1] < 80));
						d = (j + 1 >= H) || (grid[i][j + 1][0] == 3 && grid[i][j + 1][1] >= 50 && grid[i][j + 1][1] < 80);
						if 		(a == false && b == true && c == false && d == true) grid[i][j][1] = item[1] + 1;
						else if (a == true  && b == true && c == false && d == true) grid[i][j][1] = item[1] + 2;
						else if (a == true  && b == false&& c == false && d == true) grid[i][j][1] = item[1] + 3;
						else if (a == false && b == true && c == true  && d == true) grid[i][j][1] = item[1] + 4;
						else if (a == true  && b == true && c == true  && d == true) grid[i][j][1] = item[1] + 5;
						else if (a == true  && b == false&& c == true  && d == true) grid[i][j][1] = item[1] + 6;
						else if (a == false && b == true && c == true  && d == false)grid[i][j][1] = item[1] + 7;
						else if (a == true  && b == true && c == true  && d == false)grid[i][j][1] = item[1] + 8;
						else if (a == true  && b == false&& c == true  && d == false)grid[i][j][1] = item[1] + 9;
					}
				}
			}
		}
	}
}

























