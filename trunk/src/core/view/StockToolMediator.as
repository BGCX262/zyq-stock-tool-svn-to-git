package core.view
{
	import core.command.AddStockCommand;
	import core.model.stock.StockProxy;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class StockToolMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "core.view.StockToolMediator";
		
		public function StockToolMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
		}
		
		private function get compment():StockTool {
			return this.viewComponent as StockTool;
		}
		
		override public function onRegister():void {
			initCommand();
		}
		
		private function initCommand():void {
			facade.registerCommand(Events.ADD_STOCK, AddStockCommand);
			
			
			initProxy();
		}
		
		private function initProxy():void {
			facade.registerProxy(new StockProxy());
			
			initMediator();
		}
		
		private function initMediator():void {
			sendNotification(Events.ADD_STOCK, "601988");
		}
	}
}