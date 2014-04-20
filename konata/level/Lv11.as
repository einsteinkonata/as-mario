package konata.level  
{
	import konata.config.CGame;
	
	public class Lv11 extends LevelBase 
	{
		
		public function Lv11() 
		{
			W = 150;
			H = 7;
			map =  [[26,3,1,0],[28,3,1,0],[27,0,3,11],[31,5,0,1,1],[40,3,0,1,1],[90,4,1,0],[91,4,1,0],[86,4,1,0],[87,4,1,0],[53,0,0,90],[56,0,0,90],[55,0,0,90],[60,0,0,90],[60,1,0,2],[66,0,0,90],[68,0,0,90],[57,0,0,90],[58,0,0,90],[49,5,0,1],[69,2,0,1],[54,2,2,0],[56,1,2,0],[142,2,0,99],[27,3,1,0],[30,4,0,90],[31,3,0,90],[32,3,0,90],[37,2,0,90],[38,2,0,90],[39,2,0,90],[40,2,0,90],[57,1,2,0],[59,2,2,0],[60,2,2,0],[53,2,2,0],[65,3,2,0],[66,3,2,0],[67,3,2,0],[68,3,2,0],[69,3,2,0],[72,3,0,7],[77,1,0,90],[78,0,0,90],[79,0,0,90],[80,1,0,90],[88,4,2,0],[89,4,2,0],[90,3,0,1],[89,1,1,0],[89,0,0,7],[105,4,0,90],[105,2,0,90],[103,2,0,90],[103,4,0,90],[108,0,0,1],[110,1,0,1],[118,2,0,90],[118,1,0,90],[118,0,0,90],[125,3,0,90],[127,2,0,90],[129,1,0,90],[131,2,0,90],[133,3,0,90],[130,5,0,1],[133,5,0,1],[15,6,3,50],[14,6,3,50],[13,6,3,50],[12,6,3,50],[11,6,3,50],[10,6,3,50],[9,6,3,50],[8,6,3,50],[7,6,3,50],[6,6,3,50],[5,6,3,50],[4,6,3,50],[3,6,3,50],[2,6,3,50],[1,6,3,50],[0,6,3,50],[0,5,3,50],[0,4,3,50],[31,6,3,50],[30,6,3,50],[29,6,3,50],[28,6,3,50],[27,6,3,50],[26,6,3,50],[25,6,3,50],[24,6,3,50],[23,6,3,50],[22,6,3,50],[21,6,3,50],[20,6,3,50],[19,6,3,50],[18,6,3,50],[17,6,3,50],[16,6,3,50],[47,6,3,50],[46,6,3,50],[45,6,3,50],[44,6,3,50],[43,6,3,50],[42,6,3,50],[41,6,3,50],[40,6,3,50],[39,6,3,50],[38,6,3,50],[37,6,3,50],[36,6,3,50],[35,6,3,50],[34,6,3,50],[33,6,3,50],[32,6,3,50],[45,5,3,50],[44,5,3,50],[43,5,3,50],[42,5,3,50],[41,5,3,50],[40,5,3,50],[39,5,3,50],[38,5,3,50],[37,5,3,50],[36,5,3,50],[35,5,3,50],[34,5,3,50],[33,5,3,50],[32,5,3,50],[40,4,3,50],[39,4,3,50],[38,4,3,50],[37,4,3,50],[50,6,3,50],[49,6,3,50],[48,6,3,50],[66,6,3,50],[65,6,3,50],[64,6,3,50],[63,6,3,50],[62,6,3,50],[61,6,3,50],[60,6,3,50],[59,6,3,50],[58,6,3,50],[57,6,3,50],[56,6,3,50],[55,6,3,50],[54,6,3,50],[53,6,3,50],[52,6,3,50],[51,6,3,50],[62,5,3,50],[61,5,3,50],[60,5,3,50],[59,5,3,50],[58,5,3,50],[57,5,3,50],[56,5,3,50],[55,5,3,50],[54,5,3,50],[53,5,3,50],[52,5,3,50],[73,6,3,50],[72,6,3,50],[71,6,3,50],[70,6,3,50],[69,6,3,50],[68,6,3,50],[67,6,3,50],[73,5,3,50],[72,5,3,50],[73,4,3,50],[72,4,3,50],[77,6,3,50],[76,6,3,50],[75,6,3,50],[74,6,3,50],[77,5,3,50],[76,5,3,50],[77,4,3,50],[76,4,3,50],[81,6,3,50],[80,6,3,50],[81,4,3,50],[80,4,3,50],[84,6,3,50],[83,6,3,50],[82,6,3,50],[100,6,3,50],[99,6,3,50],[98,6,3,50],[97,6,3,50],[96,6,3,50],[95,6,3,50],[94,6,3,50],[93,6,3,50],[92,6,3,50],[91,6,3,50],[90,6,3,50],[89,6,3,50],[88,6,3,50],[87,6,3,50],[86,6,3,50],[85,6,3,50],[103,6,3,50],[102,6,3,50],[101,6,3,50],[119,6,3,50],[118,6,3,50],[117,6,3,50],[116,6,3,50],[115,6,3,50],[114,6,3,50],[113,6,3,50],[112,6,3,50],[111,6,3,50],[110,6,3,50],[109,6,3,50],[108,6,3,50],[107,6,3,50],[106,6,3,50],[105,6,3,50],[104,6,3,50],[100,5,3,50],[99,5,3,50],[98,5,3,50],[97,5,3,50],[96,5,3,50],[101,5,3,50],[100,4,3,50],[99,4,3,50],[98,4,3,50],[101,4,3,50],[100,3,3,50],[99,3,3,50],[98,3,3,50],[101,3,3,50],[100,2,3,50],[101,2,3,50],[100,1,3,50],[101,1,3,50],[123,6,3,50],[122,6,3,50],[121,6,3,50],[120,6,3,50],[126,6,3,50],[125,6,3,50],[124,6,3,50],[142,6,3,50],[141,6,3,50],[140,6,3,50],[139,6,3,50],[138,6,3,50],[137,6,3,50],[136,6,3,50],[135,6,3,50],[134,6,3,50],[133,6,3,50],[132,6,3,50],[131,6,3,50],[130,6,3,50],[129,6,3,50],[128,6,3,50],[127,6,3,50],[149,6,3,50],[148,6,3,50],[147,6,3,50],[146,6,3,50],[145,6,3,50],[144,6,3,50],[143,6,3,50],[119,4,3,50],[118,4,3,50],[117,4,3,50],[104,1,3,50],[103,1,3,50],[102,1,3,50],[105,1,3,50],[104,0,3,50],[103,0,3,50],[102,0,3,50],[105,0,3,50],[106,1,3,50],[106,0,3,50],[107,2,3,50],[107,1,3,50],[108,2,3,50],[108,1,3,50],[109,3,3,50],[109,2,3,50],[110,3,3,50],[110,2,3,50],[111,4,3,50],[111,3,3,50],[112,4,3,50],[112,3,3,50],[85,4,3,19],[88,1,1,0],[92,4,3,19],[80,5,1,0],[81,5,1,0]];

			
			InitGrid();
		}
	}
}