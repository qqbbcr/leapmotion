// com.adam.utils.LeapStatistics// Adam Riggs//package com.app.view{	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;	import com.app.controller.LeapController;	import com.leapmotion.leap.Finger;	import com.leapmotion.leap.Frame;	import com.leapmotion.leap.Hand;	import com.leapmotion.leap.Pointable;	import com.leapmotion.leap.Tool;		import flash.display.Sprite;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;
		public class LeapStatistics extends Sprite{				//vars				//objects		private var utils:Utils=Utils.instance;		protected var _lc:LeapController;				protected var _basicTf:TextField;		protected var _handTf:TextField;		protected var _fingerTf:TextField;				protected var _frame:Frame;		protected var _hands:Vector.<Hand>;		protected var _fingers:Vector.<Finger>;		protected var _tools:Vector.<Tool>;		protected var _pointables:Vector.<Pointable>;				//const		public const NAME:String="leapStatistics";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:LeapStatistics = new LeapStatistics(LeapStatisticsLock);				public function LeapStatistics(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != LeapStatisticsLock)			{				throw new Error("Invalid LeapStatistics access.  Use LeapStatistics.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onLeapStatistics);		}				private function initObjs():void{			_lc=LeapController.instance;						_basicTf=new TextField();			makeTextField(_basicTf);			_handTf=new TextField();			makeTextField(_handTf);			_fingerTf=new TextField();			makeTextField(_fingerTf);						_basicTf.htmlText=				"hands:\t\t0\n"+				"fingers:\t\t0\n"+				"tools:\t\t0\n"+				"pointables:\t0\n";			_basicTf.autoSize=TextFieldAutoSize.LEFT;						_handTf.htmlText=				"hands[0]\n\n"+								"id:\t\t\t0\n\n"+								"fingers:\t\t0\n"+				"tools:\t\t0\n"+				"pointables:\t0\n\n"+								"scaleFactor:\t0\n\n"+								"direction:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n"+							"palmNormal:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n"+								"palmPosition:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n"+								"palmVelocity:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n"+								"sphereRadius:\t0\n"+								"sphereCenter:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n";						_handTf.y=_basicTf.height;			_handTf.width=250;			_handTf.height=650;							_fingerTf.htmlText=				"fingers[0]\n\n"+				"id:\t0\n"+				"isFinger:\t0\n"+				"isTool:\t0\n"+				"length:\t0\n"+				"width:\t0\n\n"+								"direction:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n"+								"tipPostition:\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n"+								"tipVelocity\n"+				"\tx:\t\t\t0\n"+				"\ty:\t\t\t0\n"+				"\tz:\t\t\t0\n"+				"\txpitch:\t\t0\n"+				"\troll:\t\t\t0\n"+				"\tyaw:\t\t\t0\n\n";						_fingerTf.y=_basicTf.height;			_fingerTf.x=_handTf.width;			_fingerTf.width=250;			_fingerTf.height=450;									}		//*****Core Functionality				protected function makeTextField(tf:TextField):void{			addChild(tf);			tf.backgroundColor=0xFFFFFF;			tf.border=true;		}				public function update():void{			//debug("update()");						if(visible&&_lc.active){				//debug("inside");				_frame=_lc.frame;				_hands=_frame.hands;				_fingers=_frame.fingers;				_tools=_frame.tools;				_pointables=_frame.pointables;												_basicTf.htmlText=					"hands:\t\t"+_hands.length+"\n"+					"fingers:\t\t"+_fingers.length+"\n"+					"tools:\t\t"+_tools.length+"\n"+					"pointables:\t"+_pointables.length+"\n";				if(_hands.length>0){					_handTf.htmlText=						"hands[0]\n\n"+												"id:\t\t\t"+_hands[0].id+"\n\n"+						"fingers:\t\t"+_frame.fingers.length+"\n"+						"tools:\t\t"+_frame.tools.length+"\n"+						"pointables:\t"+_frame.pointables.length+"\n\n"+												"scaleFactor:\t"+_hands[0].scaleFactor+"\n\n"+												"direction:\n"+						"\tx:\t\t\t"+_hands[0].direction.x+"\n"+						"\ty:\t\t\t"+_hands[0].direction.y+"\n"+						"\tz:\t\t\t"+_hands[0].direction.z+"\n"+						"\txpitch:\t\t"+_hands[0].direction.pitch+"\n"+						"\troll:\t\t\t"+_hands[0].direction.roll+"\n"+						"\tyaw:\t\t\t"+_hands[0].direction.yaw+"\n\n"+												"palmNormal:\n"+						"\tx:\t\t\t"+_hands[0].palmNormal.x+"\n"+						"\ty:\t\t\t"+_hands[0].palmNormal.y+"\n"+						"\tz:\t\t\t"+_hands[0].palmNormal.z+"\n"+						"\txpitch:\t\t"+_hands[0].palmNormal.pitch+"\n"+						"\troll:\t\t\t"+_hands[0].palmNormal.roll+"\n"+						"\tyaw:\t\t\t"+_hands[0].palmNormal.yaw+"\n\n"+												"palmPosition:\n"+						"\tx:\t\t\t"+_hands[0].palmPosition.x+"\n"+						"\ty:\t\t\t"+_hands[0].palmPosition.y+"\n"+						"\tz:\t\t\t"+_hands[0].palmPosition.z+"\n"+						"\txpitch:\t\t"+_hands[0].palmPosition.pitch+"\n"+						"\troll:\t\t\t"+_hands[0].palmPosition.roll+"\n"+						"\tyaw:\t\t\t"+_hands[0].palmPosition.yaw+"\n\n"+												"palmVelocity:\n"+						"\tx:\t\t\t"+_hands[0].palmVelocity.x+"\n"+						"\ty:\t\t\t"+_hands[0].palmVelocity.y+"\n"+						"\tz:\t\t\t"+_hands[0].palmVelocity.z+"\n"+						"\txpitch:\t\t"+_hands[0].palmVelocity.pitch+"\n"+						"\troll:\t\t\t"+_hands[0].palmVelocity.roll+"\n"+						"\tyaw:\t\t\t"+_hands[0].palmVelocity.yaw+"\n\n"+												"sphereRadius:\t"+_hands[0].sphereRadius+"\n\n"+												"sphereCenter:\n"+						"\tx:\t\t\t"+_hands[0].sphereCenter.x+"\n"+						"\ty:\t\t\t"+_hands[0].sphereCenter.y+"\n"+						"\tz:\t\t\t"+_hands[0].sphereCenter.z+"\n"+						"\txpitch:\t\t"+_hands[0].sphereCenter.pitch+"\n"+						"\troll:\t\t\t"+_hands[0].sphereCenter.roll+"\n"+						"\tyaw:\t\t\t"+_hands[0].sphereCenter.yaw+"\n\n";									}								if(_fingers.length>0){										_fingerTf.htmlText=						"fingers[0]\n\n"+												"id:\t"+_fingers[0].id+"\n"+						"isFinger:\t"+_fingers[0].isFinger+"\n"+						"isTool:\t"+_fingers[0].isTool+"\n"+						"length:\t"+_fingers[0].length+"\n"+						"width:\t"+_fingers[0].width+"\n\n"+												"direction:\n"+						"\tx:\t\t\t"+_fingers[0].direction.x+"\n"+						"\ty:\t\t\t"+_fingers[0].direction.y+"\n"+						"\tz:\t\t\t"+_fingers[0].direction.z+"\n"+						"\txpitch:\t\t"+_fingers[0].direction.pitch+"\n"+						"\troll:\t\t\t"+_fingers[0].direction.roll+"\n"+						"\tyaw:\t\t\t"+_fingers[0].direction.yaw+"\n\n"+												"tipPosition:\n"+						"\tx:\t\t\t"+_fingers[0].tipPosition.x+"\n"+						"\ty:\t\t\t"+_fingers[0].tipPosition.y+"\n"+						"\tz:\t\t\t"+_fingers[0].tipPosition.z+"\n"+						"\txpitch:\t\t"+_fingers[0].tipPosition.pitch+"\n"+						"\troll:\t\t\t"+_fingers[0].tipPosition.roll+"\n"+						"\tyaw:\t\t\t"+_fingers[0].tipPosition.yaw+"\n\n"+												"tipVelocity\n"+						"\tx:\t\t\t"+_fingers[0].tipVelocity.x+"\n"+						"\ty:\t\t\t"+_fingers[0].tipVelocity.y+"\n"+						"\tz:\t\t\t"+_fingers[0].tipVelocity.z+"\n"+						"\txpitch:\t\t"+_fingers[0].tipVelocity.pitch+"\n"+						"\troll:\t\t\t"+_fingers[0].tipVelocity.roll+"\n"+						"\tyaw:\t\t\t"+_fingers[0].tipVelocity.yaw+"\n\n";				}			}		}				//*****Event Handlers				private function onLeapStatistics(e:MuleEvent):void{			/*debug("onLeapStatistics()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){								case "toggleVisible":					if(visible){						visible=false;					} else {						visible=true;					}					break;								default:					debug("onLeapStatistics()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():LeapStatistics{return _instance;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass LeapStatisticsLock{}