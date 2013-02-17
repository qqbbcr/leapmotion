// com.adam.utils.LeapController// Adam Riggs//package com.app.controller{	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.leapmotion.leap.Finger;	import com.leapmotion.leap.Frame;	import com.leapmotion.leap.Hand;	import com.leapmotion.leap.LeapMotion;	import com.leapmotion.leap.Pointable;	import com.leapmotion.leap.Tool;	import com.leapmotion.leap.Vector3;	import com.leapmotion.leap.events.LeapEvent;	import com.leapmotion.leap.util.LeapMath;
		public class LeapController {				//vars		protected var _active:Boolean;				//objects		private var utils:Utils=Utils.instance;		private var _leap:LeapMotion;		protected var _frame:Frame;		protected var _hands:Vector.<Hand>;		protected var _fingers:Vector.<Finger>;		protected var _tools:Vector.<Tool>;		protected var _pointables:Vector.<Pointable>;				//const		public const NAME:String="leapController";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:LeapController = new LeapController(LeapControllerLock);				public function LeapController(lock:Class){			if (lock != LeapControllerLock)			{				throw new Error("Invalid LeapController access.  Use LeapController.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{			_active=false;		}				private function initEvents():void{			utils.em.listen(NAME, onLeapController);		}				private function initObjs():void{			_leap=new LeapMotion();			_leap.controller.addEventListener( LeapEvent.LEAPMOTION_INIT, onInit );			_leap.controller.addEventListener( LeapEvent.LEAPMOTION_CONNECTED, onConnect );			_leap.controller.addEventListener( LeapEvent.LEAPMOTION_DISCONNECTED, onDisconnect );			_leap.controller.addEventListener( LeapEvent.LEAPMOTION_EXIT, onExit );			_leap.controller.addEventListener( LeapEvent.LEAPMOTION_FRAME, onFrame );		}		//*****Core Functionality						//*****Event Handlers								private function onInit( event:LeapEvent ):void{			debug( "Initialized" );			_active=false;		}				private function onConnect( event:LeapEvent ):void{			debug( "Connected" );			_active=true;		}				private function onDisconnect( event:LeapEvent ):void{			debug( "Disconnected" );			_active=false;		}				private function onExit( event:LeapEvent ):void{			debug( "Exited" );			_active=false;		}				private function onFrame( event:LeapEvent ):void		{			//debug("onFrame");			// Get the most recent _frame and report some basic information			_frame = event.frame;			_hands = _frame.hands;			_fingers = _frame.fingers;			_tools=_frame.tools;			_pointables=_frame.pointables;			//debug( "Frame id: " + _frame.id + ", timestamp: " + _frame.timestamp + ", hands: " + _frame.hands.length + ", fingers: " + _frame.fingers.length + ", tools: " + _frame.tools.length );			//			if ( _frame.hands.length > 0 )//			{								// Get the first hand//				var hand:Hand = _frame.hands[ 0 ];//				//				// Check if the hand has any fingers//				var fingers:Vector.<Finger> = hand.fingers;//				if ( !fingers.length == 0 )//				{//					// Calculate the hand's average finger tip position//					var avgPos:Vector3 = Vector3.zero();//					for each ( var finger:Finger in fingers )//					avgPos = avgPos.plus( finger.tipPosition );//					//					avgPos = avgPos.divide( fingers.length );//					//debug( "Hand has " + fingers.length + " fingers, average finger tip position: " + avgPos );//				}				//				// Get the hand's sphere radius and palm position//				debug( "Hand sphere radius: " + hand.sphereRadius + " mm, palm position: " + hand.palmPosition );//				//				// Get the hand's normal vector and direction//				var normal:Vector3 = hand.palmNormal;//				var direction:Vector3 = hand.direction;//				//				// Calculate the hand's pitch, roll, and yaw angles//				debug( "Hand pitch: " + LeapMath.toDegrees( direction.pitch ) + " degrees, " + "roll: " + LeapMath.toDegrees( normal.roll ) + " degrees, " + "yaw: " + LeapMath.toDegrees( direction.yaw ) + " degrees\n" );//				//			//			} 		}				private function onLeapController(e:MuleEvent):void{			/*debug("onLeapController()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){																default:					debug("onLeapController()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():LeapController{return _instance;}				public function get frame():Frame{return _frame;}		public function get hands():Vector.<Hand>{return _hands;}		public function get fingers():Vector.<Finger>{return _fingers;}		public function get tools():Vector.<Tool>{return _tools;}		public function get pointables():Vector.<Pointable>{return _pointables;}		public function get active():Boolean{return _active;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass LeapControllerLock{}