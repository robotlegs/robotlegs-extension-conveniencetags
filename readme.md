# ConvenienceTagsExtension

## Overview

The ConvenienceTagsExtension introduces two new metadata-tags:

1. `[Execute]`: marks a method as executable by the command maps
2. `[Payload]`: marks an event member as payload for commands

## Some background

Commands are a very important part in RL, but sometimes you end up with __LOTS__ of them. In my projects I usually have many commands that do one thing only: retrieve a service instance and pass event payload values to the service method it calls. With RLv2 we've been aiming to allow for a more lenient setup, where "commands" no longer need to implement a `execute` method (i.e. they don't have to be _real_ commands anymore). When mapping a class as a command you can configure which method will be used in execution:

	//FooCommand.as
	public function doStuff():void{
	    //do stuff
	}
	
	//BootstrapControllerConfig.as
	eventCommandMap.map(FooEvent.FOO)
		.toCommand(FooCommand).withExecuteMethod('doStuff');

This allows us to map single access point services as a command directly.
However, by default the Event Command Map maps the event instance triggering the command to the injector, in order to allow the command access the event payload. This means that if you want to use a service class as a command it would need to expose an injectable member for the event instance. That's pretty bad since it'll couple the service class tightly to the triggering event.

The ConvenienceTagsExtension aims to solve the event payload passing, alleviate the configuration of execute methods and speed up the wiring of classes as commands.

## Basic usage of `[Execute]`

	//SomeService.as
	[Execute]
	public function doSomething():void{
		//here be code
	}

	//BootstrapControllerConfig.as
	eventCommandMap.map(FooEvent.FOO).toCommand(SomeService); 
	
	//someplace in your code
	dispatcher.dispatchEvent(new FooEvent(FooEvent.Foo)); //SomeService#doSomething will be called

## Basic usage of `[Payload]`

	//FooEvent.as
	[Payload]
	public var foo:Foo;

	public function FooEvent(type:String, foo:Foo)
	{
		this.foo = foo;
		super(type);
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
	
`Baz#doSomethingWithFoo` will be called and receive the `Foo` instance (that was passed to the `FooEvent` constructor) as a parameter value.

N.B.: the payload values will also be mapped for injection.

## Ordering payload values

By default payloads are registered and passed to the execute method in the order the metadata tag parser encounters them.

	[Payload]
	public var foo:Foo;
	
	[Payload]
	public var qux:Qux;
	
will be passed to the execute method as `foo, qux`. However it could be the execute method accepts them in a different order: `qux` first and `foo` second. If that's the case you can declare the order of the payloads with the `order` metadata tag attribute:

	[Payload(order=2)]
	public var foo:Foo;
	
	[Payload(order=1)]
	public var qux:Qux;

will be passed to the execute method as `qux, foo`.

## Requirements

This extension requires no other extensions, but will plug into the Event Command Map and/or Direct Command Map if they're present.

## Extension Installation

    _context = new Context()
    	.install(ConvenienceTagsExtension);

## Compiler arguments

By default the compiler strips all metadata tags it doesn't know when creating a release build, 
you need to add these compiler arguments to prevent this from happening with the `[Execute]` and `[Payload]` tags:

```shell
-keep-as3-metadata+=Execute
-keep-as3-metadata+=Payload
```
