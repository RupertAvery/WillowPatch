.org $008000

.HROM	; USE HIROM mode to patch upper blocks

IPS_NESHDR_YES	EQU	1
IPS_NESHDR_NO	EQU	0
IPS_OBJ_YES	EQU	1
IPS_OBJ_NO	EQU	0

PATCH .MACRO (BANK,ADDR)
  .MODULE _+ADDR                  ; append '_' to address for module name 

  @STEP1 = ADDR 

  .IF @STEP1 >= 49152
     @STEP2 = @STEP1 - 49152
  .ELSE
     @STEP2 = @STEP1 - 32768
  .ENDIF  

  @STEP3 = (BANK - 1) * 16384 

  @ND = @STEP2 + @STEP3 + 16  		; account for nes header

  .DCB ^@ND                       ; write destination file offset
  .DCB >@ND
  .DCB <@ND

;DATA LENGTH SECTION.
  @DATA_LENGTH = @END - @BEGIN    ; write patch length
  .DCB >@DATA_LENGTH
  .DCB <@DATA_LENGTH
  .BASE ADDR                      ; set address to assemble code at
  @BEGIN                          ; start of code
.ENDM

EOP  .MACRO (NULL)
  @END                            ; end of code
  .END                            ; end base directive
  .END                            ; end module directive
.ENDM

IPSOPEN	.MACRO (NULL)

  .IF IPS_OBJ = IPS_OBJ_NO
     .DB "PATCH"
  .ENDIF
.ENDM

IPSCLOSE .MACRO (NULL)

  .IF IPS_OBJ = IPS_OBJ_NO
     .DB "EOF"
  .ENDIF
.ENDM

