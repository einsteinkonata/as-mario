package konata.level  
{
	import KO.K;
	import konata.G;
	/**
	 * ...
	 * @author 计算用
	 */
	public class Lv35 extends LevelBase 
	{
		
		public function Lv35() 
		{
			W = 150;
			H = 15;
			cameraX = 0;
			cameraY = -3;
			px = K.W / 2;
			py = H / 2 * G.Size;
			
			map = [[3,12,3,50],[4,12,3,50],[5,12,3,50],[6,12,3,50],[7,12,3,50],[8,12,3,50],[9,12,3,50],[10,12,3,50],[11,12,3,50],[12,12,3,50],[13,12,3,50],[14,12,3,50],[15,12,3,50],[16,12,3,50],[17,12,3,50],[18,12,3,50],[19,12,3,50],[20,12,3,50],[21,12,3,50],[22,12,3,50],[23,12,3,50],[24,12,3,50],[25,12,3,50],[26,12,3,50],[27,12,3,50],[3,2,3,50],[4,2,3,50],[5,2,3,50],[6,2,3,50],[7,2,3,50],[8,2,3,50],[9,2,3,50],[10,2,3,50],[11,2,3,50],[12,2,3,50],[13,2,3,50],[14,2,3,50],[15,2,3,50],[16,2,3,50],[17,2,3,50],[18,2,3,50],[19,2,3,50],[20,2,3,50],[21,2,3,50],[22,2,3,50],[23,2,3,50],[24,2,3,50],[25,2,3,50],[26,2,3,50],[27,2,3,50],[28,2,3,50],[29,2,3,50],[30,2,3,50],[31,2,3,50],[32,2,3,50],[33,2,3,50],[34,2,3,50],[35,2,3,50],[36,2,3,50],[37,2,3,50],[38,2,3,50],[39,2,3,50],[40,2,3,50],[41,2,3,50],[42,2,3,50],[43,2,3,50],[44,2,3,50],[45,2,3,50],[46,2,3,50],[47,2,3,50],[48,2,3,50],[49,2,3,50],[50,2,3,50],[51,2,3,50],[52,2,3,50],[53,2,3,50],[54,2,3,50],[55,2,3,50],[56,2,3,50],[57,2,3,50],[58,2,3,50],[59,2,3,50],[60,2,3,50],[61,2,3,50],[62,2,3,50],[63,2,3,50],[64,2,3,50],[65,2,3,50],[66,2,3,50],[67,2,3,50],[68,2,3,50],[69,2,3,50],[70,2,3,50],[71,2,3,50],[72,2,3,50],[73,2,3,50],[74,2,3,50],[75,2,3,50],[76,2,3,50],[77,2,3,50],[78,2,3,50],[79,2,3,50],[80,2,3,50],[81,2,3,50],[82,2,3,50],[83,2,3,50],[84,2,3,50],[85,2,3,50],[86,2,3,50],[87,2,3,50],[88,2,3,50],[89,2,3,50],[90,2,3,50],[91,2,3,50],[92,2,3,50],[93,2,3,50],[94,2,3,50],[95,2,3,50],[96,2,3,50],[97,2,3,50],[98,2,3,50],[99,2,3,50],[100,2,3,50],[102,2,3,50],[103,2,3,50],[104,2,3,50],[106,2,3,50],[107,2,3,50],[108,2,3,50],[110,2,3,50],[111,2,3,50],[112,2,3,50],[113,2,3,50],[114,2,3,50],[115,2,3,50],[116,2,3,50],[117,2,3,50],[118,2,3,50],[119,2,3,50],[120,2,3,50],[121,2,3,50],[122,2,3,50],[123,2,3,50],[124,2,3,50],[125,2,3,50],[126,2,3,50],[127,2,3,50],[128,2,3,50],[129,2,3,50],[130,2,3,50],[134,2,3,50],[135,2,3,50],[136,2,3,50],[137,2,3,50],[138,2,3,50],[139,2,3,50],[141,2,3,50],[143,0,3,50],[145,0,3,50],[146,2,3,50],[147,2,3,50],[148,2,3,50],[149,2,3,50],[131,2,3,50],[132,2,3,50],[133,2,3,50],[140,2,3,50],[142,2,3,50],[144,0,3,50],[0,12,3,50],[1,12,3,50],[2,12,3,50],[0,2,3,50],[1,2,3,50],[2,2,3,50],[144,1,0,99],[101,2,3,50],[105,2,3,50],[109,2,3,50],[28,11,3,50],[41,12,3,50],[43,12,3,50],[42,12,3,50],[44,12,3,50],[45,12,3,50],[46,12,3,50],[47,12,3,50],[49,12,3,50],[48,12,3,50],[51,12,3,50],[50,12,3,50],[52,12,3,50],[34,9,4,0],[143,3,4,0],[144,3,4,0],[143,2,4,0],[144,2,4,0],[145,3,4,0],[145,2,4,0],[28,12,3,50],[29,12,3,50],[30,12,3,50],[31,12,3,50],[32,12,3,50],[27,11,0,7],[34,10,4,0],[34,11,4,0],[35,9,4,0],[35,10,4,0],[35,11,4,0],[38,9,4,0],[38,10,4,0],[38,11,4,0],[39,9,4,0],[39,10,4,0],[39,11,4,0],[38,6,4,0],[38,7,4,0],[38,8,4,0],[39,6,4,0],[39,7,4,0],[39,8,4,0],[34,6,4,0],[34,7,4,0],[34,8,4,0],[35,6,4,0],[35,7,4,0],[35,8,4,0],[36,6,4,0],[37,6,4,0],[36,12,3,50],[37,12,3,50],[36,10,4,0],[36,11,4,0],[37,10,4,0],[37,11,4,0],[37,9,2,3],[36,9,2,3],[38,5,4,0],[39,5,4,0],[34,5,4,0],[35,5,4,0],[36,5,4,0],[37,5,4,0],[32,10,4,0],[32,11,4,0],[33,10,4,0],[33,11,4,0],[40,10,4,0],[40,11,4,0],[41,10,4,0],[41,11,4,0],[30,11,3,50],[30,10,3,50],[30,9,3,50],[30,8,3,50],[40,8,4,0],[40,9,4,0],[41,8,4,0],[41,9,4,0],[40,5,4,0],[40,6,4,0],[41,5,4,0],[41,6,4,0],[40,7,4,0],[41,7,4,0],[32,8,4,0],[32,9,4,0],[33,8,4,0],[33,9,4,0],[32,5,4,0],[32,6,4,0],[33,5,4,0],[33,6,4,0],[32,7,4,0],[33,7,4,0],[48,11,0,1],[46,9,2,0],[47,9,2,0],[48,9,2,0],[49,9,2,0],[48,8,0,2],[56,12,3,50],[57,12,3,50],[56,10,4,0],[56,11,4,0],[57,10,4,0],[57,11,4,0],[57,9,2,3],[56,9,2,3],[54,10,4,0],[54,11,4,0],[55,10,4,0],[55,11,4,0],[54,8,4,0],[54,9,4,0],[55,8,4,0],[55,9,4,0],[54,12,3,50],[53,12,3,50],[55,12,3,50],[60,8,2,2],[63,7,2,2],[66,7,2,2],[69,8,3,0],[70,8,3,0],[71,8,3,0],[72,9,3,50],[73,9,3,50],[72,8,4,0],[73,8,4,0],[74,10,3,50],[75,10,3,50],[74,9,4,0],[75,9,4,0],[76,11,3,50],[77,11,3,50],[76,10,4,0],[77,10,4,0],[78,12,3,50],[79,12,3,50],[78,11,4,0],[79,11,4,0],[80,13,3,50],[81,13,3,50],[80,12,4,0],[81,12,4,0],[72,6,4,0],[72,7,4,0],[73,6,4,0],[73,7,4,0],[74,7,4,0],[74,8,4,0],[75,7,4,0],[75,8,4,0],[72,4,4,0],[72,5,4,0],[73,4,4,0],[73,5,4,0],[72,3,4,0],[73,3,4,0],[82,13,3,50],[83,13,3,50],[82,12,4,0],[83,12,4,0],[84,13,3,50],[85,13,3,50],[84,12,4,0],[85,12,4,0],[88,13,3,50],[89,13,3,50],[90,13,3,50],[91,13,3,50],[82,11,4,0],[83,11,4,0],[84,11,4,0],[85,11,4,0],[80,11,4,0],[81,11,4,0],[78,10,4,0],[79,10,4,0],[76,9,4,0],[77,9,4,0],[68,8,3,0],[89,11,2,3],[90,11,2,3],[89,8,2,3],[90,8,2,3],[93,6,3,50],[94,6,3,50],[93,7,3,50],[94,7,3,50],[93,8,3,50],[94,8,3,50],[93,9,3,50],[94,9,3,50],[93,10,3,50],[94,10,3,50],[93,11,3,50],[94,11,3,50],[93,5,3,50],[94,5,3,50],[97,14,3,50],[98,14,3,50],[97,13,4,0],[98,13,4,0],[99,14,3,50],[100,14,3,50],[99,13,4,0],[100,13,4,0],[101,14,3,50],[102,14,3,50],[101,13,4,0],[102,13,4,0],[103,14,3,50],[104,14,3,50],[103,13,4,0],[104,13,4,0],[97,12,3,50],[100,12,3,50],[101,12,3,50],[102,12,3,50],[103,12,3,50],[104,11,3,50],[97,11,3,50],[97,10,3,50],[97,9,3,50],[97,8,3,50],[97,7,3,50],[97,6,3,50],[97,5,3,50],[97,4,3,50],[97,3,3,50],[105,14,3,50],[106,14,3,50],[106,13,3,50],[107,13,3,50],[107,12,3,50],[108,12,3,50],[108,11,3,50],[109,11,3,50],[109,10,3,50],[110,10,3,50],[110,9,3,50],[111,9,3,50],[111,8,3,50],[112,8,3,50],[112,7,3,50],[113,7,3,50],[113,6,3,50],[114,6,3,50],[114,5,3,50],[115,5,3,50],[104,10,3,50],[105,10,3,50],[105,9,3,50],[106,9,3,50],[106,8,3,50],[107,8,3,50],[107,7,3,50],[108,7,3,50],[108,6,3,50],[109,6,3,50],[109,5,3,50],[110,5,3,50],[110,4,3,50],[111,4,3,50],[111,3,3,50],[112,3,3,50],[103,11,3,50],[104,12,4,0],[105,12,4,0],[106,12,4,0],[106,11,4,0],[107,11,4,0],[107,10,4,0],[108,10,4,0],[106,10,4,0],[105,11,4,0],[107,9,4,0],[108,9,4,0],[108,8,4,0],[109,8,4,0],[109,7,4,0],[110,7,4,0],[110,6,4,0],[111,6,4,0],[111,5,4,0],[112,5,4,0],[112,4,4,0],[113,4,4,0],[109,9,4,0],[110,8,4,0],[112,6,4,0],[113,5,4,0],[116,5,3,50],[117,5,3,50],[118,5,3,50],[119,5,3,50],[119,6,3,50],[120,6,3,50],[114,4,4,0],[115,4,4,0],[113,3,4,0],[114,3,4,0],[115,3,4,0],[116,3,4,0],[117,3,4,0],[118,3,4,0],[119,3,4,0],[116,4,4,0],[117,4,4,0],[120,4,4,0],[121,6,4,0],[120,7,3,50],[121,7,3,50],[121,8,3,50],[122,8,3,50],[122,9,3,50],[123,9,3,50],[123,10,3,50],[124,10,3,50],[124,11,3,50],[125,11,3,50],[125,12,3,50],[126,12,3,50],[126,13,3,50],[127,13,3,50],[127,14,3,50],[128,14,3,50],[121,5,4,0],[122,6,4,0],[123,7,4,0],[124,8,4,0],[126,10,4,0],[127,11,4,0],[127,12,4,0],[128,12,4,0],[128,13,4,0],[133,13,4,0],[122,7,4,0],[129,14,3,50],[130,14,3,50],[131,14,3,50],[132,14,3,50],[133,14,3,50],[134,14,3,50],[135,14,3,50],[136,14,3,50],[137,14,3,50],[138,14,3,50],[121,4,3,50],[122,4,3,50],[120,3,3,50],[121,3,3,50],[123,6,3,50],[124,6,3,50],[122,5,3,50],[123,5,3,50],[125,8,3,50],[126,8,3,50],[124,7,3,50],[125,7,3,50],[127,10,3,50],[128,10,3,50],[126,9,3,50],[127,9,3,50],[123,8,4,0],[125,10,4,0],[125,9,4,0],[128,11,3,50],[129,11,3,50],[129,12,3,50],[130,12,3,50],[134,13,4,0],[131,13,4,0],[132,13,4,0],[135,13,4,0],[131,12,3,50],[132,12,3,50],[133,12,3,50],[134,12,3,50],[135,12,3,50],[136,12,3,50],[137,12,3,50],[136,13,4,0],[137,13,4,0],[138,13,4,0],[139,14,3,50],[140,14,3,50],[141,14,3,50],[142,14,3,50],[143,14,3,50],[144,14,3,50],[145,14,3,50],[146,14,3,50],[147,14,3,50],[148,14,3,50],[149,14,3,50],[139,10,3,50],[144,7,2,2],[144,10,2,2],[144,11,2,2],[126,11,4,0],[139,9,3,50],[139,8,3,50],[139,7,3,50],[139,6,3,50],[139,5,3,50],[139,4,3,50],[139,3,3,50],[142,1,3,50],[146,1,3,50],[146,0,3,50],[142,0,3,50],[145,1,4,0],[143,1,4,0],[144,6,2,2],[144,4,2,2],[95,14,3,50],[96,14,3,50],[95,13,4,0],[96,13,4,0],[98,12,3,50],[99,12,3,50],[111,7,0,90],[105,13,0,90],[118,4,0,90],[119,4,0,90],[120,5,0,90],[124,9,0,90],[129,13,0,90],[130,13,0,90]];

			InitGrid();
		}
	}
}