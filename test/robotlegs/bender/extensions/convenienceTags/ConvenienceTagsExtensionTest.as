//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	import mockolate.received;
	import mockolate.runner.MockolateRule;

	import org.hamcrest.assertThat;
	import org.hamcrest.object.instanceOf;

	import robotlegs.bender.extensions.convenienceTags.impl.PayloadEventCommandMap;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	public class ConvenienceTagsExtensionTest
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		[Rule]
		public var mockolateRule:MockolateRule = new MockolateRule();

		[Mock]
		public var dcm:IDirectCommandMap;

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var context:IContext;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/

		[Before]
		public function before():void
		{
			context = new Context();
			context.injector.map(IEventDispatcher).toValue(new EventDispatcher());
			context.injector.map(IDirectCommandMap).toValue(dcm);
			context.install(ConvenienceTagsExtension);
		}

		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/

		[Test(async)]
		public function maps_PayloadEventCommandMap_as_EventCommandMap():void
		{
			context.whenInitializing(function():void {
				assertThat(context.injector.getInstance(IEventCommandMap), instanceOf(PayloadEventCommandMap));
			});
			context.initialize();
		}

		[Test]
		public function registers_processor_with_directCommandMap():void
		{
			context.whenInitializing(function():void {
				assertThat(dcm, received().method('addMappingProcessor'));
			});
			context.initialize();
		}
	}
}
