package konata.Helper  
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.utils.Dictionary;
	import KO.KSources;
	import konata.G;
	
	public class TextHelper 
	{
		
		private static var modeList:Dictionary;
		public static function CreateTextDic() {
			modeList = new Dictionary();
			modeList["a"] = 00; modeList["k"] = 01; modeList["u"] = 02;
			modeList["b"] = 10; modeList["l"] = 11; modeList["v"] = 12;
			modeList["c"] = 20; modeList["m"] = 21; modeList["w"] = 22;			
			modeList["d"] = 30; modeList["n"] = 31; modeList["x"] = 32;
			modeList["e"] = 40; modeList["o"] = 41; modeList["y"] = 42;			
			modeList["f"] = 50; modeList["p"] = 51; modeList["z"] = 52;
			modeList["g"] = 60; modeList["q"] = 61; modeList["!"] = 62;
			modeList["h"] = 70; modeList["r"] = 71; modeList["?"] = 72;
			modeList["i"] = 80; modeList["s"] = 81; modeList["-"] = 82;
			modeList["j"] = 90; modeList["t"] = 91; modeList["."] = 92;
			//
			modeList["0"] = 03; modeList["4"] = 43; modeList["8"] = 83;
			modeList["1"] = 13; modeList["5"] = 53; modeList["9"] = 93;
			modeList["2"] = 23; modeList["6"] = 63; modeList[" "] = 99;
			modeList["3"] = 33; modeList["7"] = 73;
		}
		
		public static function TextToDraw(str:String = "", bit:int = 1):BitmapData {
			if (str == null || str.length == 0) return new BitmapData(0, 0, false);
			str = str.toLowerCase();
			const index0:int = 6;
			var strList:Array = new Array();
			var char:String;
			
			var i:int;			
			for (i = 0; i < str.length; i++) {
				char = str.substr(i, 1);
				strList.push(char);
			}
			
			var size = bit * 8;
			var matrix:Matrix = new Matrix();
			var data:BitmapData = new BitmapData(str.length * size, size, true, 0);
			for (i = 0; i < strList.length ; i++) {
				char = strList[i];
				var param:int = modeList[char];
				var index1:uint = Math.floor((param % 100) / 10);
				var index2:uint = Math.floor(param % 10);
				
				matrix = new Matrix();
				matrix.a = matrix.d = bit;
				matrix.tx = i * size;
				//trace(index0, index1, index2);
				data.draw(KSources.getBitmap(index0, index1, index2), matrix);
			}
			return data;
		}
		
	}

}