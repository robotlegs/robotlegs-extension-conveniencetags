//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadEventCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.impl.Context;

	public class PayloadTagExtensionTest
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var context:Context;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before]
		public function before():void
		{
			context = new Context();
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test(async)]
		public function maps_PayloadEventCommandMap_as_EventCommandMap():void
		{
			context.install(PayloadTagExtension);
			context.afterInitializing(function():void{
				assertThat(context.injector.getInstance(IEventCommandMap), instanceOf(PayloadEventCommandMap));
			});
		}
	}
}
