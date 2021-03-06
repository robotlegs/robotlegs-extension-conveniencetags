//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags.support
{

	public class PayloadCarrierObject
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Payload(order=1)]
		public var payload1:String;

		[Payload(order=2)]
		public var payload2:Object;

		/*============================================================================*/
		/* Constructor                                                                */
		/*============================================================================*/

		public function PayloadCarrierObject(p1:String, p2:Object)
		{
			payload1 = p1;
			payload2 = p2;
		}
	}
}
