;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"midi.c"
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
	extern	_uart_putch
	extern	_uart_getch
	extern	_uart_poll
	extern	_uart_init
	extern	_uart_isr
	extern	_uart_enable
	extern	_uart_disable
	extern	_uart_puts
	extern	_uart_puts2
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
	extern	_uart_brg
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
	global	_midi_send

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_midi_0	udata
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1005	res	1
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
code_midi	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _00107_DS_
;   _00109_DS_
;   _00111_DS_
;   _00107_DS_
;   _00109_DS_
;   _00111_DS_
;11 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   STK01
;   r0x1002
;   STK02
;   r0x1003
;   STK03
;   r0x1004
;   STK04
;   r0x1005
;; Starting pCode block
S_midi__midi_send	code
_midi_send:
; 2 exit points
;	.line	6; "midi.c"	midi_send(const putch_ptr putch, uint8_t cmd, uint8_t d1, uint8_t d2, uint8_t chan) {
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
	MOVF	STK01,W
	MOVWF	r0x1002
	MOVF	STK02,W
;;1	MOVWF	r0x1003
	MOVF	STK03,W
;;1	MOVWF	r0x1004
	MOVF	STK04,W
	MOVWF	r0x1005
;	.line	7; "midi.c"	putch((cmd & 0b11110000) | (chan & 0b1111));
	MOVLW	0xf0
	ANDWF	r0x1002,F
	MOVLW	0x0f
	ANDWF	r0x1005,F
	MOVF	r0x1005,W
	IORWF	r0x1002,F
	CALL	_00107_DS_
	PAGESEL	_00108_DS_
	GOTO	_00108_DS_
_00107_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	BANKSEL	PCLATH
	MOVWF	PCLATH
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	PCL
	MOVWF	PCL
_00108_DS_:
;	.line	8; "midi.c"	putch(d1);
	CALL	_00109_DS_
	PAGESEL	_00110_DS_
	GOTO	_00110_DS_
_00109_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	BANKSEL	PCLATH
	MOVWF	PCLATH
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	PCL
	MOVWF	PCL
_00110_DS_:
;	.line	9; "midi.c"	putch(d2);
	CALL	_00111_DS_
	PAGESEL	_00105_DS_
	GOTO	_00105_DS_
_00111_DS_:
	BANKSEL	r0x1000
	MOVF	r0x1000,W
	BANKSEL	PCLATH
	MOVWF	PCLATH
	BANKSEL	r0x1001
	MOVF	r0x1001,W
	BANKSEL	PCL
	MOVWF	PCL
_00105_DS_:
;	.line	10; "midi.c"	}
	RETURN	
; exit point of _midi_send


;	code size estimation:
;	   34+   16 =    50 instructions (  132 byte)

	end
