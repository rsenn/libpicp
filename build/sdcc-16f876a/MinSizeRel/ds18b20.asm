;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"ds18b20.c"
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
	extern	_ow_search
	extern	_ow_reset
	extern	_ow_crc
	extern	_ow_next
	extern	_ow_read_byte
	extern	_ow_write_byte
	extern	_ow_access
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
	global	_ds18b20_temperature
	global	_ds18b20_value
	global	_ds18b20_start_conversion

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_ds18b20_0	udata
r0x1017	res	1
r0x1018	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x100A	res	1
r0x1009	res	1
r0x100B	res	1
r0x100D	res	1
r0x100C	res	1
r0x100F	res	1
r0x100E	res	1
r0x1010	res	1
_ds18b20_value_scratch_65536_35	res	9
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
code_ds18b20	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   ___uint2fs
;   ___sint2fs
;   ___fsdiv
;   ___fslt
;   ___fsadd
;   ___fsdiv
;   ___fssub
;   ___fsdiv
;   ___fssub
;   ___uint2fs
;   ___sint2fs
;   ___fsdiv
;   ___fslt
;   ___fsadd
;   ___fsdiv
;   ___fssub
;   ___fsdiv
;   ___fssub
;15 compiler assigned registers:
;   r0x1009
;   STK00
;   r0x100A
;   STK01
;   r0x100B
;   r0x100C
;   r0x100D
;   STK02
;   r0x100E
;   r0x100F
;   r0x1010
;   STK06
;   STK05
;   STK04
;   STK03
;; Starting pCode block
S_ds18b20__ds18b20_temperature	code
_ds18b20_temperature:
; 2 exit points
;	.line	55; "ds18b20.c"	ds18b20_temperature(uint16_t value, uint8_t shift) {
	BANKSEL	r0x1009
	MOVWF	r0x1009
	MOVF	STK00,W
	MOVWF	r0x100A
	MOVF	STK01,W
	MOVWF	r0x100B
;	.line	58; "ds18b20.c"	t = (double)value;
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVF	r0x1009,W
	PAGESEL	___uint2fs
	CALL	___uint2fs
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
;	.line	60; "ds18b20.c"	if(shift)
	MOVF	r0x100B,W
	BTFSC	STATUS,2
	GOTO	_00132_DS_
;	.line	61; "ds18b20.c"	t /= (1 << shift);
	MOVLW	0x00
	MOVWF	r0x100E
	MOVLW	0x01
	MOVWF	r0x100F
	MOVF	r0x100B,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00149_DS_
_00148_DS_:
	BANKSEL	r0x100F
	RLF	r0x100F,F
	RLF	r0x100E,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00148_DS_
_00149_DS_:
	BANKSEL	r0x100F
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVF	r0x100E,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVF	r0x100A,W
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x100D,W
	MOVWF	STK04
	MOVF	r0x100C,W
	MOVWF	STK03
	MOVF	r0x100B,W
	MOVWF	STK02
	MOVF	r0x100F,W
	MOVWF	STK01
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x1010,W
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
_00132_DS_:
;	.line	63; "ds18b20.c"	if(t >= 0)
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x100D,W
	MOVWF	STK04
	MOVF	r0x100C,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	___fslt
	CALL	___fslt
	PAGESEL	$
	BANKSEL	r0x100B
	MOVWF	r0x100B
	MOVF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00134_DS_
;	.line	64; "ds18b20.c"	t = (t + 8) / 16;
	MOVF	r0x100A,W
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x100D,W
	MOVWF	STK04
	MOVF	r0x100C,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	___fsadd
	CALL	___fsadd
	PAGESEL	$
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVWF	STK06
	MOVF	r0x100F,W
	MOVWF	STK05
	MOVF	r0x100E,W
	MOVWF	STK04
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x80
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100B
	GOTO	_00135_DS_
_00134_DS_:
;	.line	67; "ds18b20.c"	t = (t - 8) / 16;
	BANKSEL	r0x100A
	MOVF	r0x100A,W
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x100D,W
	MOVWF	STK04
	MOVF	r0x100C,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	___fssub
	CALL	___fssub
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	STK00,W
	MOVWF	r0x100D
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
	MOVWF	r0x100A
	MOVWF	STK06
	MOVF	r0x1009,W
	MOVWF	STK05
	MOVF	r0x100D,W
	MOVWF	STK04
	MOVF	r0x100C,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x80
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x1010
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100F
	MOVF	STK02,W
	MOVWF	r0x100B
_00135_DS_:
;	.line	69; "ds18b20.c"	t -= 0.5;
	BANKSEL	r0x100B
	MOVF	r0x100B,W
	MOVWF	STK06
	MOVF	r0x100F,W
	MOVWF	STK05
	MOVF	r0x100E,W
	MOVWF	STK04
	MOVF	r0x1010,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x3f
	PAGESEL	___fssub
	CALL	___fssub
	PAGESEL	$
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100B
	MOVF	STK01,W
	MOVWF	r0x1009
	MOVF	STK02,W
;	.line	71; "ds18b20.c"	return t;
	MOVWF	r0x100A
	MOVWF	STK02
	MOVF	r0x1009,W
	MOVWF	STK01
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100D,W
;	.line	72; "ds18b20.c"	}
	RETURN	
