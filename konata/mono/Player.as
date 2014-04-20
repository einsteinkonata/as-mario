package konata.mono 
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import KO.K;
	import KO.KAnimMap;
	import KO.KEmitter;
	import KO.KEntity;
	import KO.KGridHit;
	import KO.KHit;
	import KO.KRectangleEntity;
	import konata.config.CController;
	import konata.config.CGame; 
	import konata.G;
	import konata.Game;
	import konata.Helper.ArmHelper;
	import konata.Helper.HitHelper;
	import konata.Helper.PlayerHelper;
	import konata.mapItem.ItemA;
	import konata.mapItem.ItemBase;
	import konata.mapItem.ItemSolid;
	import konata.mapItem.PlayerItemA;
	import konata.mapTool.BrickBase;
	import konata.mapTool.TableA;
	import konata.mapTool.TableC;
	import konata.panel.GameMenu;
	import konata.particle.Box1;
	import konata.pig.PigA;
	import konata.pig.PigB;
	import konata.pig.PigBase;
	import konata.pig.PigFA;
	import konata.pig.PigH;
	import konata.pig.PigI;
	import konata.pig.PigJ;
	
	public class Player extends KRectangleEntity
	{
		public var Quality:Number = 0.8;
		public var vertical:Number = 0;
		public var sizeX:int = 24;
		public var sizeY:int = 28;
		private var emitter:KEmitter;
		private var emi:Number = 0;
		//
		private var IsHorizontal:Boolean = false;
		private var IsVertical:Boolean = false;
		private var hitX:Array;
		private var hitY:Array;
		// 力 
		public var prevMove:int = 0;
		public var runNum:Number = 0;
		public var runMax:Number = 0.7;// 跑
		public var IsActk:Boolean = false;
		public var jump:Number = 13;
		public var IsJump:Boolean = false;
		public var IsRun:Boolean = false;
		public var AiJump:Boolean = false;
		public var IsPig:Boolean = false;
		// 攻击间隔
		// 停时间
		public var actkNum:Number = 3;
		public var actkMax:Number = 3;// 攻击
		// 状态
		public var IsAir:Boolean = true;
		public var InObject:KEntity = null;
		public var IsObj:Boolean = false;
		//
		public var state:int = 0;// 0 1 大 2 云 3 火 
		public var status:int = 0;
		public var statusTime:Number = 0;
		public var statusMax:Number = 1.5;
		// 面向
		public var turn:int = 1;// 0 右,1 左
		
		public function Player()
		{
			super(0, 0, sizeX, sizeY);
			this.x = CGame.lv.px;//K.W * 0.5
			this.y = CGame.lv.py;//3 * G.Size;
			CGame.player = this;
			this.bitmapW = this.width;
			this.bitmapH = this.height;
			_w = Math.round(this.bitmapW / G.Size);
			_h = Math.round(this.bitmapH / G.Size);
			draw(0x0000cc);
			hitLayers = [G.LayerPig, G.LayerMap, G.LayerItem];
			this.speed = 4;
			//
			this.mx = -20;
			this.my = -34;
			//
			InitAnim();
		}
		
		private function InitAnim():void 
		{
			_animMap = new KAnimMap();
			var str:String = "";
			for (var i:int = 0 ; i < 5; i++ ) {
				str = i.toString();
				_animMap.add("stop" + str, [560 + i, 570 + i], 0.5);
				_animMap.add("jump" + str, [580 + i], 1);
				_animMap.add("move" + str, [500 + i, 510 + i, 520 + i, 530 + i, 540 + i, 550 + i], 0.2);
				_animMap.add("run"  + str, [500 + i, 510 + i, 520 + i, 530 + i, 540 + i, 550 + i], 0.1);
				_animMap.add("act"  + str, [590 + i], 0.3);
			}
			this.renderData = new BitmapData(64, 64, true, 0);
			emitter = new KEmitter(this.renderData, 64, 64);
			emitter.newType("run", [0]);
			emitter.setAlpha("run", 0.8, 0);
		}
		// 是否前走　x 移动
		private function OnMoveHorizontal():void {
			if (CController.move != 0) {
				// 走
				this.vx += (CController.move == 1) ? speed : -speed;
				// 跑
				if (prevMove == CController.move) {
					if(IsAir == false) {
						runNum += K.elapsed;
					}
				}else {
					runNum = 0;
				}
				this.vx = (runNum >= runMax) ? this.vx * 2 : this.vx;
				
				turn = (CController.move == 1) ? 1 : -1;
				IsRun = (runNum >= runMax); // 跑
				
				prevMove = CController.move;
			}else {
				runNum = 0;
			}
		}
		// 是否跳　y 移动
		private function OnMoveVertical():void {
			// 按跳时松手, 马上下落
			if (AiJump == true) {
				if (vertical >= 0){
					if (IsPig == true || status == 1) {// 被打的时候
						vertical = (status == 0) ? -jump : -jump * 0.4;
						IsPig = false;
						IsAir = IsJump = true;
						InObject = null;
					}
				}
			}
			else {
				vertical = (CController.jump == 0 && vertical < 0) ? 0 : vertical;
				if (CController.jump == 1 && (IsJump == false || InObject != null)) {
					vertical = -jump;
					IsAir = true;
					IsJump = true;
					InObject = null;
				}
			}
			// 
			if (InObject != null) {
				this.vy = vertical = InObject.speed;
			}else {
				this.vy += (vertical > jump) ? jump : vertical;
			}
		}
		
		override public function update():void
		{
			OnActk();
			OnMove();
			// 移动
			OnMoved();
			// 打烂
			OnHitGrid();
			
			OnAnim();
			emitter.update();
		}
		override public function render():void 
		{
			this.renderData = _animMap._source;
			emitter.render();
		}
		
		private function OnAnim():void 
		{
			this.alpha = (status == 1) ? 0.5 : 1;
			
			var str:String = state.toString();
			//
			if (this.IsActk == true && _animMap.IsOver == false) {
				_animMap.play("act" + str, false);
			}
			else if (IsJump == true && InObject == null) {
				_animMap.play("jump" + str);
			}
			else if (InObject != null || IsJump == false) {
				if (CController.move == 0) {
					_animMap.play("stop" + str);
				}else {
					if (IsRun == false) {
						_animMap.play("move" + str);
					}else {
						_animMap.play("run" + str);
					}
				}
			}
			//
			if (turn > 0) {
				this.matrix.a = 1;
				this.mx = -20;
			}else if (turn < 0) {
				this.matrix.a = -1;
				this.mx = -20 + 64;
			}
			_animMap.update();
			//
			if (IsRun == true) {
				emi += K.elapsed;
				if (emi >= 0.1) {
					emi = 0;
					emitter.setMotion("run", 0, 0, .5, 0, 0);
					var bitData:BitmapData = new BitmapData(64, 64, true, 0);
					bitData.draw(this.renderData, new Matrix(this.matrix.a, 0, 0, 1, this.mx + 20));
					emitter.setTypeSource("run", bitData);
					emitter.emit("run", this.x - 20, this.y + this.my);
				}
			}
		}
		private function OnActk():void 
		{
			if (this.state > 1 && CController.actk == 1 && _animMap._anim.name.indexOf("act") == -1) {
				PlayerHelper.OnAttack(this);
			}
			
			if (actkNum < actkMax) {
				actkNum += K.elapsed;
			}
		}
		private function OnMove():void {
			vertical += Quality * G.Gravity;//
			
			OnMoveHorizontal();
			OnMoveVertical();
			
			hitX = [];
			hitX = KGridHit.HitGridX(this, CGame.map);
			this.x += this.vx;
			to_X();
			this.x -= this.vx;
			
			hitY = [];
			hitY = KGridHit.HitGridY(this, CGame.map);
			this.y += this.vy;
			to_Y();
			this.y -= this.vy;
			// 隐藏
			var i:int;
			for (i = _x; i <= _w; i++) {
				if (i >= 0 && i < CGame.map.length && _y >= 0 && _y < CGame.map[0].length) {
					if (CGame.map[i][_y][0] == 4 && CGame.pig4 < 4) {
						Dead();
					}
				}
			}
		}
		private function OnMoved():void
		{
			// 跳修正
			IsAir = (hitY.length == 0 || (hitY.length != 0 && this.vy < 0));// 在空中
			IsJump = IsAir;// 在跳
			if (hitY.length != 0) InObject = null; // 碰到就 没 底板
			vertical = (hitY.length != 0) ? 0 : vertical; // 碰到就 0 下落重力
			if (AiJump == true && vertical >= -1) {// 停止自动跳
				AiJump = false;
			}
			if (status == 1) {// 受伤无敌时间
				statusTime += K.elapsed;
				if (statusTime >= statusMax) {
					statusTime = 0;
					status = 0;
				}
			}
			// 边界
			if (this.x <= K.Camera.x + 10) {
				this.x = K.Camera.x + 10;
			}else if(this.x >= CGame.mapWidth - 40){
				this.x = CGame.mapWidth - 40;
			}
			if (this.y > K.Camera.y + G.roomY) {
				state = 0;
				Dead();
			}
		}
		// 上下碰方块
		private function OnHitGrid():void
		{
			var item:Array;
			var i:int;
			var numDead:int = 0;// -1 不碰, 0 未判断, 1 碰剌
			// y
			i = hitY.length;
			while (i-- > 0) {
				item = hitY[i];		
				// 碰剌
				if (numDead != -1) {
					numDead = (item[2] == 3 && item[3] == 2) ? 1 : -1;
				}
				// 跳碰头
				if (hitY[0][1] < this._y) {
					PlayerHelper.HitItem(this, item);
				}
			}
			// x
			i = hitX.length;
			while (i-- > 0) {
				item = hitX[i];
				// 碰剌
				if (numDead != -1) {
					numDead = (item[2] == 3 && item[3] == 2) ? 1 : -1;
				}
			}
			if (numDead == 1) Dead();
		}
		
		override public function vsOBB(obb:KRectangleEntity):void {
			if (InObject != null) {	// 判断在有脚底时,是否还有脚底.
				var modeSpeed:Number = Math.abs(InObject.speed * 2);				
				this.y += modeSpeed;
				if (K.game.CheckEntity(InObject) == false
				|| KHit.RectHitRect(this, InObject as KRectangleEntity) == false) {
					InObject = null;
				}
				this.y -= modeSpeed;
			}
			if (KHit.RectHitRect(this, obb) == true) {
				var heightY:Number = this.y + this.height;
				var isTop:Boolean = (heightY - this.vy * 2 < obb.y);
				// 踩
				if (heightY + this.vy > obb.y) {
					if (obb is TableA) {
						if (isTop == true) {
							IsPig = AiJump = IsAir = IsJump = false;
							vertical = 0;
							InObject = obb;
							hitY = KGridHit.HitGridY(this, CGame.map);
							if (hitY.length != 0) {
								vertical = 2;
								InObject = null;
								IsAir = IsJump = true;
							}
						}
					}
					else if (obb is PlayerItemA 
					|| (obb is TableC && (obb as TableC).state == 0)) {
						if (isTop == true) {
							this.vy = 0;
							IsPig = AiJump = IsJump = true;
							InObject = null;
							ArmHelper.newArmA(this.x + this.width / 2, heightY);
							if (obb is PlayerItemA) {
								K.game.remove(obb);
							}else if (obb is TableC) {
								(obb as TableC).state = 1;
							}
						}
					}
				}
				// 攻击小兵
				if (obb is PigBase) {
					//
					if (heightY - this.vy * 2 + (obb as PigBase).vertical < obb.y) {
						if (obb is PigFA) {// 踩停龟壳
							(obb as PigFA).trun = (this.x + this.width / 2) < (obb.x + obb.width / 2) ? 3 : 2;
							this.vy = 0;
							this.y = obb.y - this.height;
							IsPig = AiJump = IsJump = true;
							InObject = null;
							ArmHelper.newArmA(this.x + this.width / 2, this.y + this.height);
							return;
						}else if (obb is PigB || obb is PigI || obb is PigJ) {
							Dead();
							return;
						}
						this.vy = 0;
						this.y = obb.y - this.height;
						IsPig = AiJump = IsJump = true;
						InObject = null;
						K.game.remove(obb);
						ArmHelper.newArmA(this.x + this.width / 2, this.y + this.height);
					}
					else {
						Dead();
					}
				} 
				// 碰道具
				else if (obb is ItemBase) {
					PlayerHelper.GetItem(this, obb as ItemBase);
				}
				else if (obb is ItemSolid) {
					if (isTop == true) {
						IsPig = AiJump = IsAir = IsJump = false;
						this.y = obb.y - this.height + 0.1;
						this.vy = vertical = 0;
						InObject = obb;
					}
				}
			}
			//
			if (InObject != null && InObject is TableA) {// 有底板时, Y坐标跟随底板
				this.vy = InObject.speed;
				this.y = InObject.y - this.height - InObject.vy;
				this.vy = 0;
			}
		}
		private var deadindex:int = 0;
		public function Dead():void {
			if (status == 0) {
				status = 1;
				if (state > 0) {
					state = (state > 1) ? 1 : 0;					
					AiJump = true;
					trace(state);
				}else {
					trace("dead");
					K.game.remove(this);
					Game.T.InGameOver();
				}
			}
		}
		override public function removed():void 
		{
			CGame.player = null;
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