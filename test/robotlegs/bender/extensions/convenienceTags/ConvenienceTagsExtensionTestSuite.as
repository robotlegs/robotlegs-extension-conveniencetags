//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import robotlegs.bender.extensions.convenienceTags.impl.ExecuteMethodConfiguratorTest;
	import robotlegs.bender.extensions.convenienceTags.impl.FieldPayloadExtractionPointTest;
	import robotlegs.bender.extensions.convenienceTags.impl.MethodPayloadExtractionPointTest;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadCollectorTest;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadDescriptionTest;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadEventCommandMapTest;

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class ConvenienceTagsExtensionTestSuite
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var executeTagExtension:ConvenienceTagsExtensionTest;

		public var executeMethodConfigurator:ExecuteMethodConfiguratorTest;

		public var fieldPayloadExtractionPoint:FieldPayloadExtractionPointTest;

		public var methodPayloadExtractionPoint:MethodPayloadExtractionPointTest;

		public var payloadCollector:PayloadCollectorTest;

		public var payloadDescription:PayloadDescriptionTest;

		public var payloadEventCommandMap:PayloadEventCommandMapTest;
	}
}
