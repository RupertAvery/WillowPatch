.PATCH ($01,$BEA7)
.asc "  TM & @ 2008 ENDERSOFT  "
.EOP (0)

.PATCH ($08,$E099)
.asc "CONTINUE "
.EOP (0)

.PATCH ($07,$A85E)
AND #$80		; check if B pressed, skip text
.EOP (0)

; START MENU LAYOUT
.PATCH ($04,$8E80)
.db $15, $15, $01, $01, $02, $03, $03, $03
.db $15, $01, $02, $02, $03, $03, $03, $03
.db $01, $02, $3F, $26, $26, $27, $03, $03
.db $01, $03, $F9, $00, $00, $06, $03, $FE
.db $02, $03, $FA, $22, $22, $F8, $03, $FE
.db $03, $03, $03, $03, $03, $03, $FE, $FF
.db $03, $03, $03, $03, $03, $FE, $FF, $15
.db $03, $03, $FE, $FE, $FF, $FF, $15, $15
.EOP (0)


; START MENU ORIG
;.db $15, $15, $01, $01, $02, $03, $03, $03
;.db $15, $01, $02, $02, $03, $03, $03, $03
;.db $01, $02, $3F, $26, $26, $27, $03, $03
;.db $01, $03, $F9, $00, $00, $06, $03, $FE
;.db $02, $03, $FA, $22, $22, $F8, $03, $FE
;.db $03, $03, $03, $03, $03, $03, $FE, $FF
;.db $03, $03, $03, $03, $03, $FE, $FF, $15
;.db $03, $03, $FE, $FE, $FF, $FF, $15, $15


; PASSWORD ENTRY LAYOUT
.PATCH ($04,$8EC0)
.db $01, $02, $03, $03, $03, $03, $03, $03                              
.db $02, $00, $00, $00, $00, $00, $00, $0F                              
.db $11, $09, $09, $09, $0B, $0A, $0B, $17                              
.db $03, $00, $00, $00, $00, $00, $00, $1F                              
.db $11, $09, $0A, $0B, $09, $0A, $0B, $17                              
.db $03, $00, $00, $00, $00, $00, $00, $1F                                                                        
.db $11, $09, $09, $09, $09, $0A, $0B, $17
.db $03, $03, $03, $03, $13, $14, $01, $15                              
.EOP (0)

;stats orig
;$04/8000: $01, $02, $03, $03, $03, $03, $03, $03
;$04/8008: $04, $00, $00, $05, $00, $00, $00, $06
;$04/8010: $0C, $0D, $16, $0E, $00, $00, $00, $06
;$04/8018: $07, $00, $00, $05, $00, $00, $00, $0F
;$04/8020: $07, $00, $00, $08, $09, $0A, $0B, $17
;$04/8028: $07, $00, $00, $05, $00, $00, $00, $1F
;$04/8030: $11, $09, $09, $10, $09, $0A, $0B, $17
;$04/8038: $03, $03, $03, $03, $13, $14, $01, $15


; PASSWORD ENTRY LAYOUT ORIG
;.db $15, $01, $02, $02, $03, $03, $03, $03
;.db $01, $02, $0D, $16, $16, $16, $03, $03
;.db $01, $02, $22, $22, $22, $22, $03, $03
;.db $02, $07, $00, $00, $00, $00, $06, $03
;.db $03, $07, $00, $00, $00, $00, $0F, $FE
;.db $03, $07, $00, $00, $00, $00, $1F, $FF
;.db $03, $FB, $FC, $FC, $FC, $FC, $FD, $15
;.db $03, $FF, $15, $15, $15, $15, $15, $15

