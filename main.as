package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KAnimMap;
	import KO.KEngine;
	import KO.KEntity;
	import KO.KSources;
	import KO.KTweener;
	import konata.Game;
	
	public class main extends KEngine{
		
		public function main() {
			
			super(800, 480, 30, 0xff000000);
			
			init();
		}
		
		public function init():void {
			var sources:KSources = new KSources();
			sources.addImages(
			//["000mono16.png", new Rectangle(0, 0, 16, 16)],
			//["001mono32.png", new Rectangle(0, 0, 32, 32)],
			//["002text8.png", new Rectangle(0, 0, 8, 8)],
			//["003panel32.png", new Rectangle(0, 0, 32, 32)],
			["000panel32.png", new Rectangle(0, 0, 32, 32)],
			["001mono64.png", new Rectangle(0, 0, 64, 64)],
			["002map800384.png", new Rectangle(0, 0, 800, 384)],
			["003panel32.png", new Rectangle(0, 0, 32, 32)],
			["004mono32.png", new Rectangle(0, 0, 32, 32)],
			["005mono64.png", new Rectangle(0, 0, 64, 64)],
			["006text8.png", new Rectangle(0, 0, 8, 8)],
			["007main324148.png", new Rectangle(0, 0, 324, 148)],
			["008map800480.png", new Rectangle(0, 0, 800, 480)],
			["009menu400240.png", new Rectangle(0, 0, 400, 240)],
			["010menu7257.png", new Rectangle(0, 0, 72, 57)],
			["011button11640.png", new Rectangle(0, 0, 116, 40)],
			["012menu256208.png", new Rectangle(0, 0, 256, 208)],
			["013text2028.png", new Rectangle(0, 0, 20, 28)],
			["014mono64.png", new Rectangle(0, 0, 64, 64)]);
			
			//sources.addSounds("clear","levelup");
			
			sources.addEventListener(KSources.Loaded, OnLoaded);
			sources.Load();
		}
		
		private function OnLoaded(e:Event):void {
			Game.T = new Game();
			Game.T.InGameOP1();
			//var cla1:class1 = new class1();
			//K.game.add(cla1,"enti");
		}
	}
}