; exit point of _ds18b20_temperature

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_reset
;   _ow_write_byte
;   _ow_write_byte
;   _ow_read_byte
;   _ow_read_byte
;   _ow_reset
;   _ow_reset
;   _ow_write_byte
;   _ow_write_byte
;   _ow_read_byte
;   _ow_read_byte
;   _ow_reset
;7 compiler assigned registers:
;   STK00
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
S_ds18b20__ds18b20_value	code
_ds18b20_value:
; 2 exit points
;	.line	25; "ds18b20.c"	ow_reset(); /*if(ow_reset())
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
;	.line	31; "ds18b20.c"	ow_write_byte(OW_SKIP_ROM, 0);
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0xcc
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	32; "ds18b20.c"	ow_write_byte(DS18B20_READ_SCRATCHPAD, 0); // Read scratch pad command
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0xbe
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	36; "ds18b20.c"	for(i = 0; i <= 7; i++) {
	BANKSEL	r0x1011
	CLRF	r0x1011
	CLRF	r0x1012
_00113_DS_:
;	.line	37; "ds18b20.c"	scratch[i] = ow_read_byte();
	BANKSEL	r0x1011
	MOVF	r0x1011,W
	ADDLW	(_ds18b20_value_scratch_65536_35 + 0)
	MOVWF	r0x1013
	MOVLW	high (_ds18b20_value_scratch_65536_35 + 0)
	MOVWF	r0x1014
	MOVF	r0x1012,W
	BTFSC	STATUS,0
	INCFSZ	r0x1012,W
	ADDWF	r0x1014,F
	PAGESEL	_ow_read_byte
	CALL	_ow_read_byte
	PAGESEL	$
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVF	r0x1013,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1014
	BTFSC	r0x1014,0
	BSF	STATUS,7
	MOVF	r0x1015,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	36; "ds18b20.c"	for(i = 0; i <= 7; i++) {
	BANKSEL	r0x1011
	INCF	r0x1011,F
	BTFSC	STATUS,2
	INCF	r0x1012,F
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x8=8), size=2, mask=ffff
	MOVF	r0x1012,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00126_DS_
	MOVLW	0x08
	SUBWF	r0x1011,W
_00126_DS_:
	BTFSS	STATUS,0
	GOTO	_00113_DS_
;;genSkipc:3257: created from rifx:0x7fffec5f8050
;	.line	41; "ds18b20.c"	scratch[8] = ow_read_byte(); // Get crc byte
	PAGESEL	_ow_read_byte
	CALL	_ow_read_byte
	PAGESEL	$
	BANKSEL	r0x1011
	MOVWF	r0x1011
	BANKSEL	_ds18b20_value_scratch_65536_35
	MOVWF	(_ds18b20_value_scratch_65536_35 + 8)
;	.line	42; "ds18b20.c"	ow_reset();
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
;	.line	48; "ds18b20.c"	{ v = (((uint16_t)(unsigned)scratch[1] << 8) | (unsigned)scratch[0]); }
	BANKSEL	_ds18b20_value_scratch_65536_35
	MOVF	(_ds18b20_value_scratch_65536_35 + 1),W
	BANKSEL	r0x1011
	MOVWF	r0x1011
	MOVWF	r0x1014
	MOVWF	r0x1012
	CLRF	r0x1013
;;99	MOVF	r0x1012,W
	CLRF	r0x1011
	BANKSEL	_ds18b20_value_scratch_65536_35
	MOVF	(_ds18b20_value_scratch_65536_35 + 0),W
	BANKSEL	r0x1012
	MOVWF	r0x1012
	MOVWF	r0x1015
	IORWF	r0x1011,F
	MOVLW	0x00
	IORWF	r0x1014,F
;	.line	50; "ds18b20.c"	return v;
	MOVF	r0x1011,W
	MOVWF	STK00
	MOVF	r0x1014,W
;	.line	51; "ds18b20.c"	}
	RETURN	
; exit point of _ds18b20_value

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ow_reset
;   _ow_write_byte
;   _ow_write_byte
;   _ow_reset
;   _ow_write_byte
;   _ow_write_byte
;3 compiler assigned registers:
;   STK00
;   r0x1017
;   r0x1018
;; Starting pCode block
S_ds18b20__ds18b20_start_conversion	code
_ds18b20_start_conversion:
; 2 exit points
;	.line	7; "ds18b20.c"	ds18b20_start_conversion(int8_t actNumROM, BOOL parasite_power) {
	MOVF	STK00,W
	BANKSEL	r0x1017
	MOVWF	r0x1017
;	.line	8; "ds18b20.c"	if(!ow_reset()) {                                   // If a device is present
	PAGESEL	_ow_reset
	CALL	_ow_reset
	PAGESEL	$
	BANKSEL	r0x1018
	MOVWF	r0x1018
	MOVF	r0x1018,W
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	9; "ds18b20.c"	ow_write_byte(OW_SKIP_ROM, 0);                    // Skip Rom command
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0xcc
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	10; "ds18b20.c"	ow_write_byte(DS18B20_CONVERT_T, parasite_power); // Temperature convert command
	BANKSEL	r0x1017
	MOVF	r0x1017,W
	MOVWF	STK00
	MOVLW	0x44
	PAGESEL	_ow_write_byte
	CALL	_ow_write_byte
	PAGESEL	$
;	.line	12; "ds18b20.c"	return 1;
	MOVLW	0x01
	GOTO	_00107_DS_
_00106_DS_:
;	.line	15; "ds18b20.c"	return 0;
	MOVLW	0x00
_00107_DS_:
;	.line	16; "ds18b20.c"	}
	RETURN	
; exit point of _ds18b20_start_conversion


;	code size estimation:
;	  287+   67 =   354 instructions (  842 byte)

	end
