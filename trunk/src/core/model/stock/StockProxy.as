package core.model.stock
{
	import core.model.store.Store;
	
	import flash.utils.ByteArray;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	import yq.datastruct.Map;
	
	public class StockProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "core.model.stock.StockProxy";
		
		private var _name:String;
		private var stocks:Map;
		
		public function StockProxy()
		{
			super(NAME);
		}
		
		public function addStock(id:String):Boolean {
			if (!stocks.containsKey(id)) {
				var stock:Stock = new Stock(id, onStockUpdateComplete);
				stocks.put(id, stock);
				stock.update();
				stock = null;
				
				// add success
				return true;
			}
			
			// add fail
			return false;
		}
		
		private function onStockUpdateComplete(id:String):void {
			var stock:Stock = stocks.get(id);
			Store.setStore("stocks", stocks.values());
		}
		
		override public function onRegister():void
		{
			_name = NAME;
			
			// 初始化stocks，从本地存储取数据。若没有则新建。
			stocks = new Map();
			var bytes:ByteArray = Store.getStore("stocks");
			if (bytes != null) {
				var arr:Array = bytes.readObject() as Array;
				for (var i:int = 0; i < arr.length; i++) {
					stocks.put(arr[i].data.id, arr[i].data);
				}
			}
		}
		
		override public function onRemove():void
		{
		}
	}
}