# ExecuteTagExtension

## Overview

The ExecuteTagExtension uses `Execute`-tagged methods as the `execute`-method of commands.

## Basic usage

	//Foo.as
	[Execute]
	public function doFoo():void{
		//here be code
	}

	[Inject]
	public var directCommandMap:IDirectCommandMap;

	directCommandMap.map(Foo).execute(); //Foo#doFoo will be called

## Requirements

This extension requires the following extensions:

+ DirectCommandMapExtension

## Extension Installation

    _context = new Context()
    	.install(DirectCommandMapExtension, ExecuteTagExtension);

This extension requires no configuration.