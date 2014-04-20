package konata.button 
{
	import flash.display.BitmapData;
	import KO.K;
	import KO.KButton;
	import konata.config.CGame;
	import konata.Game;
	import konata.Helper.TextHelper;
	import konata.particle.BlackCloth;
	
	/**
	 * ...
	 * @author 计算用
	 */
	public class BStartBase extends KButton 
	{
		public var lvNum:String = "1-1";
		public var lv:BitmapData;
		public var black:BlackCloth = new BlackCloth();
		
		
		public function BStartBase(x:Number,y:Number,lvNum:String)
		{
			super(0, 0);
			this.lvNum = lvNum;
			this.lv = TextHelper.TextToDraw(lvNum, 2);
			this.x = x;
			this.y = y;
		}
		
		override public function OnUp():void
		{
			K.game.add(black, K.LayerMain); 
		}
		override public function update():void 
		{
			super.update();
			if (black.isOver == true) {
				CGame.lvNum = this.lvNum;
				K.game.removeAll();
				Game.T.InGameStart();
			}
		}
		
	}

}