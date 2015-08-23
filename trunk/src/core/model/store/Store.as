package core.model.store
{
	import flash.data.EncryptedLocalStore;
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import mx.controls.Alert;
	
	public class Store
	{
		/**
		 * 加密的本地存储
		 * 
		 */
		public function Store()
		{
			
		}
		
		public static function reset():void {
			EncryptedLocalStore.reset();
		}
		
		/**
		 * 得到加密的本地存储
		 * @param itemName 存储项的名字
		 * @return 
		 * 
		 */
		public static function getStore(itemName:String):ByteArray {
			if (itemName == null) return null;
			
			var store:ByteArray = null;
			
			try {
				store = EncryptedLocalStore.getItem(itemName);
			} catch (e:Event) {
				Alert.show(e.toString(), "Error - getStore - EncryptedLocalStore");
			}
			
			if (store) {
				store.position = 0;
			}
			
			return store;
		}
		
		/**
		 * 存人数据
		 * @param itemName
		 * @param object
		 * 
		 */
		public static function setStore(itemName:String, object:Object):void {
			if (itemName == null || object == null) return;
			
			var bytes:ByteArray = new ByteArray();
			bytes.writeObject(object);
			
			try {
				EncryptedLocalStore.setItem(itemName, bytes);
			} catch (e:Event) {
				Alert.show(e.toString(), "Error - setStore - EncryptedLocalStore");
			}
		}
	}
}