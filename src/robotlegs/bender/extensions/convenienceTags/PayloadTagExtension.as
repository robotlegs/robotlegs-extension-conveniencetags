//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.extensions.convenienceTags.impl.PayloadEventCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;

	public class PayloadTagExtension implements IExtension
	{

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function extend(context:IContext):void
		{
			const injector:Injector = context.injector;
			injector.map(IEventCommandMap).toType(PayloadEventCommandMap);
		}
	}
}
