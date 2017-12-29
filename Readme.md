# Willow Save Patch

Author: EnderWiggin/RupertAvery
Platform: Nintendo Entertainment System
Game: Willow

## Introduction

Willow was a NES RPG that used a password system to handle user progress. There were rumors
that the game was initially designed to use battery-backed SRAM to store save progress, but 
the idea was abandoned to save production costs.

In 2008, I got into ROM hacking, and this got me to thinking if I could hack a NES ROM to add
save game functionality.  This feature seems pretty pointless given that emulators have 
state saves, but it for me it was a proof-of-concept and a challenge, and a way for me to learn 
how the NES worked.

## Compiling the Source Code

I use X816 for compiling the assembly into an IPS-compatible patch and IPS for patching the ROM.
The executables are included in the bin folder.

### Note on Windows 10 / 64-bit machines

Unfortunately these programs run in DOS mode which is no longer supported in Windows 10, so 
you will need vDosPlus if you wish to compile the source in Windows 10. vDos is a fork of DosBox.

https://sourceforge.net/projects/vdosplus/

When compiling using vDos, the steps are the same except you need to extract the files and 
folders into the vDosPlus installation path, which is recognized as C:\ within vDosPlus.

### Compiling

* Extract and copy the files and folders where you want to, e.g. C:\WillowPatch
* Place your Willow ROM as WILLOW.NES in the folder 
* Add the bin folder to the environment PATH variable 
* Run compile.bat from the command line.

This will compile the assembly files in the src folder and generate the following files:

* WILLOW.bin
* WILLOW.LST
* WILLOW.SYM

The WILLOW.bin file will be copied to the build folder AS WILLOW.IPS along with the ROM, and IPS 
will patch the ROM using WILLOW.IPS

## Notes

The assembly entry point is Willow.asm. IPS_NES.INC sets up the macros necessary to generate a patch file. 

The generated WILLOW.BIN is actually an IPS file that can be applied using your favorite patching application 
to a clean iNES-headered Willow ROM

See the docs folder for the disassembly of Willow routines and memory map.

Willow Map.xlsx is a table of values used to determine which memory location to load the screen name tables from.