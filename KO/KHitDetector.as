package KO {
	import KO.KCircleEntity;
	import KO.KEntity;
	import KO.KRectangleEntity;
	
	public class KHitDetector{
		
		public function KHitDetector() {
			
		}
		
		public static function ScanningLayer(entity:KEntity):void {
			if (!(entity is IHitTypes)
			|| entity.hitLayers == null 
			|| entity.hitLayers.length < 1) return;
			for each(var layer:String in entity.hitLayers) {
				Detect(entity, K.game.getRenderByLayer(layer));
			}
		}
		
		private static function Detect(objA:KEntity, list:Array):void {
			if (list == null || list.length < 1 ) return;
			var objB:KEntity;
			var index:int = list.length;
			while (index--) {
				objB = list[index];
				if (objA === objB) continue;
				
				hitTypes(objA as IHitTypes, objB);
			}
		}
		
		private static function hitTypes(objA:IHitTypes, objB:KEntity):void {
			if (objB is KRectangleEntity) {
				objA.vsOBB(objB as KRectangleEntity);
				
			}else if (objB is KCircleEntity) {
				objA.vsCircle(objB as KCircleEntity);
			}
		}
	}
}