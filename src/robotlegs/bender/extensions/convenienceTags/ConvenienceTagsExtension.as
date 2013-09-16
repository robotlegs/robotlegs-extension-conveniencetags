//------------------------------------------------------------------------------
//  Copyright (c) 2009-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.bender.extensions.convenienceTags
{
	import robotlegs.bender.extensions.convenienceTags.impl.ExecuteMethodConfigurator;
	import robotlegs.bender.extensions.convenienceTags.impl.PayloadEventCommandMap;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IExtension;
	import robotlegs.bender.framework.api.IInjector;

	public class ConvenienceTagsExtension implements IExtension
	{

		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/

		private var _configurator:ExecuteMethodConfigurator;

		private var _injector:IInjector;

		/*============================================================================*/
		/* Public Functions                                                           */
		/*============================================================================*/

		public function extend(context:IContext):void
		{
			_injector = context.injector;
			_configurator = new ExecuteMethodConfigurator();
			if (_injector.hasMapping(IEventCommandMap)) _injector.unmap(IEventCommandMap);
			_injector.map(IEventCommandMap).toType(PayloadEventCommandMap);
			context.beforeInitializing(beforeInitializing);
		}

		/*============================================================================*/
		/* Private Functions                                                          */
		/*============================================================================*/

		private function beforeInitializing():void
		{
			_injector.hasMapping(IDirectCommandMap) && addProcessingToDirectCommandMap();
			_injector.hasMapping(IEventCommandMap) && addProcessingToEventCommandMap();
		}

		private function addProcessingToEventCommandMap():void
		{
			const eventCommandMap:IEventCommandMap = _injector.getInstance(IEventCommandMap);
			eventCommandMap.addMappingProcessor(_configurator.configureExecuteMethod);
		}

		private function addProcessingToDirectCommandMap():void
		{
			const directCommandMap:IDirectCommandMap = _injector.getInstance(IDirectCommandMap);
			directCommandMap.addMappingProcessor(_configurator.configureExecuteMethod);
		}
	}
}
