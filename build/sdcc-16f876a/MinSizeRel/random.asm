;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"random.c"
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
	global	_random
	global	_random_init
	global	_a
	global	_b
	global	_c

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_random_0	udata
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_random_0	idata
_x
	db	0x00


ID_random_1	idata
_a
	db	0x00


ID_random_2	idata
_b
	db	0x00


ID_random_3	idata
_c
	db	0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_random	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
S_random__random	code
_random:
; 2 exit points
;	.line	23; "random.c"	x++;                    // x is incremented every round and is not affected by any other variable
	BANKSEL	_x
	INCF	_x,F
;	.line	24; "random.c"	a = (a ^ c ^ x);        // note the mix of addition and XOR
	BANKSEL	_c
	MOVF	_c,W
	BANKSEL	_a
	XORWF	_a,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	BANKSEL	_x
	XORWF	_x,W
	BANKSEL	_a
	MOVWF	_a
;	.line	25; "random.c"	b = (b + a);            // And the use of very few instructions
	MOVF	_a,W
	BANKSEL	_b
	ADDWF	_b,F
;;shiftRight_Left2ResultLit:5323: shCount=1, size=1, sign=0, same=0, offr=0
;	.line	26; "random.c"	c = (c + (b >> 1) ^ a); // the right shift is to ensure that high-order bits from b can affect
	BCF	STATUS,0
	RRF	_b,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	BANKSEL	_c
	ADDWF	_c,W
	BANKSEL	r0x1004
	MOVWF	r0x1004
	BANKSEL	_a
	MOVF	_a,W
	BANKSEL	r0x1004
	XORWF	r0x1004,W
	BANKSEL	_c
	MOVWF	_c
;	.line	27; "random.c"	return (c);             // low order bits of other variables
	MOVF	_c,W
;	.line	28; "random.c"	}
	RETURN	
; exit point of _random

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;   STK01
;   r0x1007
;; Starting pCode block
S_random__random_init	code
_random_init:
; 2 exit points
;	.line	8; "random.c"	random_init(uint8_t s1, uint8_t s2, uint8_t s3) // Can also be used to seed the rng with more entropy during use.
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1006
	MOVF	STK01,W
	MOVWF	r0x1007
;	.line	11; "random.c"	a ^= s1;
	MOVF	r0x1005,W
	BANKSEL	_a
	XORWF	_a,F
;	.line	12; "random.c"	b ^= s2;
	BANKSEL	r0x1006
	MOVF	r0x1006,W
	BANKSEL	_b
	XORWF	_b,F
;	.line	13; "random.c"	c ^= s3;
	BANKSEL	r0x1007
	MOVF	r0x1007,W
	BANKSEL	_c
	XORWF	_c,F
;	.line	15; "random.c"	x++;
	BANKSEL	_x
	INCF	_x,F
;	.line	16; "random.c"	a = (a ^ c ^ x);
	BANKSEL	_c
	MOVF	_c,W
	BANKSEL	_a
	XORWF	_a,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	BANKSEL	_x
	XORWF	_x,W
	BANKSEL	_a
	MOVWF	_a
;	.line	17; "random.c"	b = (b + a);
	MOVF	_a,W
	BANKSEL	_b
	ADDWF	_b,F
;;shiftRight_Left2ResultLit:5323: shCount=1, size=1, sign=0, same=0, offr=0
;	.line	18; "random.c"	c = (c + (b >> 1) ^ a);
	BCF	STATUS,0
	RRF	_b,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	BANKSEL	_c
	ADDWF	_c,W
	BANKSEL	r0x1005
	MOVWF	r0x1005
	BANKSEL	_a
	MOVF	_a,W
	BANKSEL	r0x1005
	XORWF	r0x1005,W
	BANKSEL	_c
	MOVWF	_c
;	.line	19; "random.c"	}
	RETURN	
; exit point of _random_init


;	code size estimation:
;	   46+   32 =    78 instructions (  220 byte)

	end
