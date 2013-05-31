//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import mockolate.received;
	import mockolate.runner.MockolateRule;

	import org.hamcrest.assertThat;

	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;

	public class ExecuteTagExtensionTest
	{

		[Rule]
		public var mockolateRule : MockolateRule = new MockolateRule();

		[Mock]
		public var dcm : IDirectCommandMap;

		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		private var context:IContext;

		[Before]
		public function before():void
		{
			context = new Context();
			context.injector.map(IDirectCommandMap).toValue(dcm);
		}

		[Test]
		public function registers_processor_with_directCommandMap() : void{
			context.install( ExecuteTagExtension );
			assertThat(dcm, received().method('addMappingProcessor'));
		}
	}
}
