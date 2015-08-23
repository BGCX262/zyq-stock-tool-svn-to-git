package
{
	import core.command.StartUpCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class AppFacade extends Facade implements IFacade
	{
		public static function getInstance():AppFacade {
			if (instance == null) {
				instance = new AppFacade();
			}
			return instance as AppFacade;
		}
		
		public function startup(app:Object):void {
			sendNotification(Events.START_UP, app);
		}
		
		override protected function initializeController():void {
			super.initializeController();
			registerCommand(Events.START_UP, StartUpCommand);
		}
	}
}