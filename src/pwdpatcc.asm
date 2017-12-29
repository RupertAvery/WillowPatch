;Patches FIXED-STATS loader to copy data from SRAM
;instead of a table of values

LOAD_SAVEGAME:

LDA $0204
SEC
SBC #$48
STA $0A

LDA #$60
STA $0B

LDA #$00
STA $09

LDA #$00
STA $07

LDA #$00
STA $06

NEXT_STATS:
LDX $06
LDA STATS,X
BEQ DONE_STATS
STA $08

LDY $07
LDA ($0A),Y

LDY #$00
STA ($08),Y

INC $06
INC $07

BPL NEXT_STATS

DONE_STATS:

LDA $0A
CLC
adc #$20
STA $0A
;;LDA #$60
;;STA $0B
;;
;;;($0A) = $6020
;;
LDA #$00
STA $08
LDA #$06
STA $09

;($08) = $0600
LDY #$00

-
LDA ($0A),Y	; Copy from  $6020+Y
STA ($08),Y     ; to $0600+Y

iny	; next
cpy #$0A
bmi -

LDA #$24                  
JSR $C4AD  	; ???          
LDA #$3E   	; Success sound
JSR $C13F  	; Play sound effect	


LDA $D5	   	; load song number...
JSR $C4AB

LDA #$02
JSR $C1BB	; Set Willow sprite

LDA $2F
JSR $C6B0	; Set palette (BG)

LDA $2E
JSR $C6B2	; Set palette 2 (Sprite/BG?)

RTS 

SAVE_SAVEGAME:
LDA $0204
SEC
SBC #$48
STA $0A
LDA #$60
STA $0B

LDA #$00
STA $09

LDA #$00
STA $07

LDA #$00
STA $06

SAVE_NEXT:
LDX $06
LDA STATS,X
BEQ SAVE_DONE
STA $08

LDY #$00
LDA ($08),Y

LDY $07
STA ($0A),Y

INC $06
INC $07

JMP SAVE_NEXT

SAVE_DONE:

LDA $0A
CLC
adc #$20
STA $0A
;;LDA #$60        
;;STA $0B
;
;;($0A) = $6020
;
LDA #$00
STA $08
LDA #$06
STA $09

;($08) = $0600

LDY #$00

NEXT_FLAGS:

LDA ($08),Y	; Copy from  $0600+Y
STA ($0A),Y     ; to $6020+Y

iny	; next
cpy #$0A
bmi NEXT_FLAGS

LDA #$24
JSR $C4AD  ; ???
LDA #$3E   ; Success sound
JSR $C13F  ; Play sound effect	

rts

; table of STAT locations in RAM
STATS:
.dcb $2E ; Palette?
.dcb $2F ; Palette?
.dcb $42 ; Map X
.dcb $43 ; Map Y
.dcb $51 ; Tileset?
.dcb $52 ; Tileset?
.dcb $53 ; Tileset?
.dcb $71 ; Level - 1 (Level 1 = 00)
.dcb $7A ; MP
.dcb $7B ; HP
.dcb $7C
.dcb $7D
.dcb $7E
.dcb $7F 
.dcb $80 ; EXP decimal encoded 
.dcb $C0
.dcb $CC 
.dcb $CE ; screen x
.dcb $C1
.dcb $C8
.dcb $D5 ; song number
.dcb $B3 ; STR
.dcb $B4 ; DEF
.dcb $B5 ; AGI
.dcb $B6 ; Equipped Sword
.dcb $B7 ; Equipped Shield
.dcb $B8 ; Equipped magic
.dcb $BF ; Willow state
.dcb $00

EOPATCHA:


