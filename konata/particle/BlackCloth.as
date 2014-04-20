package konata.particle  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.BlendMode;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KEntity;
	
	public class BlackCloth extends KEntity
	{
		private var blackA:BitmapData;
		private var ary:Array;
		//
		private var time:Number = 0;
		private var timeMax:Number = 0;
		//
		private var style:int = 0;
		public var isOver:Boolean = false;
		
		public function BlackCloth(style:int = 0,timeMax:Number = 0.5)
		{
			this.style = style;
			this.timeMax = timeMax;
			
			this.bitmapW = K.W;
			this.bitmapH = K.H;
			draw(0x000000, 1);
			blackA = this.renderData.clone();
			
			ary = [[ -this.bitmapW, 0, this.bitmapW / 2, 0]
				,[ this.bitmapW, 0, -this.bitmapW / 2, 0]
				,[ 0, -this.bitmapH, 0, this.bitmapH / 2]
				,[ 0, this.bitmapH, 0, -this.bitmapH / 2]];
		}
		
		override public function update():void
		{
			K.engine.paused = true;
			this.mx = K.Camera.x;
			this.my = K.Camera.y;
			
			this.renderData.fillRect(new Rectangle(0, 0, this.bitmapW, this.bitmapH), 0);
			
			time += K.elapsed;
			
			if(style == 0){
				drawA();
			}else{
				drawB();
			}
			
			if (time >= timeMax) {
				K.engine.paused = false;
				isOver = true;
			}
		}
		override public function removed():void 
		{
			K.engine.paused = false;
		}
		
		private function drawA():void
		{
			var num2:Number = time / timeMax;
			var m:Matrix = new Matrix();
			m.tx = ary[0][0] + ary[0][2] * num2;
			this.renderData.draw(blackA, m);
			m.tx = ary[1][0] + ary[1][2] * num2;
			this.renderData.draw(blackA, m);
			m.tx = 0;
			m.ty = ary[2][1] + ary[2][3] * num2;
			this.renderData.draw(blackA, m);
			m.ty = ary[3][1] + ary[3][3] * num2;
			this.renderData.draw(blackA, m);
		}
		
		private function drawB():void 
		{
			var num:Number = (timeMax - time) / timeMax;
			var m:Matrix = new Matrix();
			m.tx = ary[0][0] + ary[0][2] * num;
			this.renderData.draw(blackA, m);
			m.tx = ary[1][0] + ary[1][2] * num;
			this.renderData.draw(blackA, m);
			m.tx = 0;
			m.ty = ary[2][1] + ary[2][3] * num;
			this.renderData.draw(blackA, m);
			m.ty = ary[3][1] + ary[3][3] * num;
			this.renderData.draw(blackA, m);
		}
	}
}


















