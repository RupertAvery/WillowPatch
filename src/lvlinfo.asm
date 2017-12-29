WRITE_LEVEL:

LDA #<SLOT1_CONST
STA $33
LDA #>SLOT1_CONST
STA $34
JSR $C32F


;LDY #$07
;LDA ($0A),Y
;SEC
;ADC #$01
;JSR $F64D

LDA #$80
STA $06C0,Y


;WRITE_EXP_NUMBER:

;LDY #$00
;LDX #$04	; 5 digits

;-
;LDA $7C,X	; transfer EXP
;STA $0B,X	; to 0B - 0F
;DEX 		; next digit
;BPL -

;LDA #$04
;STA $09		; 5 digits?
;LDX #$00
;
;JSR WRITE_NUMBER


;WRITELEN:
;LDY #$02
;LDA $0C
;STA ($00),Y

;LDY $0C
;LDA #$FF
;STA ($00),Y
;INC $0C

;LDA #$C0
;STA $33
;LDA #$06
;STA $34
;JSR $C32F

RTS

WRITE_NUMBER:
-
LDA $0B,X		; get digit
BNE NONZERO		; non-zero?
LDA #$20		; zero, write a blank 
STA $06C0,Y      
INX 			; next		
INY 			; next
CPX $09			; = max num of digits?
BNE -
BEQ +  			; done

NONZERO:
LDA $0B,X		; get digit again
STA $06C0,Y     	; write it
INX 
INY 
CPX $09			; next
BNE NONZERO                      

+     
LDA $0B,X		; get last digit
STA $06C0,Y		; write
INY 

RTS 

SLOT1_CONST:
;  @BASEVRAMXXYY = 9248 + (32 * YY) + XX
;  .DCB >@BASEVRAMXXYY
;  .DCB <@BASEVRAMXXYY
.DB $24, $A5, $08
.asc "LEVEL  1"
.DB $24, $AE, $0F
.asc "EXP 00000/00000"
.DB $24, $E5, $0A
.asc "HP 000/000"
.DB $24, $F1, $0A
.asc "MP 000/000"
.DB $FF
SLOT2_CONST:
SLOT3_CONST:

