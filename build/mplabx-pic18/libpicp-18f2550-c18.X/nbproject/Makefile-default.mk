#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=lib
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=lib
DEBUGGABLE_SUFFIX=
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=/home/roman/Dokumente/Sources/libpicp/7segment.c /home/roman/Dokumente/Sources/libpicp/adc.c /home/roman/Dokumente/Sources/libpicp/buffer.c /home/roman/Dokumente/Sources/libpicp/comparator.c /home/roman/Dokumente/Sources/libpicp/delay.c /home/roman/Dokumente/Sources/libpicp/ds18b20.c /home/roman/Dokumente/Sources/libpicp/format.c /home/roman/Dokumente/Sources/libpicp/lcd44780.c /home/roman/Dokumente/Sources/libpicp/lcd5110.c /home/roman/Dokumente/Sources/libpicp/ledsense.c /home/roman/Dokumente/Sources/libpicp/midi.c /home/roman/Dokumente/Sources/libpicp/onewire.c /home/roman/Dokumente/Sources/libpicp/pwm.c /home/roman/Dokumente/Sources/libpicp/random.c /home/roman/Dokumente/Sources/libpicp/ser.c /home/roman/Dokumente/Sources/libpicp/softpwm.c /home/roman/Dokumente/Sources/libpicp/softser.c /home/roman/Dokumente/Sources/libpicp/timer.c /home/roman/Dokumente/Sources/libpicp/uart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/40321244/7segment.o ${OBJECTDIR}/_ext/40321244/adc.o ${OBJECTDIR}/_ext/40321244/buffer.o ${OBJECTDIR}/_ext/40321244/comparator.o ${OBJECTDIR}/_ext/40321244/delay.o ${OBJECTDIR}/_ext/40321244/ds18b20.o ${OBJECTDIR}/_ext/40321244/format.o ${OBJECTDIR}/_ext/40321244/lcd44780.o ${OBJECTDIR}/_ext/40321244/lcd5110.o ${OBJECTDIR}/_ext/40321244/ledsense.o ${OBJECTDIR}/_ext/40321244/midi.o ${OBJECTDIR}/_ext/40321244/onewire.o ${OBJECTDIR}/_ext/40321244/pwm.o ${OBJECTDIR}/_ext/40321244/random.o ${OBJECTDIR}/_ext/40321244/ser.o ${OBJECTDIR}/_ext/40321244/softpwm.o ${OBJECTDIR}/_ext/40321244/softser.o ${OBJECTDIR}/_ext/40321244/timer.o ${OBJECTDIR}/_ext/40321244/uart.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/40321244/7segment.o.d ${OBJECTDIR}/_ext/40321244/adc.o.d ${OBJECTDIR}/_ext/40321244/buffer.o.d ${OBJECTDIR}/_ext/40321244/comparator.o.d ${OBJECTDIR}/_ext/40321244/delay.o.d ${OBJECTDIR}/_ext/40321244/ds18b20.o.d ${OBJECTDIR}/_ext/40321244/format.o.d ${OBJECTDIR}/_ext/40321244/lcd44780.o.d ${OBJECTDIR}/_ext/40321244/lcd5110.o.d ${OBJECTDIR}/_ext/40321244/ledsense.o.d ${OBJECTDIR}/_ext/40321244/midi.o.d ${OBJECTDIR}/_ext/40321244/onewire.o.d ${OBJECTDIR}/_ext/40321244/pwm.o.d ${OBJECTDIR}/_ext/40321244/random.o.d ${OBJECTDIR}/_ext/40321244/ser.o.d ${OBJECTDIR}/_ext/40321244/softpwm.o.d ${OBJECTDIR}/_ext/40321244/softser.o.d ${OBJECTDIR}/_ext/40321244/timer.o.d ${OBJECTDIR}/_ext/40321244/uart.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/40321244/7segment.o ${OBJECTDIR}/_ext/40321244/adc.o ${OBJECTDIR}/_ext/40321244/buffer.o ${OBJECTDIR}/_ext/40321244/comparator.o ${OBJECTDIR}/_ext/40321244/delay.o ${OBJECTDIR}/_ext/40321244/ds18b20.o ${OBJECTDIR}/_ext/40321244/format.o ${OBJECTDIR}/_ext/40321244/lcd44780.o ${OBJECTDIR}/_ext/40321244/lcd5110.o ${OBJECTDIR}/_ext/40321244/ledsense.o ${OBJECTDIR}/_ext/40321244/midi.o ${OBJECTDIR}/_ext/40321244/onewire.o ${OBJECTDIR}/_ext/40321244/pwm.o ${OBJECTDIR}/_ext/40321244/random.o ${OBJECTDIR}/_ext/40321244/ser.o ${OBJECTDIR}/_ext/40321244/softpwm.o ${OBJECTDIR}/_ext/40321244/softser.o ${OBJECTDIR}/_ext/40321244/timer.o ${OBJECTDIR}/_ext/40321244/uart.o

