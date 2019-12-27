;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"delay.c"
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
	global	_delay_us
	global	_delay_ms

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_delay_0	udata
r0x1004	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
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
code_delay	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;5 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;; Starting pCode block
S_delay__delay_ms	code
_delay_ms:
; 2 exit points
;	.line	11; "delay.c"	delay_ms(unsigned int x) {
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	12; "delay.c"	unsigned char i = 255;
	MOVLW	0xff
	MOVWF	r0x1002
_00129_DS_:
;	.line	13; "delay.c"	for(x; x > 0; x--) {
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	IORWF	r0x1000,W
	BTFSC	STATUS,2
	GOTO	_00131_DS_
;	.line	14; "delay.c"	while(i > 0) i--;
	MOVF	r0x1002,W
	MOVWF	r0x1003
_00112_DS_:
	MOVLW	0x00
	BANKSEL	r0x1003
	IORWF	r0x1003,W
	BTFSC	STATUS,2
	GOTO	_00114_DS_
	DECF	r0x1003,F
	GOTO	_00112_DS_
_00114_DS_:
;	.line	16; "delay.c"	while(i > 0) i--;
	MOVLW	0xff
	BANKSEL	r0x1003
	MOVWF	r0x1003
_00115_DS_:
	MOVLW	0x00
	BANKSEL	r0x1003
	IORWF	r0x1003,W
	BTFSC	STATUS,2
	GOTO	_00117_DS_
	DECF	r0x1003,F
	GOTO	_00115_DS_
_00117_DS_:
;	.line	18; "delay.c"	while(i > 0) i--;
	MOVLW	0xff
	BANKSEL	r0x1003
	MOVWF	r0x1003
_00118_DS_:
	MOVLW	0x00
	BANKSEL	r0x1003
	IORWF	r0x1003,W
	BTFSC	STATUS,2
	GOTO	_00120_DS_
	DECF	r0x1003,F
	GOTO	_00118_DS_
_00120_DS_:
;	.line	20; "delay.c"	while(i > 0) i--;
	MOVLW	0xff
	BANKSEL	r0x1003
	MOVWF	r0x1003
_00121_DS_:
	MOVLW	0x00
	BANKSEL	r0x1003
	IORWF	r0x1003,W
	BTFSC	STATUS,2
	GOTO	_00123_DS_
	DECF	r0x1003,F
	GOTO	_00121_DS_
_00123_DS_:
;	.line	22; "delay.c"	while(i > 0) i--;
	MOVLW	0x32
	BANKSEL	r0x1003
	MOVWF	r0x1003
_00124_DS_:
	MOVLW	0x00
	BANKSEL	r0x1003
	IORWF	r0x1003,W
	BTFSC	STATUS,2
	GOTO	_00151_DS_
	DECF	r0x1003,F
	GOTO	_00124_DS_
_00151_DS_:
	BANKSEL	r0x1003
	MOVF	r0x1003,W
	MOVWF	r0x1002
;	.line	13; "delay.c"	for(x; x > 0; x--) {
	MOVLW	0xff
	ADDWF	r0x1001,F
	BTFSS	STATUS,0
	DECF	r0x1000,F
	GOTO	_00129_DS_
_00131_DS_:
;	.line	24; "delay.c"	}
	RETURN	
; exit point of _delay_ms

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1004
;; Starting pCode block
S_delay__delay_us	code
_delay_us:
; 2 exit points
;	.line	5; "delay.c"	delay_us(unsigned char x) {
	BANKSEL	r0x1004
	MOVWF	r0x1004
_00105_DS_:
;	.line	6; "delay.c"	while(x > 0) x--;
	MOVLW	0x00
	BANKSEL	r0x1004
	IORWF	r0x1004,W
	BTFSC	STATUS,2
	GOTO	_00107_DS_
	DECF	r0x1004,F
	GOTO	_00105_DS_
_00107_DS_:
	nop	
;	.line	8; "delay.c"	}
	RETURN	
; exit point of _delay_us


;	code size estimation:
;	   65+   14 =    79 instructions (  186 byte)

	end
