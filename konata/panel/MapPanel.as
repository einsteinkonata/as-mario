package konata.panel 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import konata.config.CGame;
	import konata.G;
	import konata.mapItem.Goal;
	import konata.mapItem.ItemBase;
	import konata.mapItem.ItemCard;
	import konata.mapTool.TableA;
	import konata.mapTool.TableC;
	import konata.mapTool.TableD;
	import konata.pig.PigA;
	import konata.pig.PigB;
	import konata.pig.PigBase;
	import konata.pig.PigC;
	import konata.pig.PigD;
	import konata.pig.PigE;
	import konata.pig.PigF;
	import konata.pig.PigFA;
	import konata.pig.PigFC;
	import konata.pig.PigG;
	import konata.pig.PigH;
	import konata.pig.PigI;
	import konata.pig.PigJ;
	
	public class MapPanel extends KEntity 
	{
		public var Quality:Number = 0.8;
		
		public var rect:Rectangle;
		public var rect2:Rectangle;
		public var bit:Bitmap;
		public var mapbit:BitmapData;
		
		public function MapPanel() 
		{
			this.bitmapW = K.W;
			this.bitmapH = K.H;
			draw(0x00cc00);
			
			mapbit = this.renderData.clone();
			bit = new Bitmap(this.mapbit);
			
			var fi:uint = 2;
			bit.filters = [new GlowFilter(0x000000, 1, 2 * fi, 2 * fi, 10 * fi, 1, false, false)];
			
			rect = new Rectangle(0, 0, K.W, K.H);
			
			InitMap();
		}
		
		public var cm:Matrix = new Matrix();
		
		public function drawUpdate():void {
			this.renderData.fillRect(rect, 0);
			this.mapbit.fillRect(rect, 0);
			
			var x1:int, x2:int, y1:int, y2:int;
			var mapW:int = CGame.map.length, mapH:int = CGame.map[0].length;
			var x3:Number = K.Camera.x % G.Size, y3:Number = K.Camera.y % G.Size;
			var trackX:int, trackY;
			var e:Array;
			x1 = Math.floor(K.Camera.x / G.Size);
			x1 = x1 < 0 ? 0 : x1;
			x2 = x1 + mapW + 1;
			y1 = Math.floor(K.Camera.y / G.Size);
			y1 = y1 < 0 ? 0 : y1;
			y2 = y1 + mapH + 1;
			x2 = x2 > mapW ? mapW : x2;
			y2 = y2 > mapH ? mapH : y2;
			
			for (var i:int = x1; i < x2; i++) {
				for (var j:int = y1; j < y2; j++) {
					e = CGame.map[i][j];
					if (e[0] == 0) continue;
					cm.tx = i * G.Size - K.Camera.x;
					cm.ty = j * G.Size - K.Camera.y;
					
					if (e[0] == 1) {	// 砖头
						//this.renderData.draw(KSources.getBitmap(0, 9, 0), cm, null, BlendMode.NORMAL);
						this.renderData.draw(KSources.getBitmap(3, 0, 0), cm, null, BlendMode.NORMAL);
					}
					else if (e[0] == 2) {	// 平台
						if (e[1] == 0) {
							this.renderData.draw(KSources.getBitmap(3,0,2), cm, null, BlendMode.NORMAL);
						}
						else if (e[1] == 4) {
							trackX = Math.floor(CGame.pig4);
							trackY = 1;
							this.renderData.draw(KSources.getBitmap(4, trackX, trackY), cm, null, BlendMode.NORMAL);
						}
					}
					else if (e[0] == 3) {	// 岩石
						if (e[1] == 1 || e[1] == 0) {	// 石头
							this.renderData.draw(KSources.getBitmap(3, 0, 4), cm, null, BlendMode.NORMAL);
						}
						else if (e[1] == 2) {	// 针剌
							this.renderData.draw(KSources.getBitmap(4, 8, 2), cm, null, BlendMode.NORMAL);
						}
						//3 为空方块
						else if (e[1] >= 10 && e[1] < 20) {	// 道具
							this.renderData.draw(KSources.getBitmap(3,2,4), cm, null, BlendMode.NORMAL);
						}
						else if (e[1] == 20) {	// 轨道
							this.renderData.draw(KSources.getBitmap(3, 4, 4), cm, null, BlendMode.NORMAL);
							//this.renderData.draw(KSources.getBitmap(4, CGame.anim6, 9), cm, null, BlendMode.NORMAL);
						}
						else if (e[1] >= 20 && e[1] < 25) {	// 轨道
							trackX = 5 + e[1] - 20;
							trackY = 5;
							this.renderData.draw(KSources.getBitmap(4, trackX, trackY), cm, null, BlendMode.NORMAL);
						}
						else if (e[1] >= 50 && e[1] < 80) {
							trackX = e[1] % 10 - 1;
							trackX = trackX < 0 ? 9 : trackX;
							trackY = Math.floor(e[1] * 0.1) + 1;
							mapbit.draw(KSources.getBitmap(3, trackX, trackY), cm, null, BlendMode.NORMAL);
						}
					}
					else if (e[0] == 4) {
						if (e[1] == 0 && CGame.pig4 < 4) {	// 针剌   
							trackX = Math.floor(CGame.pig4);
							trackY = 0;
							this.renderData.draw(KSources.getBitmap(4, trackX, trackY), cm, null, BlendMode.NORMAL);
						}
					}
				}
			}
			mapbit.draw(this.bit);
			this.renderData.draw(mapbit);
		}
		// 动态刷入
		private var cx:int = 0;
		private var cy:int = 0;
		private function pigUpdate():void
		{
			var cx2:int = Math.floor(K.Camera.x / G.Size);
			var cy2:int = Math.floor(K.Camera.y / G.Size);
			cx2 = cx2 < 0 ? 0 : cx2;
			cy2 = cy2 < 0 ? 0 : cy2;
			var count:int;
			var i:int;
			var item:Array;
			
			var tcx:int = (cx2 > cx)
				? cx2 + G.roomX / G.Size - 5
				: cx2 -1;			
			if (cx != cx2) {				
				if (tcx >= 0 && tcx < CGame.map.length) {
					count = cy2 + CGame.lv.H + 1 <= CGame.map[0].length
						? cy2 + CGame.lv.H + 1 : CGame.map[0].length;					
					i = cy2 - 1 >= 0 ? cy2 - 1 : 0;
					for (i = i; i < count; i++) {
						item = CGame.map[tcx][i];
						pigUpdateHelper(item, tcx, i);
					}
				}
				cx = cx2;
			}
			
			var tcy:int = (cy2 > cy)
				? cy2 + G.roomY / G.Size - 5
				: cy2 -1;
			if (cy != cy2) {
				if (tcy >= 0 && tcy < CGame.map[0].length) {					
					count = cx2 + CGame.lv.W + 1 <= CGame.map.length
						? cx2 + CGame.lv.W + 1 : CGame.map.length;
					i = cx2 - 1 >= 0 ? cx2 - 1 : 0;
					for (i = i; i < count; i++) {
						item = CGame.map[i][tcy];
						pigUpdateHelper(item, i, tcy);
					}
				}
				cy = cy2;
			}
		}
		
		private function InitMap():void 
		{
			var cx2:int = Math.floor(K.Camera.x / G.Size);
			var cy2:int = Math.floor(K.Camera.y / G.Size);
			cx2 = cx2 < 0 ? 0 : cx2;
			cy2 = cy2 < 0 ? 0 : cy2;
			var cw:int, ch:int;
			cw = cx2 + K.W / G.Size <= CGame.map.length 
				? cx2 + K.W / G.Size : CGame.map.length;
			ch = cy2 + K.H / G.Size <= CGame.map[0].length 
				? cy2 + K.H / G.Size : CGame.map[0].length;
			
			var item:Array;
			var i:int, j:int;
			for (i = cx2; i < cw; i++ ) {
				for (j = cy2; j < ch; j++ ) {
					item = CGame.map[i][j];
					pigUpdateHelper(item, i, j);
				}
			}
		}
		
		private function pigUpdateHelper(item:Array, tcx:int, i:int):void {
			var params:Array;
			if (item[0] == 0 && item[1] > 0) {
				var pig:PigBase;
				if (item[1] == 1) {
					params = item.slice(2, item.length);
					pig = new PigA(tcx, i, params);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 2) {
					pig = new PigB(tcx, i)
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 3) {
					params = item.slice(2, item.length);
					K.game.add(new PigC(tcx, i, params), G.LayerPig);
				}
				else if (item[1] == 4) {
					params = item.slice(2, item.length);
					var pigd:PigD = new PigD(tcx, i, params);
					pigd.setMap(tcx, i, item);
					K.game.add(pigd);
				}
				else if (item[1] == 5) {
					params = item.slice(2, item.length);
					pig = new PigE(tcx, i, params);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 6) {
					params = item.slice(2, item.length);
					var pigf:PigF = new PigF(tcx, i, params);
					pigf.setMap(tcx, i, item);
					K.game.add(pigf, G.LayerPig);
				}
				else if (item[1] == 7) {
					params = item.slice(2, item.length);
					pig = new PigFA(tcx * G.Size, i * G.Size, params);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 8) {
					pig = new PigG(tcx , i);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 9) {
					pig = new PigH(tcx , i);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 10) {
					pig = new PigI(tcx , i);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 11) {
					params = item.slice(2, item.length);
					pig = new PigJ(tcx , i);
					pig.setMap(tcx, i, item);
					K.game.add(pig, G.LayerPig);
				}
				else if (item[1] == 90) {
					var itembase:ItemBase = new ItemCard(tcx, i);
					itembase.setMap(tcx, i, item);
					K.game.add(itembase, G.LayerItem);
				}
				else if (item[1] == 99) {
					K.game.add(new Goal(tcx, i), G.LayerItem);
				}
			}
			else if (item[0] == 1) {
				
			}
			// 2
			else if (item[0] == 2) {
				if (item[1] == 1) {
					params = item.slice(2, item.length);
					var tableA:TableA = new TableA(tcx, i, params);
					tableA.setMap(tcx, i, item);
					K.game.add(tableA, G.LayerMap);
				}
				else if (item[1] == 2) {
					var tableC:TableC = new TableC(tcx, i);
					tableC.setMap(tcx, i, item);
					K.game.add(tableC, G.LayerMap);
				}
				else if (item[1] == 3) {
					var tableD:TableD = new TableD(tcx, i);
					tableD.setMap(tcx, i, item);
					K.game.add(tableD, G.LayerMap); 
				}
			}
			// 3
			else if (item[0] == 3) {
				
			}
		}
		
		override public function update():void {
			drawUpdate();
			pigUpdate();
			this.x = K.Camera.x;
			this.y = K.Camera.y;
		}
	}
}