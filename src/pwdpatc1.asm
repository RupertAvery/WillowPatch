; Overwrites:  Password entry setup, joytick detection, etc

.Patch ($07,$B3E4)
DO_LOAD:
LDA #$0C	
;LDY #$04                  
;JSR $C64D	; Fade out
JSR $C4AD	; Set password song
JSR SAVEGAME_LOOP_NO_SONG
JSR LOAD_SAVEGAME
RTS

SAVEGAME_LOOP_NO_SONG:
JSR $C153	; disable screen
JSR $C12D	; wait vblank?

; not sure what these do
JSR $9058
JSR $C12D
JSR $910A
JSR $C12D
JSR $97A2
JSR $C12D

LDA #$13
JSR $C1DB	; make sure that proper char page is selected

LDA #$1F
JSR $C1C2	; setup sprite table for pointer

LDA #$05
JSR $C6B2
JSR $C12D

;JSR $C153
;JSR $C164

LDA $20
ORA #$01
STA $20
STA $2000

;JSR $C2B1
JSR $C39F	; clears vram

LDA #$1E
STA $OD
LDA #$1B
STA $0F
JSR $DEFB	; draw background


; Write savegame data to screen
WRITE_SAVEGAME_DATA:
LDA #$60
STA $0B
LDA #$00
STA $0A


LDA #$24
STA $09

-
;JSR WRITE_LOCATION_NAME
JSR WRITE_LEVEL

LDA #$40
CLC
ADC $0A
STA $0A

INC $09
LDA $09

cmp #$27

BNE -

LDA #$14            
STA $0207           

LDA #$48
STA $0204

LDA #$83
STA $0205

LDA #$01
STA $0206

JSR $C16E
JSR $C15D

LDA #$05
LDY #$04
JSR $C636	; Fade in?

LDA #$00
STA $01

-
JSR $C12D

LDA $29		; Get joystick state
AND #$40	; Check if A was pressed
BEQ +
clc
RTS
+
LDA $29
and #$80	; Check if B was pressed
BEQ +
sec
RTS
+
LDA $01
cmp #$00
BNE WAITPAD

LDA $29
and #$0F
cmp #$08
beq moveup
cmp #$04
beq movedown
JMP -

moveup:
LDA $0204
cmp #$48
BEQ -
SEC
SBC #$40
STA $0204
LDA #$08
STA $01
JMP WAITPAD

movedown:
LDA $0204
cmp #$C8
BEQ -
CLC
ADC #$40
STA $0204
LDA #$08
STA $01

WAITPAD:
DEC $01
JMP -

.incsrc "lvlinfo.asm"

; incsrc "mapinfo.asm"

;includes patch to
.INCSRC "selectb.asm"

.INCSRC "pwdpatcc.asm"

EOPATCH1:

.Eop (0)

; extends in-game joytick routine to detect select+B
; for loading
.Patch ($07,$80F9)	
JMP INGAME_JOYSTICK_LOOP
.Eop (0)

