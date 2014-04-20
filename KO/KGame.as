package KO {
	import flash.display.BlendMode;
	import flash.utils.Dictionary;
	import KO.KEntity;

	public class KGame extends Object {
		private var _mainList:Array;
		private var _renderList:Dictionary;
		private var _layerList:Array;

		public function KGame(){
			this._renderList = new Dictionary();
			this._layerList = [K.Layer0, K.Layer1];
			this._renderList[K.Layer0] = [];
			this._renderList[K.Layer1] = [];
			this._mainList = [];
		}

		public function CheckEntity(entity:KEntity):Boolean {
			var layer:String = entity._layer;
			var list:Array = (layer == "main") ? this._mainList : this._renderList[layer] as Array;
			var obj:KEntity
			var index:int = list.length;
			while (index--) {
				obj = list[index];
				if (entity == obj) {
					return true;
				}
			}
			return false;
		}
		
		public function getEntity(name:String, layer:String = "last"):KEntity {
			var entity:KEntity;
			var list:Array = (layer == "main") ? this._mainList : this._renderList[layer] as Array;
			var index:int = list.length;
			while (index--){
				entity = list[index];
				if (entity.name == name){
					return entity;
				}
			}
			return null;
		}
		
		public function CheckLayerName(layer:String):String {
			if (this._renderList[layer] == null) {
				trace("error : not layer !!!");
				return "";
			}
			return layer;
		}

		public function getRenderByLayer(layer:String):Array {
			return this._renderList[layer] as Array;
		}

		public function addLayer(layer:String):void {
			if(getRenderByLayer(layer) == null){
				this._layerList.splice(this._layerList.length - 1, 0, layer);
				this._renderList[layer] = new Array();
			}
			trace(layer);
		}

		public function add(entity:KEntity, layer:String = "last"):void {
			if (entity._world == this){
				return;
			}
			if (layer == "main"){
				_mainList.push(entity);
				entity._world = this;
				entity._layer = "main";
				return;
			} else if (this._renderList[layer] == null){
				addLayer(layer);
			}
			(this._renderList[layer] as Array).push(entity);
			entity._world = this;
			entity._layer = layer;
		}

		public function remove(entity:KEntity){
			var index:int = -1;
			if (entity._layer == "main"){
				index = _mainList.indexOf(entity);
				if (index > -1){
					removeEntity(entity);
					delete _mainList.splice(index, 1)[0];
					return;
				}
			} else {
				var renderList:Array = (this._renderList[entity._layer] as Array);
				index = renderList.indexOf(entity);
				if (index > -1){
					removeEntity(entity);
					delete renderList.splice(index, 1)[0];
					return;
				}
			}
		}

		public function removeAll(){
			var entity:KEntity = null;
			var renderList:Array;
			var renderIndex:int;
			var layer:String;
			var layerIndex:int = this._layerList.length;
			while (layerIndex--){
				layer = this._layerList[layerIndex];
				renderList = getRenderByLayer(layer);
				renderIndex = renderList.length;
				while (renderIndex--){
					entity = renderList[renderIndex];
					removeEntity(entity);
					delete renderList.splice(renderIndex, 1)[0];
				}
			}
			var mainIndex:int = _mainList.length;
			while (mainIndex--){
				entity = _mainList[mainIndex];
				removeEntity(entity);
				delete _mainList.splice(mainIndex, 1)[0];
			}
		}

		private function removeEntity(entity:KEntity):void {
			entity.removed();
			entity._world = null;
		}

		public function update(){
			var renderList:Array;
			var renderIndex:int;
			var layer:String;
			var layerIndex:int = this._layerList.length;
			while (layerIndex--){
				layer = this._layerList[layerIndex];
				renderList = getRenderByLayer(layer);
				renderIndex = renderList.length;
				while (renderIndex--){
					UpdateHelper(renderList[renderIndex] as KEntity);
				}
			}
			return;
		}

		public function render(){
			K.Fill();
			var renderList:Array;
			var renderIndex:int;
			var renderCount:int;
			var layer:String;

			var layerCount:int = this._layerList.length;
			var layerIndex:int = 0;
			while (layerIndex < layerCount){
				layer = this._layerList[layerIndex++];
				renderList = getRenderByLayer(layer);
				renderIndex = 0;
				renderCount = renderList.length;
				while (renderIndex < renderCount){
					RenderHelper(renderList[renderIndex++]);
				}
			}
			mainRender();
		}

		public function mainUpdate():void {
			var mainIndex:int = _mainList.length;
			while (mainIndex--) {
				UpdateHelper(_mainList[mainIndex] as KEntity);
			}
		}
		
		public function mainRender():void {
			var mainIndex:int = 0;
			var mainCount:int = _mainList.length;
			while (mainIndex < mainCount) {
				RenderHelper(_mainList[mainIndex++] as KEntity);
			}
		}
		
		public function UpdateHelper(entity:KEntity):void {
			if (entity == null || entity.activat == false) return;
			entity.update();
			KHitDetector.ScanningLayer(entity);
			entity.moved();
		}
		// Camera
		public function RenderHelper(entity:KEntity):void {
			entity.render();
			if (entity.visible && entity.renderData) {
				entity.matrix.tx = entity.x + entity.mx - K.Camera.x;
				entity.matrix.ty = entity.y + entity.my - K.Camera.y;
				K.render.draw(entity.renderData, entity.matrix, entity.colorTransform, BlendMode.NORMAL);
			}
		}
		// Not Camera
		public function RenderNotCameraHelper(entity:KEntity):void {
			entity.render();
			if (entity.visible && entity.renderData) {
				entity.matrix.tx = entity.x + entity.mx;
				entity.matrix.ty = entity.y + entity.my;
				K.render.draw(entity.renderData, entity.matrix, entity.colorTransform, BlendMode.NORMAL);
			}
		}
	}
}







