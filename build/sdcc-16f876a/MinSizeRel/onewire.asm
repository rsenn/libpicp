;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"onewire.c"
	list	p=16f876a
	radix dec
	include "p16f876a.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	___uchar2fs
	extern	___schar2fs
	extern	___uint2fs
	extern	___sint2fs
	extern	___ulong2fs
	extern	___slong2fs
	extern	___fs2uchar
	extern	___fs2schar
	extern	___fs2uint
	extern	___fs2sint
	extern	___fs2ulong
	extern	___fs2slong
	extern	___fsadd
	extern	___fssub
	extern	___fsmul
	extern	___fsdiv
	extern	___fslt
	extern	___fseq
	extern	___fsneq
	extern	___fsgt
	extern	_cycle_eater
	extern	_delay_ms
	extern	_delay_us
	extern	_Delay100TCYx
	extern	_Delay10KTCYx
	extern	_Delay10TCYx
	extern	_Delay1KTCYx
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_CCP2CONbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_SSPCON2bits
	extern	_SSPSTATbits
	extern	_TXSTAbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ADCON1bits
	extern	_EECON1bits
	extern	_dvar
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP2CON
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_SSPCON2
	extern	_PR2
	extern	_SSPADD
	extern	_SSPSTAT
	extern	_TXSTA
	extern	_SPBRG
	extern	_CMCON
	extern	_CVRCON
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_EECON1
	extern	_EECON2
	extern	__gptrget1
	extern	__mulchar

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_ow_access
	global	_ow_search
	global	_ow_next
	global	_ow_crc
	global	_ow_write_byte
	global	_ow_read_byte
	global	_ow_reset
	global	_ow_read_bit
	global	_ow_write_bit
	global	_ow_first
	global	_ow_crctable

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_onewire_0	udata
r0x106C	res	1
r0x106D	res	1
r0x1077	res	1
r0x108F	res	1
r0x1090	res	1
r0x1091	res	1
r0x1092	res	1
r0x106E	res	1
r0x106F	res	1
r0x1070	res	1
r0x1078	res	1
r0x1079	res	1
r0x107C	res	1
r0x107D	res	1
r0x107E	res	1
r0x107F	res	1
r0x1080	res	1
r0x1081	res	1
r0x1082	res	1
r0x1083	res	1
r0x1085	res	1
r0x1084	res	1
r0x1086	res	1
r0x1089	res	1
r0x108A	res	1
r0x108B	res	1
r0x108C	res	1
r0x108D	res	1
r0x108E	res	1
r0x1071	res	1
r0x1072	res	1
r0x1073	res	1
r0x1074	res	1
r0x1075	res	1
r0x1076	res	1
_ow_dowcrc	res	1
_RomBytes	res	8
_numROMs	res	1
_FoundROM	res	96
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_onewire_0	idata
_lastDiscrep
	db	0x00


ID_onewire_1	idata
_doneFlag
	db	0x00


