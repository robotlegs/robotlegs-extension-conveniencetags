# ConvenienceTagsExtension

## Overview

The ConvenienceTagsExtension introduces two new metadata-tags:

1. `[Execute]`: marks a method as executable by the command maps
2. `[Payload]`: marks an event member as payload for commands

## Basic usage of `[Execute]`

	//SomeService.as
	[Execute]
	public function doSomething():void{
		//here be code
	}

	//BootstrapControllerConfig.as
	[Inject]
	public var directCommandMap:IDirectCommandMap;

	directCommandMap.map(SomeService).execute(); //SomeService#doSomething will be called

## Basic usage of `[Payload]`

	//FooEvent.as
	[Payload]
	public var foo:Foo;

	public function FooEvent(type:String, foo:Foo)
	{
		this.foo = foo;
		super(type, bubbles, cancelable);
	}
	
	//Baz.as
	[Execute]
	public function doSomethingWithFoo(foo:Foo):void{
		//here be code
	}
	
	//BootstrapControllerConfig
	[Inject]
	public var eventCommandMap : IEventCommandMap;
	
	eventCommandMap.map(FooEvent).toCommand(Foo);
	
	//Somewhere in the vast code space...
	eventDispatcher.dispatchEvent( new FooEvent(FooEvent.FOO, new Foo()));
	
`Baz#doSomethingWithFoo` will receive the `Foo` instance that was passed to the `FooEvent` constructor.

## Requirements

This extension requires no other extensions.

## Extension Installation

    _context = new Context()
    	.install(ConvenienceTagsExtension);

This extension requires no configuration.
