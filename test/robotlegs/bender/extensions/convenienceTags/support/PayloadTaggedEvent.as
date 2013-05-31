//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags.support
{
	import flash.events.Event;

	public class PayloadTaggedEvent extends Event
	{

		/*============================================================================*/
		/* Public Static Properties                                                   */
		/*============================================================================*/

		public static const TYPE:String = 'type';

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Payload(order=2)]
		public var payloadInstance:IPayload;

		[Payload(order=1)]
		public var payloadString:String;

		[Payload(order=3)]
		public var payloadObject:Object;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		public function PayloadTaggedEvent(type:String, payloadInstance:IPayload, payloadString:String, payloadObject:Object)
		{
			this.payloadInstance = payloadInstance;
			this.payloadString = payloadString;
			this.payloadObject = payloadObject;
			super(type, bubbles, cancelable);
		}

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		override public function clone():Event
		{
			return new PayloadTaggedEvent(type, payloadInstance, payloadString, payloadObject);
		}
	}
}
