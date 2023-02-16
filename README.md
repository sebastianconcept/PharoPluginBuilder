# PharoPluginBuilder
A foundation for building your own Pharo plugins.
_____


You can use a clone of this repository for local development of a Pharo Smalltalk Plugin.

## Structure

```
┌─────────────────────────┐                                               
│   PharoPluginBuilder/   │                                               
└┬────────────────────────┘    ┌───────────────────────┐                  
 │     ┌────────────────┐      │For starting a build   │                  
 ├────▶│build.sh        │◀─────┤(once configured).     │                  
 │     └────────────────┘      └───────────────────────┘                  
 │     ┌────────────────┐      ┌─────────────────────────────┐            
 ├────▶│CMakeLists.txt  │◀──┐  │For scripting the            │            
 │     └────────────────┘   └──┤configuration of a build.    │            
 │     ┌────────────────┐      └─────────────────────────────┘            
 ├────▶│configure.sh    │◀──┐  ┌─────────────────────────────────────┐    
 │     └────────────────┘   │  │Command to configure your environment│    
 │     ┌────────────────┐   └──┤(prior to trigger a build).          │    
 ├────▶│dependencies/   │      └─────────────────────────────────────┘    
 │     └─┬──────────────┘      ┌───────────────────────────────┐          
 │       │  ┌─────────────┐    │The Pharo VM (hard requirement │          
 │       └─▶│  pharo-vm/  │◀───┤for building your plugin).     │          
 │      ... └─────────────┘    └───────────────────────────────┘          
 │       │  ┌────────────────────┐     ┌─────────────────────────────┐    
 │       └─▶│ third-party-lib-X/ │◀─┐  │Any third party lib required │    
 │          └────────────────────┘  └──┤by your plugin.              │    
 │     ┌──────┐                        └─────────────────────────────┘    
 ├────▶│dist/ │                                                           
 │     └─┬────┘                                                           
 │       │  ┌────────┐        ┌──────────────────────────────────┐        
 │       └─▶│ build/ │◀───┐   │Once built, the binaries of your  │        
 │          └────────┘    └───┤plugin, will be here.             │        
 │     ┌────┐                 └──────────────────────────────────┘        
 ├────▶│ide/│◀───────┐        ┌──────────────────────────────────────────┐
 │     └────┘        │        │This is for the Pharo image that you'll be│
 │                   └────────┤using for the Smalltalk Plugin code that  │
 │     ┌─────┐                │generates the C code i.e.: StarterPlugin  │
 └────▶│src/ │                └───────────────────────────────┬──────────┘
       └─┬───┘                                                │           
         │  ┌───────────┐                                     │           
         └─▶│generated/ │                                     │           
            └─┬─────────┘                    Generated using PharoVMMaker.
              │  ┌────┐                      You generate this once as a  
              └─▶│64/ │                      starting point. Then you     
                 └┬───┘                      develop `StarterPlugin.c`    
                  │  ┌─────────┐             further on your own. Either  
                  └─▶│plugins/ │             manually or from Slang       
                     └─┬───────┘             generating new versions, your
                       │  ┌──────┐           call.     │                  
                       └─▶│ src/ │                     │                  
                          └──────┘                     │                  
                               ┌────────────────┐      │                  
                               │ StarterPlugin/ │      │                  
                               └─┬──────────────┘      ▼                  
                                 │  ┌────────────────────┐                
                                 └─▶│  StarterPlugin.c   │                
                                    └────────────────────┘                
```

## Outline



## Install

