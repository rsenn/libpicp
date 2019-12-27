;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"ledsense.c"
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
	extern	_adc_init
	extern	_adc_read
	extern	_adc_disable
	extern	_adc_isr
	extern	_ow_search
	extern	_ow_reset
	extern	_ow_crc
	extern	_ow_next
	extern	_ow_read_byte
	extern	_ow_write_byte
	extern	_ow_access
	extern	_ds18b20_start_conversion
	extern	_ds18b20_value
	extern	_ds18b20_temperature
	extern	_lcd_init
	extern	_lcd_begin
	extern	_lcd_no_autoscroll
	extern	_lcd_autoscroll
	extern	_lcd_right_to_left
	extern	_lcd_left_to_right
	extern	_lcd_scroll_print_right
	extern	_lcd_scroll_print_left
	extern	_lcd_blink
	extern	_lcd_no_blink
	extern	_lcd_cursor
	extern	_lcd_no_cursor
	extern	_lcd_display
	extern	_lcd_no_display
	extern	_lcd_clear
	extern	_lcd_home
	extern	_lcd_print_number
	extern	_lcd_print_float
	extern	_lcd_puts
	extern	_lcd_gotoxy
	extern	_lcd_send
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
	extern	_control
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
	global	_ledsense_loop
	global	_ledsense_read
	global	_ledsense_charge
	global	_ledsense_emit

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_ledsense_0	udata
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1002	res	1
r0x1003	res	1
r0x1000	res	1
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
code_ledsense	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_ledsense__ledsense_loop	code
_ledsense_loop:
; 2 exit points
;	.line	44; "ledsense.c"	ledsense_loop() {}
	RETURN	
; exit point of _ledsense_loop

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _adc_read
;   _adc_read
;3 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;; Starting pCode block
S_ledsense__ledsense_read	code
_ledsense_read:
; 2 exit points
;	.line	35; "ledsense.c"	LS_K_TRIS = INPUT;
	BANKSEL	_TRISAbits
	BSF	_TRISAbits,1
;	.line	37; "ledsense.c"	return adc_read(1);
	MOVLW	0x01
	PAGESEL	_adc_read
	CALL	_adc_read
	PAGESEL	$
	BANKSEL	r0x1000
	MOVWF	r0x1000
	MOVF	STK00,W
;;1	MOVWF	r0x1001
	MOVWF	STK00
	MOVF	r0x1000,W
;	.line	38; "ledsense.c"	}
	RETURN	
; exit point of _ledsense_read

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;2 compiler assigned registers:
;   r0x1002
;   r0x1003
;; Starting pCode block
S_ledsense__ledsense_charge	code
_ledsense_charge:
; 2 exit points
;	.line	26; "ledsense.c"	LS_A_TRIS = LS_K_TRIS = OUTPUT;
	BANKSEL	_TRISAbits
	BCF	_TRISAbits,1
	BANKSEL	r0x1002
	CLRF	r0x1002
	BANKSEL	_TRISAbits
	BTFSS	_TRISAbits,1
	GOTO	_00001_DS_
	BANKSEL	r0x1002
	INCF	r0x1002,F
_00001_DS_:
	BANKSEL	r0x1002
	MOVF	r0x1002,W
	MOVWF	r0x1003
	RRF	r0x1003,W
	BTFSC	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_TRISAbits
	BCF	_TRISAbits,2
_00002_DS_:
	BTFSS	STATUS,0
	GOTO	_00003_DS_
	BANKSEL	_TRISAbits
	BSF	_TRISAbits,2
_00003_DS_:
;	.line	28; "ledsense.c"	LS_A_PIN = LOW;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,2
;	.line	29; "ledsense.c"	LS_K_PIN = HIGH;
	BSF	_PORTAbits,1
;	.line	30; "ledsense.c"	}
	RETURN	
; exit point of _ledsense_charge

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;3 compiler assigned registers:
;   r0x1004
;   r0x1005
;   r0x1006
;; Starting pCode block
S_ledsense__ledsense_emit	code
_ledsense_emit:
; 2 exit points
;	.line	16; "ledsense.c"	ledsense_emit(BOOL on) {
	BANKSEL	r0x1004
	MOVWF	r0x1004
;	.line	17; "ledsense.c"	LS_A_TRIS = LS_K_TRIS = OUTPUT;
	BANKSEL	_TRISAbits
	BCF	_TRISAbits,1
	BANKSEL	r0x1005
	CLRF	r0x1005
	BANKSEL	_TRISAbits
	BTFSS	_TRISAbits,1
	GOTO	_00004_DS_
	BANKSEL	r0x1005
	INCF	r0x1005,F
_00004_DS_:
	BANKSEL	r0x1005
	MOVF	r0x1005,W
	MOVWF	r0x1006
	RRF	r0x1006,W
	BTFSC	STATUS,0
	GOTO	_00005_DS_
	BANKSEL	_TRISAbits
	BCF	_TRISAbits,2
_00005_DS_:
	BTFSS	STATUS,0
	GOTO	_00006_DS_
	BANKSEL	_TRISAbits
	BSF	_TRISAbits,2
_00006_DS_:
;	.line	19; "ledsense.c"	LS_A_PIN = on;
	BANKSEL	r0x1004
	RRF	r0x1004,W
	BTFSC	STATUS,0
	GOTO	_00007_DS_
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,2
_00007_DS_:
	BTFSS	STATUS,0
	GOTO	_00008_DS_
	BANKSEL	_PORTAbits
	BSF	_PORTAbits,2
_00008_DS_:
;	.line	20; "ledsense.c"	LS_K_PIN = LOW;
	BANKSEL	_PORTAbits
	BCF	_PORTAbits,1
;	.line	21; "ledsense.c"	}
	RETURN	
; exit point of _ledsense_emit


;	code size estimation:
;	   50+   24 =    74 instructions (  196 byte)

	end
