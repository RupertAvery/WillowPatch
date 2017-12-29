# Willow Memory Map

# RAM

0027 - Joystick 1 - repeat
0029 - Joystick 1 - no repeat

0033 - Sets area to read from ROM when loading nametables

0042 - Map X
0043 - Map Y

0053 - Tileset?

0066 - location where text will be written during output

0071 - Level - 1 (Level 1 = 00)
007A - MP
007B - HP
007C - 0080 - EXP decimal encoded 

0020 - name table / v-write / sprite / hit / vblank (PPU Reg 0 status) 
0021 - screen display (PPU Reg 1 status)

0026 - ROM bank page select

0027 - Joystick state
0028 - ?
0029 - 1-shot Joystick state

002A - ?
002B - temp for $27?
002C - temp for $28?

0047 - VRAM LO
0048 - VRAM HI 

00A7 - VROM bank page select
00A8 - VROM 2 page select

During password entry
00A1 - Row/Column seletion cursor position
00A0 - password cursor position

00C0
00CC
00CE
00C1
00C8

00B3 - STR
00B4 - DEF
00B5 - AGI

00B6 - Equipped Sword
00B7 - Equipped Shield
00B8 - Equipped magic

00BF - Willow state
       00 - unequipped
       01 - Sword
       02 - Shield
       03 - Sword and shield
       04 - When casting magic (Can't move)
       05 - Swinging

0200 - used for arrow cursor selection thingy
       in inventory and continue/password

0600 - Event/inventory flags
0609

0640 - Password storage

06C0 - 074F  Dialog text space

# ROM

## Bank 1

bea7 (3eb7)

- copyright text

(1BBD8)

- continue/password text

(1BBFC)

(1E09E)

E091 - start/password text

(1EA01)

- start/password text

## bank 6?

80f9 - Game Joystick Loop

811a - Game Joystick Loop

8140 - Pressed 'B'

82ab - returning from a screen to game loop

sets $BF 

C20F - Main Joystick Reader

b439 - 
b591 - Password entry handler
b53b - Password check handler


B6D8 - level decoder routine?

b633 - writes stuff to 0640 - password data?

b67a - Level loader

b859 - copy from 670 - 640 (write password data)

b865 - copy from 640 - 670 (read password data?)

babf - game over

bb28 - Continue/Password

b83c - press start/copyright screen

b896 - after pressing start 

b871 - Stats loader

b8d6 - Map pos loader

a81e - write "text" to screen

A9AA - after scrolling text during dialog

de26 - After choosing start or password on main screen 

## ROM Data

D1EB - D1FA = AGI table

D1FB - D20A = HP table

D20B - D21A = MP table


## Breakpoints

aa24 - during text routine
B6D8 
b54d - test if carry clear, if set, password failed.
b565 - play success sound
b590 - RTS from password handler 1?

