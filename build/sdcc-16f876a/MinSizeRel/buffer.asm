;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"buffer.c"
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
	extern	_memcpy
	extern	_memmove
	extern	_strcpy
	extern	_strncpy
	extern	_strcat
	extern	_strncat
	extern	_memcmp
	extern	_strcmp
	extern	_strncmp
	extern	_strxfrm
	extern	_memchr
	extern	_strchr
	extern	_strcspn
	extern	_strpbrk
	extern	_strrchr
	extern	_strspn
	extern	_strstr
	extern	_strtok
	extern	_memset
	extern	_strlen
	extern	___memcpy
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
	extern	__gptrget1

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
	global	_buffer_puts
	global	_buffer_put
	global	_buffer_putch
	global	_buffer_flush
	global	_buffer_init
	global	_buffer

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_buffer_0	udata
_buffer	res	17

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_buffer_0	udata
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1016	res	1
r0x101D	res	1
r0x101C	res	1
r0x101B	res	1
r0x101E	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1024	res	1
r0x1025	res	1
r0x1026	res	1
r0x1019	res	1
r0x1018	res	1
r0x1017	res	1
r0x101A	res	1
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
code_buffer	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _buffer_putch
;   __gptrget1
;   _buffer_putch
;6 compiler assigned registers:
;   r0x1017
;   STK00
;   r0x1018
;   STK01
;   r0x1019
;   r0x101A
;; Starting pCode block
S_buffer__buffer_puts	code
_buffer_puts:
; 2 exit points
;	.line	56; "buffer.c"	buffer_puts(const char* x) {
	BANKSEL	r0x1017
	MOVWF	r0x1017
	MOVF	STK00,W
	MOVWF	r0x1018
	MOVF	STK01,W
	MOVWF	r0x1019
_00152_DS_:
;	.line	57; "buffer.c"	while(*x) {
	BANKSEL	r0x1019
	MOVF	r0x1019,W
	MOVWF	STK01
	MOVF	r0x1018,W
	MOVWF	STK00
	MOVF	r0x1017,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x101A
	MOVWF	r0x101A
	MOVF	r0x101A,W
	BTFSC	STATUS,2
	GOTO	_00154_DS_
;	.line	58; "buffer.c"	buffer_putch(*x);
	MOVF	r0x101A,W
	PAGESEL	_buffer_putch
	CALL	_buffer_putch
	PAGESEL	$
;	.line	59; "buffer.c"	++x;
	BANKSEL	r0x1019
	INCF	r0x1019,F
	BTFSC	STATUS,2
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1017,F
	GOTO	_00152_DS_
_00154_DS_:
;	.line	61; "buffer.c"	return 0;
	MOVLW	0x00
;	.line	62; "buffer.c"	}
	RETURN	
; exit point of _buffer_puts

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;15 compiler assigned registers:
;   r0x101B
;   STK00
;   r0x101C
;   STK01
;   r0x101D
;   STK02
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   r0x1026
;; Starting pCode block
S_buffer__buffer_put	code
_buffer_put:
; 2 exit points
;	.line	39; "buffer.c"	buffer_put(const char* buf, len_t len) {
	BANKSEL	r0x101B
	MOVWF	r0x101B
	MOVF	STK00,W
	MOVWF	r0x101C
	MOVF	STK01,W
	MOVWF	r0x101D
	MOVF	STK02,W
	MOVWF	r0x101E
;	.line	41; "buffer.c"	if(len > BUFFER_SIZE - buffer.n) // doesn't fit
	CLRF	r0x101F
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x101F
	SWAPF	r0x101F,F
	MOVLW	0x0f
	ANDWF	r0x101F,F
;;102	MOVF	r0x101F,W
	CLRF	r0x1021
;;101	MOVF	r0x1020,W
	MOVF	r0x101F,W
	MOVWF	r0x1020
	SUBLW	0x10
	MOVWF	r0x101F
	MOVLW	0x00
	BTFSS	STATUS,0
	INCF	r0x1021,W
	SUBLW	0x00
	MOVWF	r0x1022
	MOVF	r0x101E,W
	MOVWF	r0x1020
	CLRF	r0x1021
	MOVF	r0x1022,W
	ADDLW	0x80
	MOVWF	r0x1023
	MOVLW	0x00
	ADDLW	0x80
	SUBWF	r0x1023,W
	BTFSS	STATUS,2
	GOTO	_00147_DS_
	MOVF	r0x1020,W
	SUBWF	r0x101F,W
_00147_DS_:
	BTFSC	STATUS,0
	GOTO	_00136_DS_
;;genSkipc:3257: created from rifx:0x7ffd876e57c0
;	.line	42; "buffer.c"	return -1;
	MOVLW	0xff
	GOTO	_00132_DS_
_00136_DS_:
;	.line	43; "buffer.c"	for(i = 0; i < len; i++) buffer.x[buffer.n + i] = buf[i];
	BANKSEL	r0x101F
	CLRF	r0x101F
_00130_DS_:
	BANKSEL	r0x101E
	MOVF	r0x101E,W
	SUBWF	r0x101F,W
	BTFSC	STATUS,0
	GOTO	_00128_DS_
;;genSkipc:3257: created from rifx:0x7ffd876e57c0
	CLRF	r0x1020
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x1020
	SWAPF	r0x1020,F
	MOVLW	0x0f
	ANDWF	r0x1020,F
	MOVF	r0x1020,W
	MOVWF	r0x1021
	MOVF	r0x101F,W
	MOVWF	r0x1020
	ADDWF	r0x1021,F
	MOVF	r0x1021,W
	ADDLW	(_buffer + 0)
	MOVWF	r0x1021
	MOVLW	high (_buffer + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1020
	MOVF	r0x101F,W
	ADDWF	r0x101D,W
	MOVWF	r0x1022
	MOVF	r0x101C,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1023
	MOVF	r0x101B,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1024
	MOVF	r0x1022,W
	MOVWF	STK01
	MOVF	r0x1023,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1025
	MOVWF	r0x1025
	MOVF	r0x1021,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1020
	BTFSC	r0x1020,0
	BSF	STATUS,7
	MOVF	r0x1025,W
	BANKSEL	INDF
	MOVWF	INDF
	BANKSEL	r0x101F
	INCF	r0x101F,F
	GOTO	_00130_DS_
_00128_DS_:
;	.line	44; "buffer.c"	buffer.n += len;
	BANKSEL	r0x101D
	CLRF	r0x101D
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x101D
	SWAPF	r0x101D,F
	MOVLW	0x0f
	ANDWF	r0x101D,F
	MOVF	r0x101E,W
	ADDWF	r0x101D,W
	MOVWF	r0x101E
	ANDLW	0x0f
	MOVWF	r0x1026
	SWAPF	r0x1026,F
	MOVLW	0xf0
	ANDWF	r0x1026,F
	MOVLW	(_buffer + 16)
	ANDLW	0x0f
	IORWF	r0x1026,W
	BANKSEL	_buffer
	MOVWF	(_buffer + 16)
;	.line	45; "buffer.c"	return 0;
	MOVLW	0x00
_00132_DS_:
;	.line	46; "buffer.c"	}
	RETURN	
; exit point of _buffer_put

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;; Starting pCode block
S_buffer__buffer_putch	code
_buffer_putch:
; 2 exit points
;	.line	30; "buffer.c"	buffer_putch(char ch) {
	BANKSEL	r0x1011
	MOVWF	r0x1011
;	.line	31; "buffer.c"	if(BUFFER_SIZE - buffer.n <= 0)
	CLRF	r0x1012
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x1012
	SWAPF	r0x1012,F
	MOVLW	0x0f
	ANDWF	r0x1012,F
;;100	MOVF	r0x1012,W
	CLRF	r0x1014
;;99	MOVF	r0x1013,W
	MOVF	r0x1012,W
	MOVWF	r0x1013
	SUBLW	0x10
	MOVWF	r0x1012
	MOVLW	0x00
	BTFSS	STATUS,0
	INCF	r0x1014,W
	SUBLW	0x00
;;1	MOVWF	r0x1015
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00121_DS_
	MOVLW	0x01
	SUBWF	r0x1012,W
_00121_DS_:
	BTFSC	STATUS,0
	GOTO	_00114_DS_
;;genSkipc:3257: created from rifx:0x7ffd876e57c0
;	.line	32; "buffer.c"	return 0;
	MOVLW	0x00
	GOTO	_00115_DS_
_00114_DS_:
;	.line	33; "buffer.c"	buffer.x[buffer.n] = ch;
	BANKSEL	r0x1012
	CLRF	r0x1012
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x1012
	SWAPF	r0x1012,F
	MOVLW	0x0f
	ANDWF	r0x1012,F
	MOVF	r0x1012,W
	MOVWF	r0x1013
	MOVWF	r0x1012
	ADDLW	(_buffer + 0)
	MOVWF	r0x1013
	MOVLW	high (_buffer + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1014
	MOVF	r0x1013,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1014
	BTFSC	r0x1014,0
	BSF	STATUS,7
	MOVF	r0x1011,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	34; "buffer.c"	buffer.n++;
	BANKSEL	r0x1011
	CLRF	r0x1011
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	MOVWF	r0x1011
	SWAPF	r0x1011,F
	MOVLW	0x0f
	ANDWF	r0x1011,F
	INCF	r0x1011,F
	MOVF	r0x1011,W
	ANDLW	0x0f
	MOVWF	r0x1016
	SWAPF	r0x1016,F
	MOVLW	0xf0
	ANDWF	r0x1016,F
	MOVLW	(_buffer + 16)
	ANDLW	0x0f
	IORWF	r0x1016,W
	BANKSEL	_buffer
	MOVWF	(_buffer + 16)
;	.line	35; "buffer.c"	return 1;
	MOVLW	0x01
_00115_DS_:
;	.line	36; "buffer.c"	}
	RETURN	
; exit point of _buffer_putch

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_buffer__buffer_flush	code
_buffer_flush:
; 2 exit points
;	.line	25; "buffer.c"	BUFFER_CLEAR();
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	BANKSEL	_buffer
	MOVWF	(_buffer + 16)
	MOVLW	(_buffer + 16)
	ANDLW	0x0f
	MOVWF	(_buffer + 16)
;	.line	26; "buffer.c"	return 0;
	MOVLW	0x00
;	.line	27; "buffer.c"	}
	RETURN	
; exit point of _buffer_flush

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_buffer__buffer_init	code
_buffer_init:
; 2 exit points
;	.line	11; "buffer.c"	buffer.p = 0;
	MOVLW	(_buffer + 16)
	ANDLW	0xf0
	BANKSEL	_buffer
	MOVWF	(_buffer + 16)
;	.line	12; "buffer.c"	buffer.n = 0;
	MOVLW	(_buffer + 16)
	ANDLW	0x0f
	MOVWF	(_buffer + 16)
;	.line	13; "buffer.c"	}
	RETURN	
; exit point of _buffer_init


;	code size estimation:
;	  223+   29 =   252 instructions (  562 byte)

	end
