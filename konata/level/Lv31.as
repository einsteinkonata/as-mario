package konata.level  
{
	import KO.K;
	import konata.G;
	/**
	 * ...
	 * @author 计算用
	 */
	public class Lv31 extends LevelBase 
	{
		
		public function Lv31() 
		{
			W = 150;
			H = 15;
			cameraX = 0;
			cameraY = -2;
			px = K.W / 2;
			py = H / 2 * G.Size;
			
			map = [[3,12,3,50],[4,12,3,50],[5,12,3,50],[6,12,3,50],[7,12,3,50],[8,12,3,50],[9,12,3,50],[10,12,3,50],[11,12,3,50],[12,12,3,50],[13,12,3,50],[14,12,3,50],[15,12,3,50],[16,12,3,50],[17,12,3,50],[18,12,3,50],[19,12,3,50],[20,12,3,50],[21,12,3,50],[22,12,3,50],[23,12,3,50],[24,12,3,50],[25,12,3,50],[26,12,3,50],[27,12,3,50],[28,12,3,50],[29,12,3,50],[30,12,3,50],[31,12,3,50],[32,12,3,50],[33,12,3,50],[34,12,3,50],[35,12,3,50],[36,12,3,50],[37,12,3,50],[38,12,3,50],[39,12,3,50],[40,12,3,50],[41,12,3,50],[42,12,3,50],[43,12,3,50],[44,12,3,50],[45,12,3,50],[46,12,3,50],[47,12,3,50],[48,12,3,50],[49,12,3,50],[50,12,3,50],[51,12,3,50],[52,12,3,50],[53,12,3,50],[54,12,3,50],[55,12,3,50],[56,12,3,50],[57,12,3,50],[58,12,3,50],[59,12,3,50],[60,12,3,50],[61,12,3,50],[62,12,3,50],[63,12,3,50],[64,12,3,50],[65,12,3,50],[66,12,3,50],[67,12,3,50],[68,12,3,50],[69,12,3,50],[70,12,3,50],[71,12,3,50],[72,12,3,50],[73,12,3,50],[74,12,3,50],[75,12,3,50],[76,12,3,50],[77,12,3,50],[78,12,3,50],[79,12,3,50],[80,12,3,50],[81,12,3,50],[82,12,3,50],[83,12,3,50],[84,12,3,50],[85,12,3,50],[86,12,3,50],[87,12,3,50],[88,12,3,50],[89,12,3,50],[90,12,3,50],[91,12,3,50],[92,12,3,50],[93,12,3,50],[94,12,3,50],[95,12,3,50],[96,12,3,50],[97,12,3,50],[98,12,3,50],[99,12,3,50],[100,12,3,50],[101,12,3,50],[102,12,3,50],[103,12,3,50],[104,12,3,50],[105,12,3,50],[106,12,3,50],[107,12,3,50],[110,12,3,50],[111,12,3,50],[112,12,3,50],[113,12,3,50],[114,12,3,50],[115,12,3,50],[116,12,3,50],[117,12,3,50],[118,12,3,50],[119,12,3,50],[120,12,3,50],[121,12,3,50],[122,12,3,50],[123,12,3,50],[124,12,3,50],[125,12,3,50],[126,12,3,50],[127,12,3,50],[128,12,3,50],[129,12,3,50],[130,12,3,50],[134,12,3,50],[135,12,3,50],[136,12,3,50],[137,12,3,50],[138,12,3,50],[139,12,3,50],[140,12,3,50],[141,12,3,50],[142,12,3,50],[143,12,3,50],[144,12,3,50],[145,12,3,50],[146,12,3,50],[147,12,3,50],[148,12,3,50],[149,12,3,50],[133,12,3,50],[3,2,3,50],[4,2,3,50],[5,2,3,50],[6,2,3,50],[7,2,3,50],[8,2,3,50],[9,2,3,50],[10,2,3,50],[11,2,3,50],[12,2,3,50],[13,2,3,50],[14,2,3,50],[15,2,3,50],[16,2,3,50],[17,2,3,50],[18,2,3,50],[19,2,3,50],[20,2,3,50],[21,2,3,50],[22,2,3,50],[23,2,3,50],[24,2,3,50],[25,2,3,50],[26,2,3,50],[27,2,3,50],[28,2,3,50],[29,2,3,50],[30,2,3,50],[31,2,3,50],[32,2,3,50],[33,2,3,50],[34,2,3,50],[35,2,3,50],[36,2,3,50],[37,2,3,50],[38,2,3,50],[39,2,3,50],[40,2,3,50],[41,2,3,50],[42,2,3,50],[43,2,3,50],[44,2,3,50],[45,2,3,50],[46,2,3,50],[47,2,3,50],[48,2,3,50],[49,2,3,50],[50,2,3,50],[51,2,3,50],[52,2,3,50],[53,2,3,50],[54,2,3,50],[55,2,3,50],[56,2,3,50],[57,2,3,50],[58,2,3,50],[59,2,3,50],[60,2,3,50],[61,2,3,50],[62,2,3,50],[63,2,3,50],[64,2,3,50],[65,2,3,50],[66,2,3,50],[67,2,3,50],[68,2,3,50],[69,2,3,50],[70,2,3,50],[71,2,3,50],[72,2,3,50],[73,2,3,50],[74,2,3,50],[75,2,3,50],[76,2,3,50],[77,2,3,50],[78,2,3,50],[79,2,3,50],[80,2,3,50],[81,2,3,50],[82,2,3,50],[83,2,3,50],[84,2,3,50],[85,2,3,50],[86,2,3,50],[87,2,3,50],[88,2,3,50],[89,2,3,50],[90,2,3,50],[91,2,3,50],[92,2,3,50],[93,2,3,50],[94,2,3,50],[95,2,3,50],[96,2,3,50],[97,2,3,50],[98,2,3,50],[99,2,3,50],[100,2,3,50],[101,2,3,50],[102,2,3,50],[103,2,3,50],[104,2,3,50],[105,2,3,50],[106,2,3,50],[107,2,3,50],[108,2,3,50],[109,2,3,50],[110,2,3,50],[111,2,3,50],[112,2,3,50],[113,2,3,50],[114,2,3,50],[115,2,3,50],[116,2,3,50],[117,2,3,50],[118,2,3,50],[119,2,3,50],[120,2,3,50],[121,2,3,50],[122,2,3,50],[123,2,3,50],[124,2,3,50],[125,2,3,50],[126,2,3,50],[127,2,3,50],[128,2,3,50],[129,2,3,50],[130,2,3,50],[134,2,3,50],[135,2,3,50],[136,2,3,50],[137,2,3,50],[138,2,3,50],[139,2,3,50],[141,2,3,50],[143,2,3,50],[145,2,3,50],[146,2,3,50],[147,2,3,50],[148,2,3,50],[149,2,3,50],[131,2,3,50],[132,2,3,50],[133,2,3,50],[22,8,1,0],[22,9,1,0],[23,8,1,0],[23,9,1,0],[24,8,1,0],[24,9,1,0],[25,8,1,0],[25,9,1,0],[29,6,1,0],[29,7,1,0],[30,6,1,0],[30,7,1,0],[31,6,1,0],[31,7,1,0],[32,6,1,0],[32,7,1,0],[30,5,0,1],[35,10,1,0],[35,11,1,0],[36,10,1,0],[36,11,1,0],[37,10,1,0],[37,11,1,0],[38,10,1,0],[38,11,1,0],[35,4,1,0],[35,5,1,0],[36,4,1,0],[36,5,1,0],[37,4,1,0],[37,5,1,0],[38,4,1,0],[38,5,1,0],[38,9,0,1],[43,8,0,6],[48,10,1,0],[48,11,1,0],[49,10,1,0],[49,11,1,0],[50,10,1,0],[50,11,1,0],[51,10,1,0],[51,11,1,0],[46,6,1,0],[46,7,1,0],[47,6,1,0],[47,7,1,0],[48,6,1,0],[48,7,1,0],[49,6,1,0],[49,7,1,0],[48,5,0,2],[53,6,1,0],[53,7,1,0],[54,6,1,0],[54,7,1,0],[55,6,1,0],[55,7,1,0],[56,6,1,0],[56,7,1,0],[67,4,0,4],[62,6,1,0],[62,7,1,0],[63,6,1,0],[63,7,1,0],[64,6,1,0],[64,7,1,0],[65,6,1,0],[65,7,1,0],[57,7,1,0],[58,7,1,0],[60,7,1,0],[61,7,1,0],[65,5,0,7],[52,11,3,50],[34,11,3,50],[59,7,1,0],[59,5,3,11],[68,10,1,0],[68,11,1,0],[69,10,1,0],[69,11,1,0],[70,10,1,0],[70,11,1,0],[71,10,1,0],[71,11,1,0],[74,7,1,0],[74,8,1,0],[75,7,1,0],[75,8,1,0],[76,7,1,0],[76,8,1,0],[77,7,1,0],[77,8,1,0],[80,6,0,4],[80,9,0,4],[83,7,1,0],[83,8,1,0],[84,7,1,0],[84,8,1,0],[85,7,1,0],[85,8,1,0],[86,7,1,0],[86,8,1,0],[92,10,3,50],[93,10,3,50],[94,10,3,50],[95,10,3,50],[92,9,3,50],[93,9,3,50],[94,9,3,50],[95,9,3,50],[94,11,0,1],[96,11,0,1],[97,11,0,1],[99,11,0,2],[90,7,1,0],[90,8,1,0],[91,7,1,0],[91,8,1,0],[90,5,1,0],[90,6,1,0],[91,5,1,0],[91,6,1,0],[99,8,1,0],[100,8,1,0],[101,8,1,0],[102,8,1,0],[103,8,1,0],[98,8,1,0],[104,8,1,0],[104,5,1,0],[104,6,1,0],[102,3,1,0],[102,4,1,0],[103,3,1,0],[103,4,1,0],[100,3,1,0],[100,4,1,0],[101,3,1,0],[101,4,1,0],[98,3,1,0],[98,4,1,0],[99,3,1,0],[99,4,1,0],[104,7,1,0],[111,11,3,50],[113,11,3,50],[113,10,3,50],[115,11,3,50],[115,10,3,50],[115,9,3,50],[117,10,3,50],[117,9,3,50],[117,8,3,50],[119,11,3,50],[119,10,3,50],[119,9,3,50],[119,8,3,50],[121,11,3,50],[121,10,3,50],[121,9,3,50],[121,8,3,50],[123,10,3,50],[123,9,3,50],[123,8,3,50],[125,11,3,50],[125,10,3,50],[125,9,3,50],[127,11,3,50],[127,10,3,50],[129,11,3,50],[120,6,0,6],[120,5,3,50],[120,4,3,50],[120,3,3,50],[120,8,2,0],[121,7,2,0],[119,7,2,0],[143,11,3,50],[143,10,3,50],[143,9,3,50],[145,10,3,50],[145,9,3,50],[141,11,3,50],[141,10,3,50],[139,11,3,50],[145,8,3,50],[147,5,0,99],[84,11,3,50],[76,11,3,50],[105,8,1,0],[105,5,1,0],[105,6,1,0],[105,7,1,0],[140,2,3,50],[142,2,3,50],[144,2,3,50],[144,3,0,9],[143,3,0,9],[142,3,0,9],[141,3,0,9],[140,3,0,9],[139,3,0,9]];

			InitGrid();

		}
		
	}

}