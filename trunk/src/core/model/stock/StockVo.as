package core.model.stock
{
	public class StockVo
	{
		public var id:String;
		public var head:String;
		public var name:String;
		public var price:Number;
		public var priceIn:Number;
		public var num:int;
		public var fee:Number;
		
		public function StockVo(id:String)
		{
			if (id.charAt(0) == '6') {
				head = "sh";
			} else {
				head = "sz";
			}
			this.id = id;
		}
	}
}