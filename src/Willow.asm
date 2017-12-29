.INCSRC "IPS_NES.INC"
IPS_NESHDR = IPS_NESHDR_YES	; Either 'IPS_NESHDR_YES' or 'IPS_NESHDR_NO'.
IPS_OBJ	   = IPS_OBJ_NO		; Either 'IPS_OBJ_YES' or 'IPS_OBJ_NO'.

;GOTOXY .MACRO (XX,YY)
;  @BASEVRAMXXYY = 9248 + (32 * YY) + XX
;  .DCB >@BASEVRAMXXYY
;  .DCB <@BASEVRAMXXYY
;.ENDM

.IPSOpen (0)		

.INDEX 8
.MEM 8

; Patch NES Header to enable Battery-backed RAM
.DCB $00
.DCB $00
.DCB $06	; offset = $0006
.DCB $00
.DCB $01	; size = 1 byte
.DCB $12        ; set bit 1 (battery) 

.INCSRC "asctable.asm"

.INCSRC "pwdpatch.asm"

.INCSRC "uilayout.asm"


.IPSClose (0)	; Close IPS Output File.
