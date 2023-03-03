![PharoPluginBuilder](./header.jpg)

# PharoPluginBuilder
A friendly setup for creating your own Pharo plugins.
_____


You can use a clone of this repository for local development of a Pharo Smalltalk Plugin. With it, you'll be able to:
1. Have a fast start on the setup to start a new plugin from scratch.
2. Use the [pharo-vm](https://github.com/pharo-project/pharo-vm) dependency in an organized and correct way.
3. Use Pharo as IDE for generating the C code of your plugin out of your [Slang](https://github.com/pharo-open-documentation/pharo-wiki/blob/master/General/Glossary.md#slang) code as starting point for the rest of your C code developments.
4. Have your plugin code versioned in your own separated repo as it should.
5. Generate the binaries of your plugin.
6. Test your plugin binary using the same Pharo image you use as IDE to develop that plugin.

## Structure

```
┌─────────────────────────┐
│   PharoPluginBuilder/   │
└┬────────────────────────┘
 │                             ┌───────────────────────┐
 │     ┌────────────────┐      │For starting a build   │
 ├────►│build.sh        │◄─────┤(once configured).     │
 │     └────────────────┘      └───────────────────────┘
 │
 │                             ┌─────────────────────────────┐
 │     ┌────────────────┐      │For scripting the            │
 ├────►│CMakeLists.txt  │◄─────┤configuration of a build.    │
 │     └────────────────┘      └─────────────────────────────┘
 │
 │                             ┌─────────────────────────────────────┐
 │     ┌────────────────┐      │Command to configure your environment│
 ├────►│configure.sh    │◄─────┤(prior to trigger a build).          │
 │     └────────────────┘      └─────────────────────────────────────┘
 │
 │     ┌────────────────┐
 ├────►│dependencies/   │
 │     └─┬──────────────┘
 │       │
 │       │  ┌──────────┐
 │       ├─►│ builds/  │
 │       │  └┬─────────┘
 │       │   │                    ┌───────────────────┐
 │       │   │  ┌─────────────┐   │Output dir for the │
 │       │   └─►│  pharo-vm/  │◄──┤pharo-vm build.    │
 │       │      └─────────────┘   └───────────────────┘
 │       │
 │       │                             ┌───────────────────────────────┐
 │       │  ┌─────────────┐            │The Pharo VM (hard requirement │
 │       └─►│  pharo-vm/  │◄───────────┤for building your plugin).     │
 │      ... └─────────────┘            └───────────────────────────────┘
 │
 │       │  ┌────────────────────┐     ┌─────────────────────────────┐
 │       └─►│ third-party-lib-X/ │◄────┤Any third party lib required │
 │          └────────────────────┘     │by your plugin.              │
 │                                     └─────────────────────────────┘
 │
 │     ┌──────┐
 ├────►│dist/ │
 │     └─┬────┘
 │       │
 │       │  ┌────────┐                  ┌──────────────────────────────────┐
 │       └─►│ build/ │◄─────────────────┤Once built, the binaries of your  │
 │          └────────┘                  │plugin, will be here.             │
 │                                      └──────────────────────────────────┘
 │
 │     ┌────┐                           ┌──────────────────────────────────────────┐
 ├────►│ide/│◄──────────────────────────┤This is for the Pharo image that you'll be│
 │     └────┘                           │using for the Smalltalk Plugin code that  │
 │                                      │generates the C code i.e.: StarterPlugin  │
 │     ┌─────┐                          └──────────────────────────────────────────┘
 └────►│src/ │                                               ▲
       └─┬───┘                                               │
         │                                                   │
         │  ┌───────────┐                                    │
         └─►│generated/ │                                    │
            └─┬─────────┘                                    │
              │                             Generated using PharoVMMaker.
              │  ┌────┐                     You generate this once as a
              └─►│64/ │                     starting point. Then you
                 └┬───┘                     develop `StarterPlugin.c`
                  │                         further on your own. Either
                  │  ┌─────────┐            manually or from Slang
                  └─►│plugins/ │            generating new versions, your
                     └─┬───────┘            call.     │
                       │                              │
                       │  ┌──────┐                    │
                       └─►│ src/ │                    │
                          └─┬────┘                    │
                            │                         │
                            │  ┌────────────────┐     │
                            └─►│ StarterPlugin/ │     │
                               └─┬──────────────┘     │
                                 │                    ▼
                                 │  ┌────────────────────┐
                                 └─►│  StarterPlugin.c   │
                                    └────────────────────┘
```

## Plan
By following the steps detailed below, you will end up having this repo as base for building the binaries of the plugin and also have a Pharo to use as IDE to develop two things: 

1. The code that is going to generate the C sources of your plugin and 
2. The Smalltalk code that actually uses the primitives of your plugin.

## Steps

## 1
**Recursively** clone this repo:
```
git clone --recursive git@github.com:sebastianconcept/PharoPluginBuilder.git
```

## 2
Go there   
```
cd PharoPluginBuilder
```
## 3

Make a sub-directory to sit the Pharo image you'll use as IDE and install the VMMaker requisite and your plugin project in it. Since you might not have yet your own repos, let's assume you'll use [StarterPlugin](https://github.com/sebastianconcept/StarterPlugin) :

```
mkdir ide
```
```
cd ide
```
I'm using Pharo 9 in this guide:
```
curl get.pharo.org/64/90 | bash
```
```
curl get.pharo.org/64/vm90 | bash
```
Open Pharo
```
./pharo
```

 Install VMMaker (for Pharo `v9.0.21` at this time) and your plugin project in that IDE Pharo image.

Open that Pharo image and in a Playground evaluate:

```smalltalk
"Note: be patient here as this can take a while with Pharo's UI not giving you any feedback. It's going to clone alright, it just takes a while."
Metacello new
  baseline: 'VMMaker';
  repository: 'github://pharo-project/pharo-vm:v9.0.21';
  load.
```

Again, instead of an actual real plugin project of yours, we will be using `StarterPlugin` go ahead and evaluate:

```smalltalk
"This is a seed repo that you can use as starter for later having your own plugin projects in a similar organized manner."
Metacello new
  baseline: 'StarterPlugin';
  repository: 'github://sebastianconcept/StarterPlugin';
  load
```

## 4

Go back to this repo's root dir and configure the whole project:
```
./configure.sh
```
## 5
And build it:
```
./build.sh
```

## 6
Once that build finishes you plugin will be in `dist/build`. You can symlink this brand new lib which is the binary of your plugin:
```
cd ide
ln -s ../dist/build/libStarterPlugin.dylib libStarterPlugin.dylib
```
Now from the Pharo you have in `ide/`, you will be able to use it.
## Using your StarterPlugin

Your plugin should be lazily loaded by Pharo's VM once you use it.  You can check that with:
```
Smalltalk vm listLoadedModules
```
In `StarterPlugin` I've added the method that returns the harcoded version programmed from Slang:
```
Starter pluginVersion
```
It should look like this:

![Testing your StarterPlugin](./testingStarterPlugin.gif)
