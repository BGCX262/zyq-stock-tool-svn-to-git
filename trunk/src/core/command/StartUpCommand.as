package core.command
{
	import core.model.stock.StockProxy;
	import core.view.StockToolMediator;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartUpCommand extends SimpleCommand
	{
		override public function execute(notification:INotification):void {
			facade.registerMediator(new StockToolMediator(StockToolMediator.NAME, notification.getBody()));
		}
	}
}