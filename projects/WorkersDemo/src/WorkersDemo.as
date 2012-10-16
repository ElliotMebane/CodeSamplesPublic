package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.MessageChannel;
	import flash.system.Worker;
	import flash.system.WorkerDomain;

	public class WorkersDemo extends Sprite
	{

		private var worker:Worker;
		private var wtm:MessageChannel;

		private var mtw:MessageChannel;
		public function WorkersDemo()
		{
			
			worker = WorkerDomain.current.createWorker(Workers.CustomWorker);
			
			wtm = worker.createMessageChannel(Worker.current);
			mtw = Worker.current.createMessageChannel(worker);
			
			worker.setSharedProperty("wtm", wtm);
			worker.setSharedProperty("mtw", mtw);
			
			wtm.addEventListener(Event.CHANNEL_MESSAGE, onMessage)
				
			trace ("s: " + worker.state);
			worker.start();
			trace ("s: " + worker.state);
		}
		
		protected function onMessage(aEvent:Event):void
		{
			trace ("onMessage : " + wtm.receive());
			
			
		}
	}
}











