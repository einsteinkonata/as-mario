package konata.mapItem 
{
	import flash.display.BlendMode;
	import KO.K;
	import KO.KAnimMap;
	import KO.KEmitter;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.arms.armB;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.ArmHelper;
	import konata.pig.PigA;
	import konata.pig.PigBase;
	
	/**
	 * ...
	 * @author 计算用
	 */
	public class PlayerItemB extends KRectangleEntity 
	{
		private var emitter:KEmitter;
		private var emi:int = 0;
		// 第一次坐标
		private var pointX:int = 0;
		private var pointY:int = 0;
		// 碰
		private var hitX:Array;
		private var hitY:Array;
		// 第一次后停时间
		private var timeNum:Number = 0;
		private var timeMax:Number = 0.5;
		private var timeNum2:Number = 0;
		private var timeMax2:Number = 4;
		// 速度值
		private var speedA:Number = 0;
		private var speedX:Number = 0;
		private var speedY:Number = 0;
		private var state:int = 0;
		// 界值
		private var hitNum:int = 7;
		
		
		public function PlayerItemB(_x:Number, _y:Number,turn:int = 0)
		{
			super(_x, _y, 16, 16);
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			this.x = this.x - this.width / 2;
			this.y = this.y - this.height / 2;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
			//
			this.pointX = _x;
			this.pointY = _y - G.Size;
			this.speed = 6;
			this.speedX = (turn > 0) ? speed * 1 : speed * -1;
			this.speedY = speed;
			
			this.hitLayers = [G.LayerItem, G.LayerPig];	
			
			//_animMap = new KAnimMap();
			//_animMap.add("move", [469, 479, 489,499], 0.1);
			//_animMap.play("move");			
			this.my = this.mx = -8;
			this.renderData = KSources.getBitmap(4, 9, 1);
			
			emitter = new KEmitter(KSources.getBitmap(4, 9, 1), 32, 32);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", 0.4, 0);
		}
		private function OnEmitter():void {
			if (emi++ % 3 == 0){
				emitter.setMotion("a", 0, 0, .4, 0, 0);
				emitter.emit("a", this.x - 8 + this.vx, this.y + 8 + this.vy- 16);
			}
			emitter.update();
		}
		
		override public function update():void 
		{
			if (state == 0) {
				this.vy = -speed;
				if (this.y < pointY) {
					this.vy = 0;
						state = 1;
				}
			}else if (state == 1) {
				OnMove();
				OnHitGrid();
			}
			remove();
			
			//_animMap.update();
			OnEmitter();
			//emitter.render();
		}
		override public function render():void 
		{
			emitter.render();
			//this.renderData = _animMap._source;
		}
		override public function removed():void 
		{
			K.game.add(new armB(this.x, this.y)); 
		}
		private function remove():void 
		{
			if (this.x < K.Camera.x - G.romX
			|| this.x > K.Camera.x + G.roomX
			|| this.y < K.Camera.y - G.romY
			|| this.y > K.Camera.y + G.roomY
			|| hitNum <= 0 || timeNum2 > timeMax2) {
				K.game.remove(this);
			}
		}
		
		private function OnMove():void {
			to_X();
			to_Y();
			timeNum2 += K.elapsed;
			this.vx = speedX;
			this.vy = speedY;
			// 碰X
			hitX = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
			//trace(IsHitX);
			this.x += this.vx;
			this.vx = 0;
			to_X();
			
			// 碰Y
			hitY = [];
			hitY = KGridHit.HitGridY(this, CGame.map);
		}
		private function OnHitGrid():void
		{
			if (hitX.length > 0) {
				speedX *= -1;
				hitNum -= 1;
			}
			if (hitY.length != 0) {
				speedY *= -1;
				hitNum -= 1;
			}
		}
		override public function vsOBB(obb:KRectangleEntity):void 
		{
			if (KHit.RectHitRect(this, obb) == true) {
				if (obb is ItemCard) {
					(obb as ItemCard).mappoint = null;
					CGame.map[obb._x][obb._y] = [0, 0];
					ArmHelper.newArmB(obb.x + 8, obb.y + 8);
					K.game.remove(obb);
				}else 
				if (obb is PigBase) {
					K.game.remove(obb);
					K.game.remove(this);
				}
			}
		}
		public function to_X():void {
			this._x = Math.floor(this.x / G.Size);
			this._w = Math.floor((this.x + this.bitmapW) / G.Size);
		}
		public function to_Y():void {
			this._y = Math.floor(this.y / G.Size);
			this._h = Math.floor((this.y + this.bitmapH) / G.Size);
		}
	}

}