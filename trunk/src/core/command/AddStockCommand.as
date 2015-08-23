package core.command
{
	import core.model.stock.StockProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class AddStockCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			var o:Object = notification.getBody();
			if (o == null) return;
			var stockID:String = o.toString();
			var proxy:StockProxy = facade.retrieveProxy(StockProxy.NAME) as StockProxy;
			proxy.addStock(stockID);
			proxy = null;
		}
	}
}