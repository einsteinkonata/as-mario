package konata.mapItem 
{
	import KO.K;
	import KO.KEmitter;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import KO.KSources;
	import konata.arms.armA;
	import konata.config.CGame;
	import konata.G;
	import konata.Helper.ArmHelper;
	import konata.pig.PigA;
	import konata.pig.PigBase;
	import konata.pig.PigJ;
	
	
	public class PlayerItemC extends KRectangleEntity 
	{
		private var emitter:KEmitter;
		private var emi:int = 0;
		//
		public var Quality:Number = 0.8;
		public var vertical:Number = 0;
		// 碰
		private var hitX:Array;
		private var hitY:Array;
		
		public function PlayerItemC(_x:Number, _y:Number,turn:int = 0)
		{
			super(_x, _y, 16, 16);
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			this.x = this.x - this.width / 2;
			this.y = this.y - this.height / 2;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
			
			this.hitLayers = [G.LayerItem, G.LayerPig];
			
			this.speed = turn > 0 ? 8 : -8;
			
			this.renderData = KSources.getBitmap(4, 8, 1);
			this.my = this.mx = -8;
			
			emitter = new KEmitter(KSources.getBitmap(4, 8, 1), 32, 32);
			emitter.newType("a", [0]);
			emitter.setAlpha("a", 0.5, 0);
		}
		
		override public function update():void 
		{
			OnMove();
			OnHitGrid();
			
			remove();
			
			OnEmitter();
		}
		private function remove():void 
		{
			if (this.x < K.Camera.x - G.romX
			|| this.x > K.Camera.x + G.roomX
			|| this.y < K.Camera.y - G.romY
			|| this.y > K.Camera.y + G.roomY) {
				K.game.remove(this);
			}
		}
		override public function render():void 
		{
			emitter.render();
		}
		override public function removed():void 
		{
			K.game.add(new armA(this.x, this.y)); 
		}
		private function OnEmitter():void {
			if (emi++ % 3 == 0){
				emitter.setMotion("a", 0, 0, .4, 0, 0);
				emitter.emit("a", this.x - 8 + this.vx, this.y + 8 + this.vy- 16);
			}
			emitter.update();
		}
		private function OnMove():void {
			to_X();
			to_Y();
			
			
			this.vx = speed;
			vertical += Quality * G.Gravity;
			this.vy = vertical;
			// 碰X
			hitX = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
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
				K.game.remove(this);
			}
			if (hitY.length != 0) {
				if (this.vy >= 0) {
					vertical = -8.4;
				}else {
					K.game.remove(this);
				}
			}
		}
		override public function vsOBB(obb:KRectangleEntity):void 
		{
			if (KHit.RectHitRect(this, obb) == true) {
				if (obb is ItemCard) {
					K.game.remove(obb);
					CGame.map[obb._x][obb._y] = [0, 0];
					ArmHelper.newArmB(obb.x + 8, obb.y + 8);
				}else 
				if (obb is PigBase) {					
					(obb as PigBase).IsCamera = true;
					K.game.remove(this);
					if (obb is PigJ) return;
					K.game.remove(obb);
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