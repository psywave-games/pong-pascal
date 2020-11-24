Pong
==========================
[![Latest Stable Version](https://img.shields.io/github/v/release/psywave-games/pong-pascal)](https://github.com/psywave-games/pong-pascal/releases) [![Demo:GameJolt](https://img.shields.io/badge/Demo-GameJolt-green)](https://rodrigodornelles.gamejolt.io/pong) [![License](https://img.shields.io/github/license/psywave-games/pong-pascal)](https://github.com/psywave-games/pong-pascal/blob/master/LICENSE) [![Libary:Raylib](https://img.shields.io/badge/Libary-Raylib%203%2E0-blue)](https://www.raylib.com) 

[![gameplay](https://cdn.discordapp.com/attachments/751828785694900255/751831040590610540/ezgif-5-d15c0aa1729f.gif)](#)

| Move | Pause | Reset |
| ---- | -----  | ----- |
| <kbd>↑</kbd> <kbd>↓</kbd> | <kbd>P</kbd> | <kbd>R</kbd> |

## How to Build ##

### Install Free Pascal Compiler ###
Download the FPC according to your architecture and operating system https://www.freepascal.org/download.html or execute the command corresponding to your distro

 * **MacOS X** `brew install fpc`
 * **Linux CentOS** `yum install fpc`
 * **Linux Debian/Ubuntu/Mint** `apt install fpc`

### Download Raylib Build ###
just download the latest version according to your operating system https://github.com/raysan5/raylib/releases

### Prepare Project ###
create a folder path as `./bin` then make a symbolic link or copy the raylib libary shared(`*.so`,`*.dylib`, `*.dll`) or static(`*.a`) for this folder

### Compile ###

execute to build game static
```BASH
make RAYLIB_LIBTYPE=STATIC
```
or execute only
```BASH
make
```
to use dynamic library

### Execute Game ###
execute command `./bin/game` or simply double click on `game` in the `./bin` folder.
