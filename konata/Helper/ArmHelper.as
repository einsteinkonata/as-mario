package konata.Helper 
{
	import KO.K;
	import konata.arms.armA;
	import konata.arms.armB;
	import konata.arms.armC;
	import konata.arms.armD;
	/**
	 * ...
	 * @author 计算用
	 */
	public class ArmHelper 
	{
		
		public static function newArmA(x:Number,y:Number) {
			K.game.add(new armA(x, y));
		}
		public static function newArmB(x:Number,y:Number) {
			K.game.add(new armB(x, y));
		}
		public static function newArmC(x:Number,y:Number) {
			K.game.add(new armC(x, y));
		}
		public static function newArmD(x:Number,y:Number) {
			K.game.add(new armD(x, y)); 
		}
	}

}