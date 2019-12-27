;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"format.c"
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
	extern	_buffer_init
	extern	_buffer_flush
	extern	_buffer_putch
	extern	_buffer_put
	extern	_buffer_puts
	extern	_sinf
	extern	_cosf
	extern	_tanf
	extern	_cotf
	extern	_asinf
	extern	_acosf
	extern	_atanf
	extern	_atan2f
	extern	_sinhf
	extern	_coshf
	extern	_tanhf
	extern	_expf
	extern	_logf
	extern	_log10f
	extern	_powf
	extern	_sqrtf
	extern	_fabsf
	extern	_frexpf
	extern	_ldexpf
	extern	_ceilf
	extern	_floorf
	extern	_modff
	extern	_isnan
	extern	_isinf
	extern	__moduint
	extern	__divuint
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
	extern	_buffer
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
	global	_format_double
	global	_format_xint32
	global	_format_number
	global	_format_float

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_format_0	udata
r0x1040	res	1
r0x103F	res	1
r0x1041	res	1
r0x1042	res	1
r0x1043	res	1
r0x1044	res	1
r0x1045	res	1
r0x1046	res	1
r0x1048	res	1
r0x1049	res	1
r0x104A	res	1
r0x104B	res	1
r0x104C	res	1
r0x104D	res	1
r0x1051	res	1
r0x1050	res	1
r0x104F	res	1
r0x104E	res	1
r0x1052	res	1
r0x1053	res	1
r0x1033	res	1
r0x1032	res	1
r0x1031	res	1
r0x1030	res	1
r0x1037	res	1
r0x1036	res	1
r0x1035	res	1
r0x1034	res	1
r0x1039	res	1
r0x1038	res	1
r0x103D	res	1
r0x103C	res	1
r0x103B	res	1
r0x103A	res	1
r0x103E	res	1
r0x1023	res	1
r0x1022	res	1
r0x1021	res	1
r0x1020	res	1
r0x1027	res	1
r0x1026	res	1
r0x1025	res	1
r0x1024	res	1
r0x1029	res	1
r0x1028	res	1
r0x102D	res	1
r0x102C	res	1
r0x102B	res	1
r0x102A	res	1
r0x102F	res	1
r0x102E	res	1
_format_number_buf_65536_56	res	32
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
code_format	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _log10f
;   ___fs2sint
;   ___fslt
;   ___sint2fs
;   _powf
;   ___fsdiv
;   _floorf
;   ___fs2sint
;   ___sint2fs
;   ___fsmul
;   ___fssub
;   _buffer_putch
;   _buffer_putch
;   _log10f
;   ___fs2sint
;   ___fslt
;   ___sint2fs
;   _powf
;   ___fsdiv
;   _floorf
;   ___fs2sint
;   ___sint2fs
;   ___fsmul
;   ___fssub
;   _buffer_putch
;   _buffer_putch
;23 compiler assigned registers:
;   r0x1020
;   STK00
;   r0x1021
;   STK01
;   r0x1022
;   STK02
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
S_format__format_double	code
_format_double:
; 2 exit points
;	.line	77; "format.c"	format_double(double num) {
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
	MOVWF	r0x1021
	MOVF	STK01,W
	MOVWF	r0x1022
	MOVF	STK02,W
;	.line	78; "format.c"	short m = (short)log10(num);
	MOVWF	r0x1023
	MOVWF	STK02
	MOVF	r0x1022,W
	MOVWF	STK01
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x1020,W
	PAGESEL	_log10f
	CALL	_log10f
	PAGESEL	$
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	STK00,W
	MOVWF	r0x1025
	MOVF	STK01,W
	MOVWF	r0x1026
	MOVF	STK02,W
	MOVWF	r0x1027
	MOVWF	STK02
	MOVF	r0x1026,W
	MOVWF	STK01
	MOVF	r0x1025,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	___fs2sint
	CALL	___fs2sint
	PAGESEL	$
	BANKSEL	r0x1026
	MOVWF	r0x1026
	MOVF	STK00,W
	MOVWF	r0x1027
_00148_DS_:
;	.line	82; "format.c"	while(num > 0 + DBL_EPSILON) {
	MOVLW	0x00
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x34
	MOVWF	STK03
	BANKSEL	r0x1023
	MOVF	r0x1023,W
	MOVWF	STK02
	MOVF	r0x1022,W
	MOVWF	STK01
	MOVF	r0x1021,W
	MOVWF	STK00
	MOVF	r0x1020,W
	PAGESEL	___fslt
	CALL	___fslt
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1025,W
	BTFSC	STATUS,2
	GOTO	_00151_DS_
;	.line	83; "format.c"	double weight = pow(10.0l, m);
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVF	r0x1026,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
	MOVF	STK01,W
	MOVWF	r0x1024
	MOVF	STK02,W
	MOVWF	r0x1025
	MOVWF	STK06
	MOVF	r0x1024,W
	MOVWF	STK05
	MOVF	r0x1029,W
	MOVWF	STK04
	MOVF	r0x1028,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x20
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	_powf
	CALL	_powf
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
	MOVF	STK01,W
	MOVWF	r0x1024
	MOVF	STK02,W
	MOVWF	r0x1025
;	.line	84; "format.c"	digit = (short)floor(num / weight);
	MOVF	r0x1023,W
	MOVWF	STK06
	MOVF	r0x1022,W
	MOVWF	STK05
	MOVF	r0x1021,W
	MOVWF	STK04
	MOVF	r0x1020,W
	MOVWF	STK03
	MOVF	r0x1025,W
	MOVWF	STK02
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1029,W
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x102A
	MOVWF	r0x102A
	MOVF	STK00,W
	MOVWF	r0x102B
	MOVF	STK01,W
	MOVWF	r0x102C
	MOVF	STK02,W
	MOVWF	r0x102D
	MOVWF	STK02
	MOVF	r0x102C,W
	MOVWF	STK01
	MOVF	r0x102B,W
	MOVWF	STK00
	MOVF	r0x102A,W
	PAGESEL	_floorf
	CALL	_floorf
	PAGESEL	$
	BANKSEL	r0x102A
	MOVWF	r0x102A
	MOVF	STK00,W
	MOVWF	r0x102B
	MOVF	STK01,W
	MOVWF	r0x102C
	MOVF	STK02,W
	MOVWF	r0x102D
	MOVWF	STK02
	MOVF	r0x102C,W
	MOVWF	STK01
	MOVF	r0x102B,W
	MOVWF	STK00
	MOVF	r0x102A,W
	PAGESEL	___fs2sint
	CALL	___fs2sint
	PAGESEL	$
	BANKSEL	r0x102C
	MOVWF	r0x102C
	MOVF	STK00,W
;	.line	85; "format.c"	num -= (digit * weight);
	MOVWF	r0x102D
	MOVWF	STK00
	MOVF	r0x102C,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x102E
	MOVWF	r0x102E
	MOVF	STK00,W
	MOVWF	r0x102F
	MOVF	STK01,W
	MOVWF	r0x102A
	MOVF	STK02,W
	MOVWF	r0x102B
	MOVWF	STK06
	MOVF	r0x102A,W
	MOVWF	STK05
	MOVF	r0x102F,W
	MOVWF	STK04
	MOVF	r0x102E,W
	MOVWF	STK03
	MOVF	r0x1025,W
	MOVWF	STK02
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1029,W
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
	MOVF	STK01,W
	MOVWF	r0x1024
	MOVF	STK02,W
	MOVWF	r0x1025
	MOVF	r0x1023,W
	MOVWF	STK06
	MOVF	r0x1022,W
	MOVWF	STK05
	MOVF	r0x1021,W
	MOVWF	STK04
	MOVF	r0x1020,W
	MOVWF	STK03
	MOVF	r0x1025,W
	MOVWF	STK02
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1029,W
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	___fssub
	CALL	___fssub
	PAGESEL	$
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVF	STK00,W
	MOVWF	r0x1021
	MOVF	STK01,W
	MOVWF	r0x1022
	MOVF	STK02,W
	MOVWF	r0x1023
;	.line	86; "format.c"	buffer_putch((char)('0' + digit));
	MOVF	r0x102D,W
	MOVWF	r0x1025
	MOVLW	0x30
	ADDWF	r0x1025,W
	MOVWF	r0x102D
	MOVWF	r0x1025
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;	.line	87; "format.c"	if(m == 0)
	BANKSEL	r0x1027
	MOVF	r0x1027,W
	IORWF	r0x1026,W
	BTFSS	STATUS,2
	GOTO	_00147_DS_
;	.line	88; "format.c"	buffer_putch('.');
	MOVLW	0x2e
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
_00147_DS_:
;	.line	89; "format.c"	m--;
	MOVLW	0xff
	BANKSEL	r0x1027
	ADDWF	r0x1027,F
	BTFSS	STATUS,0
	DECF	r0x1026,F
	GOTO	_00148_DS_
_00151_DS_:
;	.line	91; "format.c"	}
	RETURN	
; exit point of _format_double

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _log10f
;   ___fs2sint
;   ___fslt
;   ___sint2fs
;   _powf
;   ___fsdiv
;   _floorf
;   ___fs2uchar
;   ___uchar2fs
;   ___fsmul
;   ___fssub
;   _buffer_putch
;   _buffer_putch
;   _log10f
;   ___fs2sint
;   ___fslt
;   ___sint2fs
;   _powf
;   ___fsdiv
;   _floorf
;   ___fs2uchar
;   ___uchar2fs
;   ___fsmul
;   ___fssub
;   _buffer_putch
;   _buffer_putch
;22 compiler assigned registers:
;   r0x1030
;   STK00
;   r0x1031
;   STK01
;   r0x1032
;   STK02
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;   r0x1037
;   STK06
;   STK05
;   STK04
;   STK03
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;   r0x103E
;; Starting pCode block
S_format__format_float	code
_format_float:
; 2 exit points
;	.line	59; "format.c"	format_float(/*putchar_fn* putchar_ptr,*/ float num) {
	BANKSEL	r0x1030
	MOVWF	r0x1030
	MOVF	STK00,W
	MOVWF	r0x1031
	MOVF	STK01,W
	MOVWF	r0x1032
	MOVF	STK02,W
;	.line	60; "format.c"	short m = (int)log10(num);
	MOVWF	r0x1033
	MOVWF	STK02
	MOVF	r0x1032,W
	MOVWF	STK01
	MOVF	r0x1031,W
	MOVWF	STK00
	MOVF	r0x1030,W
	PAGESEL	_log10f
	CALL	_log10f
	PAGESEL	$
	BANKSEL	r0x1034
	MOVWF	r0x1034
	MOVF	STK00,W
	MOVWF	r0x1035
	MOVF	STK01,W
	MOVWF	r0x1036
	MOVF	STK02,W
	MOVWF	r0x1037
	MOVWF	STK02
	MOVF	r0x1036,W
	MOVWF	STK01
	MOVF	r0x1035,W
	MOVWF	STK00
	MOVF	r0x1034,W
	PAGESEL	___fs2sint
	CALL	___fs2sint
	PAGESEL	$
	BANKSEL	r0x1036
	MOVWF	r0x1036
	MOVF	STK00,W
	MOVWF	r0x1037
_00138_DS_:
;	.line	64; "format.c"	while(num > 0 + FLT_EPSILON) {
	MOVLW	0x00
	MOVWF	STK06
	MOVLW	0x00
	MOVWF	STK05
	MOVLW	0x00
	MOVWF	STK04
	MOVLW	0x34
	MOVWF	STK03
	BANKSEL	r0x1033
	MOVF	r0x1033,W
	MOVWF	STK02
	MOVF	r0x1032,W
	MOVWF	STK01
	MOVF	r0x1031,W
	MOVWF	STK00
	MOVF	r0x1030,W
	PAGESEL	___fslt
	CALL	___fslt
	PAGESEL	$
	BANKSEL	r0x1035
	MOVWF	r0x1035
	MOVF	r0x1035,W
	BTFSC	STATUS,2
	GOTO	_00141_DS_
;	.line	65; "format.c"	float weight = pow(10.0l, m);
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1036,W
	PAGESEL	___sint2fs
	CALL	___sint2fs
	PAGESEL	$
	BANKSEL	r0x1038
	MOVWF	r0x1038
	MOVF	STK00,W
	MOVWF	r0x1039
	MOVF	STK01,W
	MOVWF	r0x1034
	MOVF	STK02,W
	MOVWF	r0x1035
	MOVWF	STK06
	MOVF	r0x1034,W
	MOVWF	STK05
	MOVF	r0x1039,W
	MOVWF	STK04
	MOVF	r0x1038,W
	MOVWF	STK03
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x20
	MOVWF	STK00
	MOVLW	0x41
	PAGESEL	_powf
	CALL	_powf
	PAGESEL	$
	BANKSEL	r0x1038
	MOVWF	r0x1038
	MOVF	STK00,W
	MOVWF	r0x1039
	MOVF	STK01,W
	MOVWF	r0x1034
	MOVF	STK02,W
	MOVWF	r0x1035
;	.line	66; "format.c"	digit = (char)floor(num / weight);
	MOVF	r0x1033,W
	MOVWF	STK06
	MOVF	r0x1032,W
	MOVWF	STK05
	MOVF	r0x1031,W
	MOVWF	STK04
	MOVF	r0x1030,W
	MOVWF	STK03
	MOVF	r0x1035,W
	MOVWF	STK02
	MOVF	r0x1034,W
	MOVWF	STK01
	MOVF	r0x1039,W
	MOVWF	STK00
	MOVF	r0x1038,W
	PAGESEL	___fsdiv
	CALL	___fsdiv
	PAGESEL	$
	BANKSEL	r0x103A
	MOVWF	r0x103A
	MOVF	STK00,W
	MOVWF	r0x103B
	MOVF	STK01,W
	MOVWF	r0x103C
	MOVF	STK02,W
	MOVWF	r0x103D
	MOVWF	STK02
	MOVF	r0x103C,W
	MOVWF	STK01
	MOVF	r0x103B,W
	MOVWF	STK00
	MOVF	r0x103A,W
	PAGESEL	_floorf
	CALL	_floorf
	PAGESEL	$
	BANKSEL	r0x103A
	MOVWF	r0x103A
	MOVF	STK00,W
	MOVWF	r0x103B
	MOVF	STK01,W
	MOVWF	r0x103C
	MOVF	STK02,W
	MOVWF	r0x103D
	MOVWF	STK02
	MOVF	r0x103C,W
	MOVWF	STK01
	MOVF	r0x103B,W
	MOVWF	STK00
	MOVF	r0x103A,W
	PAGESEL	___fs2uchar
	CALL	___fs2uchar
	PAGESEL	$
;	.line	67; "format.c"	num -= (digit * weight);
	BANKSEL	r0x103D
	MOVWF	r0x103D
	PAGESEL	___uchar2fs
	CALL	___uchar2fs
	PAGESEL	$
	BANKSEL	r0x103E
	MOVWF	r0x103E
	MOVF	STK00,W
	MOVWF	r0x103A
	MOVF	STK01,W
	MOVWF	r0x103B
	MOVF	STK02,W
	MOVWF	r0x103C
	MOVWF	STK06
	MOVF	r0x103B,W
	MOVWF	STK05
	MOVF	r0x103A,W
	MOVWF	STK04
	MOVF	r0x103E,W
	MOVWF	STK03
	MOVF	r0x1035,W
	MOVWF	STK02
	MOVF	r0x1034,W
	MOVWF	STK01
	MOVF	r0x1039,W
	MOVWF	STK00
	MOVF	r0x1038,W
	PAGESEL	___fsmul
	CALL	___fsmul
	PAGESEL	$
	BANKSEL	r0x1038
	MOVWF	r0x1038
	MOVF	STK00,W
	MOVWF	r0x1039
	MOVF	STK01,W
	MOVWF	r0x1034
	MOVF	STK02,W
	MOVWF	r0x1035
	MOVF	r0x1033,W
	MOVWF	STK06
	MOVF	r0x1032,W
	MOVWF	STK05
	MOVF	r0x1031,W
	MOVWF	STK04
	MOVF	r0x1030,W
	MOVWF	STK03
	MOVF	r0x1035,W
	MOVWF	STK02
	MOVF	r0x1034,W
	MOVWF	STK01
	MOVF	r0x1039,W
	MOVWF	STK00
	MOVF	r0x1038,W
	PAGESEL	___fssub
	CALL	___fssub
	PAGESEL	$
	BANKSEL	r0x1030
	MOVWF	r0x1030
	MOVF	STK00,W
	MOVWF	r0x1031
	MOVF	STK01,W
	MOVWF	r0x1032
	MOVF	STK02,W
	MOVWF	r0x1033
;	.line	68; "format.c"	buffer_putch('0' + digit);
	MOVF	r0x103D,W
	MOVWF	r0x1035
	MOVLW	0x30
	ADDWF	r0x1035,W
	MOVWF	r0x103D
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;	.line	69; "format.c"	if(m == 0)
	BANKSEL	r0x1037
	MOVF	r0x1037,W
	IORWF	r0x1036,W
	BTFSS	STATUS,2
	GOTO	_00137_DS_
;	.line	70; "format.c"	buffer_putch('.');
	MOVLW	0x2e
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
_00137_DS_:
;	.line	71; "format.c"	m--;
	MOVLW	0xff
	BANKSEL	r0x1037
	ADDWF	r0x1037,F
	BTFSS	STATUS,0
	DECF	r0x1036,F
	GOTO	_00138_DS_
_00141_DS_:
;	.line	73; "format.c"	}
	RETURN	
; exit point of _format_float

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _buffer_putch
;   _buffer_putch
;   _format_number
;   _format_number
;   _buffer_putch
;   _buffer_putch
;   _format_number
;   _format_number
;13 compiler assigned registers:
;   r0x104E
;   STK00
;   r0x104F
;   STK01
;   r0x1050
;   STK02
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;   r0x1055
;   r0x1056
;   r0x1057
;; Starting pCode block
S_format__format_xint32	code
_format_xint32:
; 2 exit points
;	.line	51; "format.c"	format_xint32(/*putchar_fn* putchar,*/ uint32_t x) {
	BANKSEL	r0x104E
	MOVWF	r0x104E
	MOVF	STK00,W
	MOVWF	r0x104F
	MOVF	STK01,W
	MOVWF	r0x1050
	MOVF	STK02,W
	MOVWF	r0x1051
;	.line	52; "format.c"	buffer_putch('0');
	MOVLW	0x30
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;	.line	53; "format.c"	buffer_putch('x');
	MOVLW	0x78
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;;113	MOVF	r0x104F,W
;;115	MOVF	r0x104E,W
;;1	CLRF	r0x1054
;;1	CLRF	r0x1055
;;101	MOVF	r0x1052,W
;;99	MOVWF	r0x1056
;;104	MOVF	r0x1053,W
;;102	MOVWF	r0x1057
;	.line	54; "format.c"	format_number((uint16_t)(x >> 16), 16, -4);
	MOVLW	0xfc
	MOVWF	STK02
	MOVLW	0x10
	MOVWF	STK01
;;100	MOVF	r0x1056,W
;;112	MOVF	r0x1052,W
	BANKSEL	r0x104F
	MOVF	r0x104F,W
	MOVWF	r0x1052
	MOVWF	STK00
;;103	MOVF	r0x1057,W
;;114	MOVF	r0x1053,W
	MOVF	r0x104E,W
	MOVWF	r0x1053
	PAGESEL	_format_number
	CALL	_format_number
	PAGESEL	$
;;109	MOVF	r0x1051,W
;;111	MOVF	r0x1050,W
;	.line	55; "format.c"	format_number((uint16_t)(x & 0xffff), 16, -4);
	MOVLW	0xfc
	MOVWF	STK02
	MOVLW	0x10
	MOVWF	STK01
;;108	MOVF	r0x1052,W
	BANKSEL	r0x1051
	MOVF	r0x1051,W
	MOVWF	r0x1052
	MOVWF	STK00
;;110	MOVF	r0x1053,W
	MOVF	r0x1050,W
	MOVWF	r0x1053
	PAGESEL	_format_number
	CALL	_format_number
	PAGESEL	$
;	.line	56; "format.c"	}
	RETURN	
; exit point of _format_xint32

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __divuint
;   _buffer_putch
;   _buffer_putch
;   __moduint
;   __divuint
;   _buffer_putch
;   _buffer_putch
;18 compiler assigned registers:
;   r0x103F
;   STK00
;   r0x1040
;   STK01
;   r0x1041
;   STK02
;   r0x1042
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;; Starting pCode block
S_format__format_number	code
_format_number:
; 2 exit points
;	.line	15; "format.c"	format_number(uint16_t n, uint8_t base, int8_t pad /*, int8_t pointpos*/) {
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVF	STK00,W
	MOVWF	r0x1040
	MOVF	STK01,W
	MOVWF	r0x1041
	MOVF	STK02,W
	MOVWF	r0x1042
;	.line	19; "format.c"	char padchar = ' ';
	MOVLW	0x20
	MOVWF	r0x1043
;;signed compare: left < lit(0x0=0), size=1, mask=ff
;	.line	21; "format.c"	if(pad < 0) {
	BSF	STATUS,0
	BTFSS	r0x1042,7
	BCF	STATUS,0
	BTFSS	STATUS,0
	GOTO	_00127_DS_
;;genSkipc:3257: created from rifx:0x7ffcaecd5a30
;	.line	22; "format.c"	pad = -pad;
	COMF	r0x1042,F
	INCF	r0x1042,F
;	.line	23; "format.c"	padchar = '0';
	MOVLW	0x30
	MOVWF	r0x1043
_00127_DS_:
;	.line	31; "format.c"	do {
	BANKSEL	r0x1044
	CLRF	r0x1044
;;106	MOVF	r0x1041,W
_00111_DS_:
;	.line	35; "format.c"	di = n % base;
	BANKSEL	r0x1046
	CLRF	r0x1046
;;105	MOVF	r0x1045,W
	MOVF	r0x1041,W
	MOVWF	r0x1045
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1040,W
	MOVWF	STK00
	MOVF	r0x103F,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x1047
	MOVF	STK00,W
	BANKSEL	r0x1048
	MOVWF	r0x1048
	MOVWF	r0x1049
;	.line	36; "format.c"	buf[i++] = (di < 10 ? (uint8_t)'0' + di : (uint8_t)'A' + di - 10);
	MOVF	r0x1044,W
	MOVWF	r0x104A
	MOVWF	r0x1048
	INCF	r0x1044,F
;;107	MOVF	r0x1048,W
	CLRF	r0x104B
	BTFSC	r0x104A,7
	DECF	r0x104B,F
	MOVF	r0x104A,W
	ADDLW	(_format_number_buf_65536_56 + 0)
	MOVWF	r0x104A
	MOVLW	high (_format_number_buf_65536_56 + 0)
	MOVWF	r0x1048
	MOVF	r0x104B,W
	BTFSC	STATUS,0
	INCFSZ	r0x104B,W
	ADDWF	r0x1048,F
;;unsigned compare: left < lit(0xA=10), size=1
	MOVLW	0x0a
	SUBWF	r0x1049,W
	BTFSC	STATUS,0
	GOTO	_00123_DS_
;;genSkipc:3257: created from rifx:0x7ffcaecd5a30
	MOVLW	0x30
	ADDWF	r0x1049,W
	MOVWF	r0x104B
	GOTO	_00124_DS_
_00123_DS_:
	BANKSEL	r0x1049
	MOVF	r0x1049,W
	MOVWF	r0x104C
	MOVLW	0x37
	ADDWF	r0x104C,W
	MOVWF	r0x104B
_00124_DS_:
	BANKSEL	r0x104A
	MOVF	r0x104A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1048
	BTFSC	r0x1048,0
	BSF	STATUS,7
	MOVF	r0x104B,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	38; "format.c"	n /= base;
	BANKSEL	r0x1045
	MOVF	r0x1045,W
	MOVWF	STK02
	MOVF	r0x1046,W
	MOVWF	STK01
	MOVF	r0x1040,W
	MOVWF	STK00
	MOVF	r0x103F,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVF	STK00,W
;	.line	39; "format.c"	} while(n > 0);
	MOVWF	r0x1040
	IORWF	r0x103F,W
	BTFSS	STATUS,2
	GOTO	_00111_DS_
;	.line	41; "format.c"	while(pad-- > i) buffer_putch(padchar);
	MOVF	r0x1044,W
	MOVWF	r0x1040
	MOVF	r0x1042,W
	MOVWF	r0x103F
_00114_DS_:
	BANKSEL	r0x1040
	MOVF	r0x1040,W
	ADDLW	0x80
	MOVWF	r0x104D
	MOVF	r0x103F,W
	ADDLW	0x80
	SUBWF	r0x104D,W
	BTFSC	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3257: created from rifx:0x7ffcaecd5a30
	DECF	r0x103F,F
	MOVF	r0x1043,W
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
	GOTO	_00114_DS_
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x1=1), size=1, mask=ff
_00119_DS_:
;	.line	43; "format.c"	for(; i > 0; i--) {
	BANKSEL	r0x1040
	MOVF	r0x1040,W
	ADDLW	0x80
	ADDLW	0x7f
	BTFSS	STATUS,0
	GOTO	_00121_DS_
;;genSkipc:3257: created from rifx:0x7ffcaecd5a30
;	.line	44; "format.c"	buffer_putch((char)buf[(int16_t)i - 1]);
	DECF	r0x1040,W
	MOVWF	r0x103F
	MOVWF	r0x1041
	CLRF	r0x1042
	BTFSC	r0x1041,7
	DECF	r0x1042,F
	MOVF	r0x1041,W
	ADDLW	(_format_number_buf_65536_56 + 0)
	MOVWF	r0x1041
	MOVF	r0x1042,W
	BTFSC	STATUS,0
	INCFSZ	r0x1042,W
	ADDLW	high (_format_number_buf_65536_56 + 0)
	MOVWF	r0x1042
	MOVF	r0x1041,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1042
	BTFSC	r0x1042,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1043
	MOVWF	r0x1043
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;	.line	43; "format.c"	for(; i > 0; i--) {
	BANKSEL	r0x103F
	MOVF	r0x103F,W
	MOVWF	r0x1040
	GOTO	_00119_DS_
_00121_DS_:
;	.line	47; "format.c"	}
	RETURN	
; exit point of _format_number

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_format__format_putchar	code
_format_putchar:
; 2 exit points
;	.line	9; "format.c"	}
	RETURN	
; exit point of _format_putchar


;	code size estimation:
;	  567+  119 =   686 instructions ( 1610 byte)

	end
