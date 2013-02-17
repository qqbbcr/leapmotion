// com.adam.utils.Away3DWorld// Adam Riggs//package com.app.view {	import com.adam.events.MuleEvent;	import com.adam.utils.Utils;		import flash.display.Sprite;
		public class Away3DWorld extends Sprite{				//vars				//objects		private var utils:Utils=Utils.instance;				//const		public const NAME:String="away3DWorld";		public const RETURNTYPE:String=NAME;				/** Storage for the singleton instance. */		private static const _instance:Away3DWorld = new Away3DWorld(Away3DWorldLock);				public function Away3DWorld(lock:Class){			// Verify that the lock is the correct class reference.			if (lock != Away3DWorldLock)			{				throw new Error("Invalid Away3DWorld access.  Use Away3DWorld.instance instead.");			} else {				init();			}		}		//*****Initialization Routines				public function init():void{			debug("init()");						initVars();			initEvents();			initObjs();		}				private function initVars():void{					}				private function initEvents():void{			utils.em.listen(NAME, onAway3DWorld);		}				private function initObjs():void{					}		//*****Core Functionality						//*****Event Handlers				private function onAway3DWorld(e:MuleEvent):void{			/*debug("onAway3DWorld()");			debug("e.data.sender=="+e.data.sender);			debug("e.data.type=="+e.data.type);*/			switch(e.data.type){												default:					debug("onAway3DWorld()");					debug("*type not found");					debug("e.data.sender=="+e.data.sender);					debug("e.data.type=="+e.data.type);				break;							}		}				//*****Gets and Sets				public static function get instance():Away3DWorld{return _instance;}		//*****Utility Functions				//**debug		private function debug(str:String):void{			utils.debug(NAME,str);		}				}//end class}//end packageclass Away3DWorldLock{}