ID_onewire_2	code
_ow_crctable
	retlw 0x00
	retlw 0x5e
	retlw 0xbc
	retlw 0xe2
	retlw 0x61
	retlw 0x3f
	retlw 0xdd
	retlw 0x83
	retlw 0xc2
	retlw 0x9c
	retlw 0x7e
	retlw 0x20
	retlw 0xa3
	retlw 0xfd
	retlw 0x1f
	retlw 0x41
	retlw 0x9d
	retlw 0xc3
	retlw 0x21
	retlw 0x7f
	retlw 0xfc
	retlw 0xa2
	retlw 0x40
	retlw 0x1e
	retlw 0x5f
	retlw 0x01
	retlw 0xe3
	retlw 0xbd
	retlw 0x3e
	retlw 0x60
	retlw 0x82
	retlw 0xdc
	retlw 0x23
	retlw 0x7d
	retlw 0x9f
	retlw 0xc1
	retlw 0x42
	retlw 0x1c
	retlw 0xfe
	retlw 0xa0
	retlw 0xe1
	retlw 0xbf
	retlw 0x5d
	retlw 0x03
	retlw 0x80
	retlw 0xde
	retlw 0x3c
	retlw 0x62
	retlw 0xbe
	retlw 0xe0
	retlw 0x02
	retlw 0x5c
	retlw 0xdf
	retlw 0x81
	retlw 0x63
	retlw 0x3d
	retlw 0x7c
	retlw 0x22
	retlw 0xc0
	retlw 0x9e
	retlw 0x1d
	retlw 0x43
	retlw 0xa1
	retlw 0xff
	retlw 0x46
	retlw 0x18
	retlw 0xfa
	retlw 0xa4
	retlw 0x27
	retlw 0x79
	retlw 0x9b
	retlw 0xc5
	retlw 0x84
	retlw 0xda
	retlw 0x38
	retlw 0x66
	retlw 0xe5
	retlw 0xbb
	retlw 0x59
	retlw 0x07
	retlw 0xdb
	retlw 0x85
	retlw 0x67
	retlw 0x39
	retlw 0xba
	retlw 0xe4
	retlw 0x06
	retlw 0x58
	retlw 0x19
	retlw 0x47
	retlw 0xa5
	retlw 0xfb
	retlw 0x78
	retlw 0x26
	retlw 0xc4
	retlw 0x9a
	retlw 0x65
	retlw 0x3b
	retlw 0xd9
	retlw 0x87
	retlw 0x04
	retlw 0x5a
	retlw 0xb8
	retlw 0xe6
	retlw 0xa7
	retlw 0xf9
	retlw 0x1b
	retlw 0x45
	retlw 0xc6
	retlw 0x98
	retlw 0x7a
	retlw 0x24
	retlw 0xf8
	retlw 0xa6
	retlw 0x44
	retlw 0x1a
	retlw 0x99
	retlw 0xc7
	retlw 0x25
	retlw 0x7b
	retlw 0x3a
	retlw 0x64
	retlw 0x86
	retlw 0xd8
	retlw 0x5b
	retlw 0x05
	retlw 0xe7
	retlw 0xb9
	retlw 0x8c
	retlw 0xd2
	retlw 0x30
	retlw 0x6e
	retlw 0xed
	retlw 0xb3
	retlw 0x51
	retlw 0x0f
	retlw 0x4e
	retlw 0x10
	retlw 0xf2
	retlw 0xac
	retlw 0x2f
	retlw 0x71
	retlw 0x93
	retlw 0xcd
	retlw 0x11
	retlw 0x4f
	retlw 0xad
	retlw 0xf3
	retlw 0x70
	retlw 0x2e
	retlw 0xcc
	retlw 0x92
	retlw 0xd3
	retlw 0x8d
	retlw 0x6f
	retlw 0x31
	retlw 0xb2
	retlw 0xec
	retlw 0x0e
	retlw 0x50
	retlw 0xaf
	retlw 0xf1
	retlw 0x13
	retlw 0x4d
	retlw 0xce
	retlw 0x90
	retlw 0x72
	retlw 0x2c
	retlw 0x6d
	retlw 0x33
	retlw 0xd1
	retlw 0x8f
	retlw 0x0c
	retlw 0x52
	retlw 0xb0
	retlw 0xee
	retlw 0x32
	retlw 0x6c
	retlw 0x8e
	retlw 0xd0
	retlw 0x53
	retlw 0x0d
	retlw 0xef
	retlw 0xb1
	retlw 0xf0
	retlw 0xae
	retlw 0x4c
	retlw 0x12
	retlw 0x91
	retlw 0xcf
	retlw 0x2d
	retlw 0x73
	retlw 0xca
	retlw 0x94
	retlw 0x76
	retlw 0x28
	retlw 0xab
	retlw 0xf5
	retlw 0x17
	retlw 0x49
	retlw 0x08
	retlw 0x56
	retlw 0xb4
	retlw 0xea
	retlw 0x69
	retlw 0x37
	retlw 0xd5
	retlw 0x8b
	retlw 0x57
	retlw 0x09
	retlw 0xeb
	retlw 0xb5
	retlw 0x36
	retlw 0x68
	retlw 0x8a
	retlw 0xd4
	retlw 0x95
	retlw 0xcb
	retlw 0x29
	retlw 0x77
	retlw 0xf4
	retlw 0xaa
	retlw 0x48
	retlw 0x16
	retlw 0xe9
	retlw 0xb7
	retlw 0x55
	retlw 0x0b
	retlw 0x88
	retlw 0xd6
	retlw 0x34
	retlw 0x6a
	retlw 0x2b
	retlw 0x75
	retlw 0x97
	retlw 0xc9
	retlw 0x4a
	retlw 0x14
	retlw 0xf6
	retlw 0xa8
	retlw 0x74
	retlw 0x2a
	retlw 0xc8
	retlw 0x96
	retlw 0x15
	retlw 0x4b
	retlw 0xa9
	retlw 0xf7
	retlw 0xb6
	retlw 0xe8
	retlw 0x0a
	retlw 0x54
	retlw 0xd7
	retlw 0x89
	retlw 0x6b
	retlw 0x35

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_onewire	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_reset
;   _ow_write_byte
;   __mulchar
;   _ow_write_byte
;   _ow_reset
;   _ow_write_byte
;   __mulchar
;   _ow_write_byte
;7 compiler assigned registers:
;   r0x1071
;   r0x1072
;   STK00
;   r0x1073
;   r0x1074
;   r0x1075
;   r0x1076
;; Starting pCode block
S_onewire__ow_access	code
_ow_access:
; 2 exit points
;	.line	296; "onewire.c"	ow_access(uint8_t actNumROM) {
	BANKSEL	r0x1071
	MOVWF	r0x1071
;	.line	299; "onewire.c"	if(ow_reset())
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
	BANKSEL	r0x1072
	MOVWF	r0x1072
	MOVF	r0x1072,W
	BTFSC	STATUS,2
	GOTO	_00293_DS_
;	.line	300; "onewire.c"	return 0; // 0 if device present
	MOVLW	0x00
	GOTO	_00297_DS_
_00293_DS_:
;	.line	302; "onewire.c"	ow_write_byte(0x55, 0); // Match ROM
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x55
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	304; "onewire.c"	for(i = 0; i < 8; i++) ow_write_byte(FoundROM[actNumROM][i], 0); // Send ROM code
	MOVLW	0x08
	MOVWF	STK00
	BANKSEL	r0x1071
	MOVF	r0x1071,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1072
	MOVWF	r0x1072
	CLRF	r0x1073
	MOVF	r0x1072,W
	ADDLW	(_FoundROM + 0)
	MOVWF	r0x1072
	MOVLW	high (_FoundROM + 0)
	MOVWF	r0x1071
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1073,W
	ADDWF	r0x1071,F
	CLRF	r0x1073
_00295_DS_:
	BANKSEL	r0x1073
	MOVF	r0x1073,W
	ADDWF	r0x1072,W
	MOVWF	r0x1074
	MOVF	r0x1071,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1075
	MOVF	r0x1074,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1075
	BTFSC	r0x1075,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1076
	MOVWF	r0x1076
	MOVLW	0x00
	MOVWF	STK00
	MOVF	r0x1076,W
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
	BANKSEL	r0x1073
	INCF	r0x1073,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x1073,W
	BTFSS	STATUS,0
	GOTO	_00295_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;	.line	306; "onewire.c"	return 1;
	MOVLW	0x01
_00297_DS_:
;	.line	307; "onewire.c"	}
	RETURN	
