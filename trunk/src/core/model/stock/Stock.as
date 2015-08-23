package core.model.stock
{
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	public class Stock
	{
		private const STOCK_SERVER:String = "http://hq.sinajs.cn/list=";
		
		public var data:StockVo;
		private var callBack:Function;
		private var loader:URLStream;
		
		public function Stock(id:String, callBack:Function)
		{
			super();
			
			data = new StockVo(id);
			
			this.callBack = callBack;
			
			loader = new URLStream();
			loader.addEventListener(Event.COMPLETE, onComplete);
		}
		
		public function update():void {
			loader.load(new URLRequest(STOCK_SERVER + data.head + data.id));
		}
		
		private function onComplete(e:Event):void {
			decode(loader.readMultiByte(loader.bytesAvailable, "gb2312"));
		}
		
		private function decode(data:String):void {
			var arr:Array = String(data.split("\"")[1]).split(",");
			this.data.name = arr[0];
			this.data.price = arr[3];
			
			callBack(this.data.id);
		}
	}
}