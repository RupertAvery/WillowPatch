
; Patch after-death CONTINUE option to point to 
; Select SaveGame screen
.Patch ($07,$BB2F)	
JMP $DE2D
.Eop (0)	

; NOTE: Invalidates the following:
;DO Continue
;$06/BB2F
;...
;$06/BB81

;SHOW PASSWORD
;$06/BB84
;...
;$06/BBC2

; Patches Password Load to select Savegame
.PATCH ($08,$DE2D)
LDA #$FF
STA $D7 

JSR DO_LOAD

JSR $C12D
JSR $C153
JSR $9DC9

LDA #$00
STA $6C
STA $52
STA $D6
STA $55

LDA $53
JSR $C1DB  ; Set Tileset
JSR $C12D

LDA $D5
STA $D7
STA $0690

LDA #$01
STA $D9

JSR $DCD7
JSR $C12D
JSR $DEF3
JSR $C12D
JSR $F000
JSR $C15D
JSR $C12D


; Force stack reset?
LDX #$FF
TXS 

JMP $DEA9

.EOP (0)



