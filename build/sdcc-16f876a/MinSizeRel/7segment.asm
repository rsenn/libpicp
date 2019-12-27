;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"7segment.c"
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
	extern	_display_init
	extern	_display_set
	extern	_display_number
	extern	_atof
	extern	_atoi
	extern	_atol
	extern	_strtol
	extern	_strtoul
	extern	__uitoa
	extern	__itoa
	extern	__ultoa
	extern	__ltoa
	extern	_rand
	extern	_srand
	extern	_calloc
	extern	_malloc
	extern	_realloc
	extern	_free
	extern	_bsearch
	extern	_qsort
	extern	_abs
	extern	_labs
	extern	_mblen
	extern	_mbtowc
	extern	_wctomb
	extern	_mbstowcs
	extern	_wcstombs
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
	extern	_display_buffer
	extern	_display_multiplex
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
	global	_aligned_alloc
	global	_button_state
	global	_button_flags

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_7segment_0	udata
_button_state	res	1

UD_7segment_1	udata
_button_flags	res	1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_7segment_0	udata
r0x1001	res	1
r0x1002	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_7segment	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1001
;   r0x1002
;; Starting pCode block
S_7segment__button_pressed	code
_button_pressed:
; 2 exit points
;	.line	115; "7segment.h"	button_pressed(uint8_t b) {
	BANKSEL	r0x1001
	MOVWF	r0x1001
;	.line	117; "7segment.h"	st = (button_state & b);
	BANKSEL	_button_state
	MOVF	_button_state,W
	BANKSEL	r0x1001
	ANDWF	r0x1001,F
	MOVF	r0x1001,W
	MOVWF	r0x1002
;	.line	118; "7segment.h"	if(st) {
	MOVF	r0x1001,W
;	.line	119; "7segment.h"	button_state = 0;
	BTFSC	STATUS,2
	GOTO	_00001_DS_
;	.line	121; "7segment.h"	return st;
	BANKSEL	_button_state
	CLRF	_button_state
_00001_DS_:
	BANKSEL	r0x1002
	MOVF	r0x1002,W
;	.line	122; "7segment.h"	}
	RETURN	
; exit point of _button_pressed


;	code size estimation:
;	   11+    5 =    16 instructions (   42 byte)

	end
