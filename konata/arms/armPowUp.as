package konata.arms 
{
	import KO.K;
	import KO.KEntity;
	import KO.KSources;
	import konata.config.CGame;
	
	public class armPowUp extends KEntity 
	{
		private var time:Number = 0;
		private var timeMax:Number = 0.5;
		
		private var num:Number = 1;
		
		public function armPowUp() 
		{
			super(0, 0);
			this.renderData = KSources.getBitmap(1, 5, 2);
			 
			this.my = this.mx = -this.renderData.width / 2 * num;
			if(CGame.player != null) {
				this.x = CGame.player.x + CGame.player.width / 2;
				this.y = CGame.player.y + CGame.player.height / 2;
			}
		}
		
		override public function update():void 
		{
			this.my = this.mx = -this.renderData.width / 2 * num;
			this.scaleX = num;
			this.scaleY = num;
			
			time += K.elapsed;
			if (time >= timeMax || CGame.player == null) {
				K.game.remove(this);
			}
			num = 1 - time / timeMax;
			num = num < 0 ? 0 : num;
			
			if(CGame.player != null) {
				this.x = CGame.player.x + CGame.player.width / 2;
				this.y = CGame.player.y + CGame.player.height / 2;
			}
		}
	}

}