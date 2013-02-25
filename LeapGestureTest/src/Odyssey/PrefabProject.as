//Generated by Prefab3D 2.141, Sun Feb 24 22:41:21 GMT-0500 2013. www.closier.nl/prefab

//For educational purpose, this class demonstrates how to use Prefab3D's exports, (AS3, guys API, lights etc...)
//and the way they could be implemented into your project.

package 
{
	//[SWF(width="800", height="600", frameRate="60")]

	import Odyssey;

	import away3d.containers.View3D;
	import away3d.cameras.Camera3D;
	import away3d.cameras.lenses.PerspectiveLens;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	public class PrefabProject extends Sprite
	{
		private var _view : View3D;
		private var _prefabOutput:Odyssey;
		private var _camera:Camera3D;

		public function PrefabProject() {
			addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.showDefaultContextMenu = true;
			stage.stageFocusRect = false;

			initView();
			stage.addEventListener(Event.RESIZE, onResize);
			initContent();
			addEventListener(Event.ENTER_FRAME, renderFrame);
		}

		private function initView():void
		{
			_view = new View3D();
			_view.antiAlias = 2;
			_view.backgroundColor = 0x222222;

			_camera = _view.camera;
			_camera.lens = new PerspectiveLens();
			_camera.lens.near = 10;
			_camera.lens.far = 50000;

			_camera.x = 3236.838134765625;
			_camera.y = 1749.6380615234375;
			_camera.z = -1509.3624267578125;

			addChild(_view);
		}

		private function initContent():void
		{
			_prefabOutput = new Odyssey();
			_view.scene.addChild(_prefabOutput);
			_camera.lookAt(_prefabOutput.position);

		}

		public function renderFrame(e:Event):void
		{
			 _view.render();
		}

		private function onResize(event:Event):void
		{
			_view.width = stage.stageWidth;
			_view.height = stage.stageHeight;
		}

	}
}