# Source Files
SOURCEFILES=/home/roman/Dokumente/Sources/libpicp/7segment.c /home/roman/Dokumente/Sources/libpicp/adc.c /home/roman/Dokumente/Sources/libpicp/buffer.c /home/roman/Dokumente/Sources/libpicp/comparator.c /home/roman/Dokumente/Sources/libpicp/delay.c /home/roman/Dokumente/Sources/libpicp/ds18b20.c /home/roman/Dokumente/Sources/libpicp/format.c /home/roman/Dokumente/Sources/libpicp/lcd44780.c /home/roman/Dokumente/Sources/libpicp/lcd5110.c /home/roman/Dokumente/Sources/libpicp/ledsense.c /home/roman/Dokumente/Sources/libpicp/midi.c /home/roman/Dokumente/Sources/libpicp/onewire.c /home/roman/Dokumente/Sources/libpicp/pwm.c /home/roman/Dokumente/Sources/libpicp/random.c /home/roman/Dokumente/Sources/libpicp/ser.c /home/roman/Dokumente/Sources/libpicp/softpwm.c /home/roman/Dokumente/Sources/libpicp/softser.c /home/roman/Dokumente/Sources/libpicp/timer.c /home/roman/Dokumente/Sources/libpicp/uart.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F2550
MP_PROCESSOR_OPTION_LD=18f2550
MP_LINKER_DEBUG_OPTION= -u_DEBUGCODESTART=0x7dc0 -u_DEBUGCODELEN=0x240 -u_DEBUGDATASTART=0x3f4 -u_DEBUGDATALEN=0xb
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/40321244/7segment.o: /home/roman/Dokumente/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/7segment.o   /home/roman/Dokumente/Sources/libpicp/7segment.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/7segment.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/7segment.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/adc.o: /home/roman/Dokumente/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/adc.o   /home/roman/Dokumente/Sources/libpicp/adc.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/buffer.o: /home/roman/Dokumente/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/buffer.o   /home/roman/Dokumente/Sources/libpicp/buffer.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/comparator.o: /home/roman/Dokumente/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/comparator.o   /home/roman/Dokumente/Sources/libpicp/comparator.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/comparator.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/comparator.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/delay.o: /home/roman/Dokumente/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/delay.o   /home/roman/Dokumente/Sources/libpicp/delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ds18b20.o: /home/roman/Dokumente/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ds18b20.o   /home/roman/Dokumente/Sources/libpicp/ds18b20.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ds18b20.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ds18b20.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/format.o: /home/roman/Dokumente/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/format.o   /home/roman/Dokumente/Sources/libpicp/format.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/format.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/format.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/lcd44780.o: /home/roman/Dokumente/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/lcd44780.o   /home/roman/Dokumente/Sources/libpicp/lcd44780.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/lcd44780.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/lcd44780.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/lcd5110.o: /home/roman/Dokumente/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/lcd5110.o   /home/roman/Dokumente/Sources/libpicp/lcd5110.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/lcd5110.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/lcd5110.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ledsense.o: /home/roman/Dokumente/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ledsense.o   /home/roman/Dokumente/Sources/libpicp/ledsense.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ledsense.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ledsense.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/midi.o: /home/roman/Dokumente/Sources/libpicp/midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/midi.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/midi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/midi.o   /home/roman/Dokumente/Sources/libpicp/midi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/midi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/midi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/onewire.o: /home/roman/Dokumente/Sources/libpicp/onewire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/onewire.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/onewire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/onewire.o   /home/roman/Dokumente/Sources/libpicp/onewire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/onewire.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/onewire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/pwm.o: /home/roman/Dokumente/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/pwm.o   /home/roman/Dokumente/Sources/libpicp/pwm.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/random.o: /home/roman/Dokumente/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/random.o   /home/roman/Dokumente/Sources/libpicp/random.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ser.o: /home/roman/Dokumente/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ser.o   /home/roman/Dokumente/Sources/libpicp/ser.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/softpwm.o: /home/roman/Dokumente/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/softpwm.o   /home/roman/Dokumente/Sources/libpicp/softpwm.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/softpwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/softpwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/softser.o: /home/roman/Dokumente/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/softser.o   /home/roman/Dokumente/Sources/libpicp/softser.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/softser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/softser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/timer.o: /home/roman/Dokumente/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/timer.o   /home/roman/Dokumente/Sources/libpicp/timer.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/uart.o: /home/roman/Dokumente/Sources/libpicp/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/uart.o   /home/roman/Dokumente/Sources/libpicp/uart.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/_ext/40321244/7segment.o: /home/roman/Dokumente/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/7segment.o   /home/roman/Dokumente/Sources/libpicp/7segment.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/7segment.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/7segment.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/adc.o: /home/roman/Dokumente/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/adc.o   /home/roman/Dokumente/Sources/libpicp/adc.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/adc.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/adc.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/buffer.o: /home/roman/Dokumente/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/buffer.o   /home/roman/Dokumente/Sources/libpicp/buffer.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/comparator.o: /home/roman/Dokumente/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/comparator.o   /home/roman/Dokumente/Sources/libpicp/comparator.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/comparator.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/comparator.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/delay.o: /home/roman/Dokumente/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/delay.o   /home/roman/Dokumente/Sources/libpicp/delay.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/delay.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/delay.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ds18b20.o: /home/roman/Dokumente/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ds18b20.o   /home/roman/Dokumente/Sources/libpicp/ds18b20.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ds18b20.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ds18b20.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/format.o: /home/roman/Dokumente/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/format.o   /home/roman/Dokumente/Sources/libpicp/format.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/format.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/format.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/lcd44780.o: /home/roman/Dokumente/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/lcd44780.o   /home/roman/Dokumente/Sources/libpicp/lcd44780.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/lcd44780.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/lcd44780.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/lcd5110.o: /home/roman/Dokumente/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/lcd5110.o   /home/roman/Dokumente/Sources/libpicp/lcd5110.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/lcd5110.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/lcd5110.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ledsense.o: /home/roman/Dokumente/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ledsense.o   /home/roman/Dokumente/Sources/libpicp/ledsense.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ledsense.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ledsense.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/midi.o: /home/roman/Dokumente/Sources/libpicp/midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/midi.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/midi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/midi.o   /home/roman/Dokumente/Sources/libpicp/midi.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/midi.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/midi.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/onewire.o: /home/roman/Dokumente/Sources/libpicp/onewire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/onewire.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/onewire.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/onewire.o   /home/roman/Dokumente/Sources/libpicp/onewire.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/onewire.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/onewire.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/pwm.o: /home/roman/Dokumente/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/pwm.o   /home/roman/Dokumente/Sources/libpicp/pwm.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/pwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/pwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/random.o: /home/roman/Dokumente/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/random.o   /home/roman/Dokumente/Sources/libpicp/random.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/random.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/random.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/ser.o: /home/roman/Dokumente/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/ser.o   /home/roman/Dokumente/Sources/libpicp/ser.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/ser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/ser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/softpwm.o: /home/roman/Dokumente/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/softpwm.o   /home/roman/Dokumente/Sources/libpicp/softpwm.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/softpwm.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/softpwm.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/softser.o: /home/roman/Dokumente/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/softser.o   /home/roman/Dokumente/Sources/libpicp/softser.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/softser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/softser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/timer.o: /home/roman/Dokumente/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/timer.o   /home/roman/Dokumente/Sources/libpicp/timer.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/timer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/timer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/40321244/uart.o: /home/roman/Dokumente/Sources/libpicp/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}/../h  -fo ${OBJECTDIR}/_ext/40321244/uart.o   /home/roman/Dokumente/Sources/libpicp/uart.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/40321244/uart.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/40321244/uart.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) -c dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}  
else
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) -c dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-c18.X.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}  
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default
