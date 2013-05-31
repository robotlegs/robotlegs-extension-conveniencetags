//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package
{
	import robotlegs.bender.extensions.convenienceTags.ExecuteTagExtensionTestSuite;
	import robotlegs.bender.extensions.convenienceTags.PayloadTagExtensionTestSuite;

	[RunWith("org.flexunit.runners.Suite")]
	[Suite]
	public class EntireTestSuite
	{

		/*============================================================================*/
		/* Public Properties                                                          */
		/*============================================================================*/

		public var executeTagExtensionTestSuite:ExecuteTagExtensionTestSuite;

		public var payloadTagExtensionTestSuite:PayloadTagExtensionTestSuite;
	}
}
