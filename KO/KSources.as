package KO {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	
	public class KSources extends EventDispatcher {
		public static var Loaded:String = "Loaded";
		private var event:Event;
		
		private static var bitmaps:Array = [];
		private static var sounds:Dictionary = new Dictionary();
		
		private var SourceURL:String;
		
		private static var fileLength:int;
		private static var fileIndex:int;
		private var imagesUrl:Array;
		private var soundsUrl:Array;
		private var soundsCls:Array;
		private var imageIndex:int;
		private var soundIndex:int;
		
		public function KSources() {
			event = new Event(Loaded);
			getSourceURL();
			fileLength = 0;
			imagesUrl = [];
			soundsUrl = [];
			soundsCls = [];
		}
		
		public function addImages(...args):void {
			fileLength = fileLength + args.length;
			for each(var ary:Array in args) {
				imagesUrl.push(ary);
			}
		}
		
		public function addSounds(...args):void {
			fileLength  = fileLength  += args.length;
			for each(var name:String in args) {
				soundsUrl.push(name);
			}
		}
		
		public function addSoundsClass(...args):void {
			for each(var obj:Sound in args) {
				soundsCls.push(obj);
			}
		}
		
		public function Load():void {
			imageIndex = 0;
			soundIndex = 0;
			fileIndex = 0;
			if (imagesUrl.length > 0)
			{
				LoadImage();
			}
			else if (soundsUrl.length > 0) {
				LoadSound();
			}
			else {
				LoadComplete();
			}
		}
		
		private function LoadImage():void {
			var url:String = imagesUrl[imageIndex][0];
			var load:Loader = new Loader();
			load.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, OnProgress);
			load.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, OnError);
			load.contentLoaderInfo.addEventListener(Event.COMPLETE, Complete_Bitmaps);
			load.load(new URLRequest(SourceURL + url));
		}
		
		private function Complete_Bitmaps(e:Event):void {
			var bmp:Bitmap = e.target.content as Bitmap;
			var rect:Rectangle = imagesUrl[imageIndex][1];
			
			var maxW:int = bmp.width / rect.width;
			var maxH:int = bmp.height / rect.height;
			
			var ary:Array = new Array(maxW);
			for (var i:int = 0; i < maxW; i++) {
				ary[i] = new Array(maxH);
				for (var j:int = 0; j < maxH; j++) {
					var data:BitmapData = new BitmapData(rect.width, rect.height, true, 0);
					var matrix:Matrix = new Matrix(1, 0, 0, 1, -i * rect.width, -j * rect.height);
					
					data.draw(bmp, matrix, null, null, rect);
					ary[i][j] = data;
				}
			}
			
			bitmaps.push(ary);
			
			imageIndex = imageIndex + 1;
			fileIndex = fileIndex + 1;
			if (imageIndex < imagesUrl.length) {
				LoadImage();
			}
			else if (soundsUrl.length > 0 ) {
				LoadSound();
			}
			else if (fileIndex == fileLength) {
				LoadComplete();
			}
		}
		
		private function LoadSound():void {
			var url:String = soundsUrl[soundIndex] + ".mp3";
			var sound:Sound = new Sound();
			sound.addEventListener(IOErrorEvent.IO_ERROR, OnError);
			sound.addEventListener(Event.COMPLETE, Complete_Sounds);
			sound.load(new URLRequest(SourceURL + url));
		}
		
		private function Complete_Sounds(e:Event):void {
			var name:String = soundsUrl[soundIndex];
			
			sounds[name] = new KSound(e.target as Sound);
			
			soundIndex += 1;
			fileIndex = fileIndex + 1;
			if (soundIndex < soundsUrl.length) {
				LoadSound();
			}
			else if (fileIndex == fileLength) {
				LoadComplete();
			}
		}
		
		private function LoadComplete():void {
			for each(var obj:Sound in soundsCls) {
				sounds[getQualifiedClassName(obj)] = new KSound(obj);
			}
			this.dispatchEvent(event);
		}
		
		private function OnError(e:IOErrorEvent):void {
			trace(e.text);
		}
		
		private function OnProgress(e:ProgressEvent):void {
			trace("bytesLoaded=" + e.bytesLoaded + " bytesTotal=" + e.bytesTotal);
		}
		
		private function getSourceURL(loader:Loader = null):void {
			loader = (loader == null) ? new Loader() : loader;
			var resURL:String = loader.contentLoaderInfo.loaderURL;
			SourceURL = resURL.substring(0, resURL.lastIndexOf("/") + 1);
		}
		
		public static function getBitmap(p1:int = 0, p2:int = 0, p3:int = 0):BitmapData {
			return bitmaps[p1][p2][p3] as BitmapData;
		}
		
		public static function play(name:String,param1:Number = 1,param2:Number = 0):void {
			var sound:KSound = sounds[name];
			if (sound) {
				sound.play(param1, param2);
			}
		}
		
		public static function FileLength():int {
			return fileLength;
		}
		
		public static function FileIndex():int {
			return fileIndex;
		}
	}
}