; exit point of _ow_access

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_reset
;   _ow_first
;   __mulchar
;   _ow_next
;   _ow_reset
;   _ow_first
;   __mulchar
;   _ow_next
;7 compiler assigned registers:
;   r0x1089
;   STK00
;   r0x108A
;   r0x108B
;   r0x108C
;   r0x108D
;   r0x108E
;; Starting pCode block
S_onewire__ow_search	code
_ow_search:
; 2 exit points
;	.line	262; "onewire.c"	if(!ow_reset()) {
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
	BANKSEL	r0x1089
	MOVWF	r0x1089
	MOVF	r0x1089,W
	BTFSS	STATUS,2
	GOTO	_00287_DS_
;	.line	263; "onewire.c"	if(ow_first()) { // Begins when at least one part found
	PAGESEL	_ow_first
	CALL	_ow_first
	PAGESEL	$
	BANKSEL	r0x1089
	MOVWF	r0x1089
	MOVF	r0x1089,W
	BTFSC	STATUS,2
	GOTO	_00287_DS_
;	.line	264; "onewire.c"	numROMs = 0;
	BANKSEL	_numROMs
	CLRF	_numROMs
_00278_DS_:
;	.line	267; "onewire.c"	numROMs++;
	BANKSEL	_numROMs
	INCF	_numROMs,F
;	.line	269; "onewire.c"	for(m = 0; m < 8; m++) {
	BANKSEL	r0x1089
	CLRF	r0x1089
_00285_DS_:
;	.line	270; "onewire.c"	FoundROM[numROMs][m] = RomBytes[m];
	MOVLW	0x08
	MOVWF	STK00
	BANKSEL	_numROMs
	MOVF	_numROMs,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x108A
	MOVWF	r0x108A
	CLRF	r0x108B
	MOVF	r0x108A,W
	ADDLW	(_FoundROM + 0)
	MOVWF	r0x108A
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x108B,W
	ADDLW	high (_FoundROM + 0)
	MOVWF	r0x108B
	MOVF	r0x1089,W
	ADDWF	r0x108A,F
	MOVF	r0x108B,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x108B
	MOVF	r0x1089,W
	ADDLW	(_RomBytes + 0)
	MOVWF	r0x108C
	MOVLW	high (_RomBytes + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x108D
	MOVF	r0x108C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x108D
	BTFSC	r0x108D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x108E
	MOVWF	r0x108E
	MOVF	r0x108A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x108B
	BTFSC	r0x108B,0
	BSF	STATUS,7
	MOVF	r0x108E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	269; "onewire.c"	for(m = 0; m < 8; m++) {
	BANKSEL	r0x1089
	INCF	r0x1089,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x1089,W
	BTFSS	STATUS,0
	GOTO	_00285_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;	.line	283; "onewire.c"	} while(ow_next() && (numROMs < 10)); // Continues until no additional
	PAGESEL	_ow_next
	CALL	_ow_next
	PAGESEL	$
	BANKSEL	r0x1089
	MOVWF	r0x1089
	MOVF	r0x1089,W
	BTFSC	STATUS,2
	GOTO	_00287_DS_
;;unsigned compare: left < lit(0xA=10), size=1
	MOVLW	0x0a
	BANKSEL	_numROMs
	SUBWF	_numROMs,W
	BTFSS	STATUS,0
	GOTO	_00278_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
_00287_DS_:
;	.line	290; "onewire.c"	}
	RETURN	
; exit point of _ow_search

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_next
;   _ow_next
;1 compiler assigned register :
;   r0x1088
;; Starting pCode block
S_onewire__ow_first	code
_ow_first:
; 2 exit points
;	.line	251; "onewire.c"	lastDiscrep = 0;
	BANKSEL	_lastDiscrep
	CLRF	_lastDiscrep
;	.line	252; "onewire.c"	doneFlag = 0;
	BANKSEL	_doneFlag
	CLRF	_doneFlag
;	.line	254; "onewire.c"	return ow_next(); // Call ow_next and return it's return value;
	PAGESEL	_ow_next
	CALL	_ow_next
	PAGESEL	$
;;1	MOVWF	r0x1088
;	.line	255; "onewire.c"	}
	RETURN	
; exit point of _ow_first

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_reset
;   _ow_write_byte
;   _ow_read_bit
;   _delay_us
;   _ow_read_bit
;   _ow_write_bit
;   _ow_crc
;   _ow_reset
;   _ow_write_byte
;   _ow_read_bit
;   _delay_us
;   _ow_read_bit
;   _ow_write_bit
;   _ow_crc
;12 compiler assigned registers:
;   r0x107D
;   r0x107E
;   r0x107F
;   r0x1080
;   STK00
;   r0x1081
;   r0x1082
;   r0x1083
;   r0x1084
;   r0x1085
;   r0x1086
;   r0x1087
;; Starting pCode block
S_onewire__ow_next	code
_ow_next:
; 2 exit points
;	.line	161; "onewire.c"	uint8_t k = 1; // Bit mask
	MOVLW	0x01
	BANKSEL	r0x107D
	MOVWF	r0x107D
;	.line	163; "onewire.c"	uint8_t discrepMarker = 0;
	CLRF	r0x107E
;	.line	168; "onewire.c"	nxt = 0; // Reset next flag to 0
	CLRF	r0x107F
;	.line	170; "onewire.c"	ow_dowcrc = 0; // Reset the ow_dowcrc
	BANKSEL	_ow_dowcrc
	CLRF	_ow_dowcrc
;	.line	172; "onewire.c"	flag = ow_reset();
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
	BANKSEL	r0x1080
	MOVWF	r0x1080
;	.line	174; "onewire.c"	if(flag || doneFlag) { // If no parts return 0
	MOVF	r0x1080,W
	BTFSS	STATUS,2
	GOTO	_00179_DS_
	BANKSEL	_doneFlag
	MOVF	_doneFlag,W
	BTFSC	STATUS,2
	GOTO	_00180_DS_
_00179_DS_:
;	.line	175; "onewire.c"	lastDiscrep = 0;     // Reset the search
	BANKSEL	_lastDiscrep
	CLRF	_lastDiscrep
;	.line	176; "onewire.c"	return 0;
	MOVLW	0x00
	GOTO	_00209_DS_
_00180_DS_:
;	.line	179; "onewire.c"	ow_write_byte(0xF0, 0); // Send SearchROM command
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0xf0
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	181; "onewire.c"	do {
	BANKSEL	r0x1080
	CLRF	r0x1080
	MOVLW	0x01
	MOVWF	r0x1081
_00202_DS_:
;	.line	182; "onewire.c"	x = 0;
	BANKSEL	r0x1082
	CLRF	r0x1082
;	.line	184; "onewire.c"	if(ow_read_bit() == 1)
	PAGESEL	_ow_read_bit
	CALL	_ow_read_bit
	PAGESEL	$
	BANKSEL	r0x1083
	MOVWF	r0x1083
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00183_DS_
;	.line	185; "onewire.c"	x = 2;
	MOVLW	0x02
	MOVWF	r0x1082
_00183_DS_:
;	.line	187; "onewire.c"	delay_us(120);
	MOVLW	0x78
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	189; "onewire.c"	if(ow_read_bit() == 1)
	PAGESEL	_ow_read_bit
	CALL	_ow_read_bit
	PAGESEL	$
	BANKSEL	r0x1083
	MOVWF	r0x1083
;	.line	190; "onewire.c"	x |= 1; // And it's complement
	XORLW	0x01
;	.line	192; "onewire.c"	if(x == 3) // There are no devices on the one wire bus
	BTFSC	STATUS,2
	BSF	r0x1082,0
	MOVF	r0x1082,W
;	.line	195; "onewire.c"	if(x > 0)     // All devices coupled have 0 or 1
	XORLW	0x03
	BTFSC	STATUS,2
	GOTO	_00204_DS_
	MOVF	r0x1082,W
	BTFSC	STATUS,2
	GOTO	_00192_DS_
;;shiftRight_Left2ResultLit:5323: shCount=1, size=1, sign=0, same=0, offr=0
;	.line	196; "onewire.c"	g = x >> 1; // Bit write value for search
	BCF	STATUS,0
	RRF	r0x1082,W
	MOVWF	r0x1083
	GOTO	_00193_DS_
_00192_DS_:
;	.line	201; "onewire.c"	if(m < lastDiscrep)
	BANKSEL	r0x1081
	MOVF	r0x1081,W
	ADDLW	0x80
	MOVWF	r0x1084
	BANKSEL	_lastDiscrep
	MOVF	_lastDiscrep,W
	ADDLW	0x80
	BANKSEL	r0x1084
	SUBWF	r0x1084,W
	BTFSC	STATUS,0
	GOTO	_00187_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;	.line	202; "onewire.c"	g = ((RomBytes[n] & k) > 0);
	MOVF	r0x1080,W
	ADDLW	(_RomBytes + 0)
	MOVWF	r0x1082
	MOVLW	high (_RomBytes + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1085
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1085
	BTFSC	r0x1085,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1084
	MOVWF	r0x1084
	MOVF	r0x107D,W
	ANDWF	r0x1084,W
	MOVWF	r0x1082
	MOVF	r0x1082,W
	BTFSC	STATUS,2
	GOTO	_00211_DS_
	MOVLW	0x01
	MOVWF	r0x1082
	CLRF	r0x1084
	GOTO	_00212_DS_
_00211_DS_:
	BANKSEL	r0x1082
	CLRF	r0x1082
	CLRF	r0x1084
_00212_DS_:
	BANKSEL	r0x1082
	MOVF	r0x1082,W
	MOVWF	r0x1083
	GOTO	_00188_DS_
_00187_DS_:
;	.line	205; "onewire.c"	g = (m == lastDiscrep); // If not then pick 0
	BANKSEL	r0x1083
	CLRF	r0x1083
	BANKSEL	_lastDiscrep
	MOVF	_lastDiscrep,W
;	.line	208; "onewire.c"	if(g == 0)
	BANKSEL	r0x1081
	XORWF	r0x1081,W
	BTFSC	STATUS,2
	INCF	r0x1083,F
_00188_DS_:
	MOVLW	0x00
	BANKSEL	r0x1083
	IORWF	r0x1083,W
	BTFSS	STATUS,2
	GOTO	_00193_DS_
;	.line	209; "onewire.c"	discrepMarker = m;
	MOVF	r0x1081,W
	MOVWF	r0x107E
_00193_DS_:
;	.line	213; "onewire.c"	if(g == 1)
	BANKSEL	r0x1083
	MOVF	r0x1083,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00195_DS_
;	.line	214; "onewire.c"	RomBytes[n] |= k;
	MOVF	r0x1080,W
	ADDLW	(_RomBytes + 0)
	MOVWF	r0x1082
	MOVLW	high (_RomBytes + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1084
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1084
	BTFSC	r0x1084,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1086
	MOVWF	r0x1086
	MOVF	r0x107D,W
	IORWF	r0x1086,F
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1084
	BTFSC	r0x1084,0
	BSF	STATUS,7
	MOVF	r0x1086,W
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00196_DS_
_00195_DS_:
;	.line	216; "onewire.c"	RomBytes[n] &= ~k;
	BANKSEL	r0x1080
	MOVF	r0x1080,W
	ADDLW	(_RomBytes + 0)
	MOVWF	r0x1082
	MOVLW	high (_RomBytes + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1084
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1084
	BTFSC	r0x1084,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1086
	MOVWF	r0x1086
	COMF	r0x107D,W
;;1	MOVWF	r0x1087
	ANDWF	r0x1086,F
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1084
	BTFSC	r0x1084,0
	BSF	STATUS,7
	MOVF	r0x1086,W
	BANKSEL	INDF
	MOVWF	INDF
_00196_DS_:
;	.line	218; "onewire.c"	ow_write_bit(g); // ROM search write
	BANKSEL	r0x1083
	MOVF	r0x1083,W
	PAGESEL	_ow_write_bit
	CALL	_ow_write_bit
	PAGESEL	$
;	.line	220; "onewire.c"	m++;        // Increment bit counter m
	BANKSEL	r0x1081
	INCF	r0x1081,F
;	.line	221; "onewire.c"	k = k << 1; // and shift the bit mask k
	MOVF	r0x107D,W
	MOVWF	r0x1082
	BCF	STATUS,0
	RLF	r0x1082,W
	MOVWF	r0x107D
;	.line	224; "onewire.c"	if(k == 0) {
	MOVF	r0x107D,W
	BTFSS	STATUS,2
	GOTO	_00203_DS_
;	.line	226; "onewire.c"	ow_crc(RomBytes[n]); // Accumulate the crc
	MOVF	r0x1080,W
	ADDLW	(_RomBytes + 0)
	MOVWF	r0x1082
	MOVLW	high (_RomBytes + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1083
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1083
	BTFSC	r0x1083,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1084
	MOVWF	r0x1084
	PAGESEL	_ow_crc
	CALL	_ow_crc
	PAGESEL	$
;	.line	227; "onewire.c"	n++;
	BANKSEL	r0x1080
	INCF	r0x1080,F
;	.line	228; "onewire.c"	k++;
	INCF	r0x107D,F
;;unsigned compare: left < lit(0x8=8), size=1
_00203_DS_:
;	.line	231; "onewire.c"	} while(n < 8); // Loop through until through all ROM bytes 0-7
	MOVLW	0x08
	BANKSEL	r0x1080
	SUBWF	r0x1080,W
	BTFSS	STATUS,0
	GOTO	_00202_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;;signed compare: left < lit(0x41=65), size=1, mask=ff
_00204_DS_:
;	.line	233; "onewire.c"	if(m < 65 || ow_dowcrc) // If search was unsuccessful then
	BANKSEL	r0x1081
	MOVF	r0x1081,W
	ADDLW	0x80
	ADDLW	0x3f
	BTFSS	STATUS,0
	GOTO	_00205_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
	BANKSEL	_ow_dowcrc
	MOVF	_ow_dowcrc,W
	BTFSC	STATUS,2
	GOTO	_00206_DS_
_00205_DS_:
;	.line	234; "onewire.c"	lastDiscrep = 0;      // reset the last Discrepancy to zero
	BANKSEL	_lastDiscrep
	CLRF	_lastDiscrep
	GOTO	_00207_DS_
_00206_DS_:
;	.line	237; "onewire.c"	lastDiscrep = discrepMarker;
	BANKSEL	r0x107E
	MOVF	r0x107E,W
	BANKSEL	_lastDiscrep
	MOVWF	_lastDiscrep
;	.line	238; "onewire.c"	doneFlag = (lastDiscrep == 0);
	BANKSEL	_doneFlag
	CLRF	_doneFlag
;	.line	239; "onewire.c"	nxt = 1; // Indicates search not yet complete, more parts remain
	BANKSEL	_lastDiscrep
	MOVF	_lastDiscrep,W
	BTFSS	STATUS,2
	GOTO	_00001_DS_
	BANKSEL	_doneFlag
	INCF	_doneFlag,F
_00001_DS_:
	MOVLW	0x01
	BANKSEL	r0x107F
	MOVWF	r0x107F
_00207_DS_:
;	.line	242; "onewire.c"	return nxt;
	BANKSEL	r0x107F
	MOVF	r0x107F,W
_00209_DS_:
;	.line	243; "onewire.c"	}
	RETURN	
; exit point of _ow_next

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;8 compiler assigned registers:
;   r0x1077
;   r0x1078
;   r0x1079
;   r0x107A
;   r0x107B
;   r0x107C
;   STK01
;   STK00
;; Starting pCode block
S_onewire__ow_crc	code
_ow_crc:
; 2 exit points
;	.line	147; "onewire.c"	ow_crc(uint8_t x) {
	BANKSEL	r0x1077
	MOVWF	r0x1077
;	.line	148; "onewire.c"	ow_dowcrc = ow_crctable[ow_dowcrc ^ x];
	BANKSEL	_ow_dowcrc
	MOVF	_ow_dowcrc,W
	BANKSEL	r0x1078
	MOVWF	r0x1078
	CLRF	r0x1079
	BTFSC	r0x1078,7
	DECF	r0x1079,F
;;101	MOVF	r0x1077,W
;;99	MOVWF	r0x107A
;;1	CLRF	r0x107B
;;100	MOVF	r0x107A,W
	MOVF	r0x1077,W
	XORWF	r0x1078,W
	MOVWF	r0x1077
	MOVLW	0x00
	XORWF	r0x1079,W
	MOVWF	r0x107C
	MOVF	r0x1077,W
	ADDLW	(_ow_crctable + 0)
	MOVWF	r0x1077
	MOVF	r0x107C,W
	BTFSC	STATUS,0
	INCFSZ	r0x107C,W
	ADDLW	high (_ow_crctable + 0)
	MOVWF	r0x107C
	MOVF	r0x1077,W
	MOVWF	STK01
	MOVF	r0x107C,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;	.line	150; "onewire.c"	return ow_dowcrc;
	BANKSEL	_ow_dowcrc
	MOVWF	_ow_dowcrc
;	.line	151; "onewire.c"	}
	RETURN	
; exit point of _ow_crc

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;6 compiler assigned registers:
;   r0x106C
;   STK00
;   r0x106D
;   r0x106E
;   r0x106F
;   r0x1070
;; Starting pCode block
S_onewire__ow_write_byte	code
_ow_write_byte:
; 2 exit points
;	.line	119; "onewire.c"	ow_write_byte(uint8_t val, BOOL power_on) {
	BANKSEL	r0x106C
	MOVWF	r0x106C
	MOVF	STK00,W
	MOVWF	r0x106D
;	.line	122; "onewire.c"	for(i = 0; i < 8; i++) {
	CLRF	r0x106E
	MOVF	r0x106D,W
	XORLW	0x01
	BTFSC	STATUS,2
	INCF	r0x106E,F
	CLRF	r0x106D
	CLRF	r0x106F
_00152_DS_:
;	.line	123; "onewire.c"	DQ_BIT = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,3
;	.line	124; "onewire.c"	DQ_TRIS = 0;
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,3
;	.line	126; "onewire.c"	delay_us(2);
	MOVLW	0x02
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	128; "onewire.c"	DQ_BIT = val & 1;
	BANKSEL	r0x106C
	MOVF	r0x106C,W
	MOVWF	r0x1070
	RRF	r0x1070,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,3
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,3
;;shiftRight_Left2ResultLit:5323: shCount=1, size=1, sign=0, same=1, offr=0
_00003_DS_:
;	.line	129; "onewire.c"	val >>= 1; // shift_right(&val, 1, 0);
	BCF	STATUS,0
	BANKSEL	r0x106C
	RRF	r0x106C,F
;	.line	131; "onewire.c"	delay_us(60);
	MOVLW	0x3c
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	133; "onewire.c"	if((i == 7) && (power_on == 1)) {
	BANKSEL	r0x106D
	MOVF	r0x106D,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x106F,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00148_DS_
	MOVF	r0x106E,W
	BTFSC	STATUS,2
	GOTO	_00148_DS_
;	.line	134; "onewire.c"	DQ_BIT = 1;
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,3
	GOTO	_00153_DS_
_00148_DS_:
;	.line	136; "onewire.c"	DQ_TRIS = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
;	.line	138; "onewire.c"	delay_us(2);
	MOVLW	0x02
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
_00153_DS_:
;	.line	122; "onewire.c"	for(i = 0; i < 8; i++) {
	BANKSEL	r0x106D
	INCF	r0x106D,F
	BTFSC	STATUS,2
	INCF	r0x106F,F
;;signed compare: left < lit(0x8=8), size=2, mask=ffff
	MOVF	r0x106F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00170_DS_
	MOVLW	0x08
	SUBWF	r0x106D,W
_00170_DS_:
	BTFSS	STATUS,0
	GOTO	_00152_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;	.line	141; "onewire.c"	}
	RETURN	
; exit point of _ow_write_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_read_bit
;   _delay_us
;   _ow_read_bit
;   _delay_us
;4 compiler assigned registers:
;   r0x108F
;   r0x1090
;   r0x1091
;   r0x1092
;; Starting pCode block
S_onewire__ow_read_byte	code
_ow_read_byte:
; 2 exit points
;	.line	103; "onewire.c"	uint8_t val = 0;
	BANKSEL	r0x108F
	CLRF	r0x108F
;	.line	105; "onewire.c"	for(i = 0; i < 8; i++) {
	CLRF	r0x1090
_00122_DS_:
;	.line	106; "onewire.c"	if(ow_read_bit())
	PAGESEL	_ow_read_bit
	CALL	_ow_read_bit
	PAGESEL	$
	BANKSEL	r0x1091
	MOVWF	r0x1091
	MOVF	r0x1091,W
	BTFSC	STATUS,2
	GOTO	_00120_DS_
;;103	MOVF	r0x1090,W
;	.line	107; "onewire.c"	val |= (0x01 << i);
	MOVLW	0x01
	MOVWF	r0x1092
;;102	MOVF	r0x1091,W
	MOVF	r0x1090,W
	MOVWF	r0x1091
	BTFSC	r0x1091,7
	GOTO	_00142_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00140_DS_
_00139_DS_:
	BANKSEL	r0x1092
	RLF	r0x1092,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00139_DS_
	GOTO	_00140_DS_
_00142_DS_:
	BCF	STATUS,0
	BANKSEL	r0x1092
	BTFSC	r0x1092,7
	BSF	STATUS,0
	RRF	r0x1092,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00142_DS_
_00140_DS_:
	BANKSEL	r0x108F
	MOVF	r0x108F,W
	MOVWF	r0x1091
	IORWF	r0x1092,W
	MOVWF	r0x108F
_00120_DS_:
;	.line	109; "onewire.c"	delay_us(120); // To finish time slot
	MOVLW	0x78
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	105; "onewire.c"	for(i = 0; i < 8; i++) {
	BANKSEL	r0x1090
	INCF	r0x1090,F
;;unsigned compare: left < lit(0x8=8), size=1
	MOVLW	0x08
	SUBWF	r0x1090,W
	BTFSS	STATUS,0
	GOTO	_00122_DS_
;;genSkipc:3257: created from rifx:0x7ffe9e83b960
;	.line	112; "onewire.c"	return val;
	MOVF	r0x108F,W
;	.line	113; "onewire.c"	}
	RETURN	
; exit point of _ow_read_byte

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   r0x1077
;; Starting pCode block
S_onewire__ow_write_bit	code
_ow_write_bit:
; 2 exit points
;	.line	84; "onewire.c"	ow_write_bit(uint8_t bitval) {
	BANKSEL	r0x1077
	MOVWF	r0x1077
;	.line	85; "onewire.c"	DQ_BIT = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,3
;	.line	86; "onewire.c"	DQ_TRIS = 0;
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,3
;	.line	88; "onewire.c"	if(bitval == 1) {
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00114_DS_
;	.line	89; "onewire.c"	delay_us(1); // 1uS min. Code relied on 8051 being slow.
	MOVLW	0x01
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	91; "onewire.c"	DQ_TRIS = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
_00114_DS_:
;	.line	94; "onewire.c"	delay_us(105); // Wait for end of timeslot
	MOVLW	0x69
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	96; "onewire.c"	DQ_TRIS = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
;	.line	97; "onewire.c"	}
	RETURN	
; exit point of _ow_write_bit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;1 compiler assigned register :
;   r0x1077
;; Starting pCode block
S_onewire__ow_read_bit	code
_ow_read_bit:
; 2 exit points
;	.line	70; "onewire.c"	DQ_BIT = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,3
;	.line	71; "onewire.c"	DQ_TRIS = 0;
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,3
;	.line	73; "onewire.c"	delay_us(3); // Added, 1uS min. Code relied on 8051 being slow.
	MOVLW	0x03
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	75; "onewire.c"	DQ_TRIS = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
;	.line	77; "onewire.c"	delay_us(5); // Read within 15uS from start of time slot
	MOVLW	0x05
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	79; "onewire.c"	return DQ_BIT; // input(DQ);
	BANKSEL	r0x1077
	CLRF	r0x1077
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,3
	GOTO	_00004_DS_
	BANKSEL	r0x1077
	INCF	r0x1077,F
_00004_DS_:
	BANKSEL	r0x1077
	MOVF	r0x1077,W
;	.line	80; "onewire.c"	}
	RETURN	
; exit point of _ow_read_bit

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;   _delay_us
;2 compiler assigned registers:
;   r0x106C
;   r0x106D
;; Starting pCode block
S_onewire__ow_reset	code
_ow_reset:
; 2 exit points
;	.line	50; "onewire.c"	DQ_BIT = 0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,3
;	.line	51; "onewire.c"	DQ_TRIS = 0;
	BANKSEL	_TRISCbits
	BCF	_TRISCbits,3
;	.line	53; "onewire.c"	delay_us(488); // Min. 480uS
	MOVLW	0xe8
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	55; "onewire.c"	DQ_TRIS = 1;
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,3
;	.line	57; "onewire.c"	delay_us(72); // Takes 15 to 60uS for devices to respond
	MOVLW	0x48
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	59; "onewire.c"	presence = DQ_BIT;
	BANKSEL	r0x106C
	CLRF	r0x106C
	BANKSEL	_PORTCbits
	BTFSS	_PORTCbits,3
	GOTO	_00005_DS_
	BANKSEL	r0x106C
	INCF	r0x106C,F
_00005_DS_:
	BANKSEL	r0x106C
	MOVF	r0x106C,W
	MOVWF	r0x106D
;	.line	61; "onewire.c"	delay_us(424); // Wait for end of timeslot
	MOVLW	0xa8
	PAGESEL	_delay_us
	CALL	_delay_us
	PAGESEL	$
;	.line	63; "onewire.c"	return presence;
	BANKSEL	r0x106D
	MOVF	r0x106D,W
;	.line	64; "onewire.c"	}
	RETURN	
; exit point of _ow_reset


;	code size estimation:
;	  496+  185 =   681 instructions ( 1732 byte)

	end
