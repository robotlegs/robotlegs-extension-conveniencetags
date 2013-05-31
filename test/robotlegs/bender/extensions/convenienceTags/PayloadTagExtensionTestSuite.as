//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import robotlegs.bender.extensions.convenienceTags.impl.FieldPayloadExtractionPointTest;
	import robotlegs.bender.extensions.convenienceTags.impl.MethodPayloadExtractionPointTest;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadCollectorTest;

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class PayloadTagExtensionTestSuite
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var payloadTagExtension:PayloadTagExtensionTest
		public var fieldPayloadExtractionPoint:FieldPayloadExtractionPointTest
		public var methodPayloadExtractionPoint:MethodPayloadExtractionPointTest;
		public var payloadCollector:PayloadCollectorTest;
	}
}
