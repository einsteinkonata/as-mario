package konata.panel 
{
	import flash.geom.Rectangle;
	import KO.K;
	import KO.KEntity;
	import konata.config.CGame;
	import konata.G;
	
	/**
	 * ...
	 * @author 计算用
	 */
	public class CameraUpdate extends KEntity 
	{
		public var rect:Rectangle;
		public var rect2:Rectangle;
		
		public function CameraUpdate() 
		{
			rect = new Rectangle(0, 0, K.W, K.H);
			rect2 = new Rectangle(0, 0
				, rect.width / 2  + G.Size * CGame.lv.cameraX
				, rect.height / 2  + G.Size * CGame.lv.cameraY);
			
			cameraUpdate();
		}
		
		override public function update():void  
		{
			cameraUpdate();
		}
		
		public function cameraUpdate():void {
			if (CGame.player == null) return;
			K.Camera.x = CGame.player.x - rect2.width;
			K.Camera.x = (K.Camera.x < 0) ? 0 : K.Camera.x;
			K.Camera.x = Math.min(K.Camera.x, CGame.CW - K.W);
			
			K.Camera.y = CGame.player.y - rect2.height;
			K.Camera.y = (K.Camera.y < 0) ? 0 : K.Camera.y;
			K.Camera.y = Math.min(K.Camera.y, CGame.CH - K.H);
		}
	}

}