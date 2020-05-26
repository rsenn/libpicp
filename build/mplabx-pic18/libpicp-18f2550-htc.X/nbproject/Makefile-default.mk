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
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-htc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=hex
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-htc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=/home/roman/Sources/libpicp/7segment.c /home/roman/Sources/libpicp/adc.c /home/roman/Sources/libpicp/buffer.c /home/roman/Sources/libpicp/comparator.c /home/roman/Sources/libpicp/delay.c /home/roman/Sources/libpicp/ds18b20.c /home/roman/Sources/libpicp/format.c /home/roman/Sources/libpicp/lcd44780.c /home/roman/Sources/libpicp/lcd5110.c /home/roman/Sources/libpicp/ledsense.c /home/roman/Sources/libpicp/midi.c /home/roman/Sources/libpicp/onewire.c /home/roman/Sources/libpicp/pwm.c /home/roman/Sources/libpicp/random.c /home/roman/Sources/libpicp/ser.c /home/roman/Sources/libpicp/softpwm.c /home/roman/Sources/libpicp/softser.c /home/roman/Sources/libpicp/timer.c /home/roman/Sources/libpicp/uart.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/863579873/7segment.o ${OBJECTDIR}/_ext/863579873/adc.o ${OBJECTDIR}/_ext/863579873/buffer.o ${OBJECTDIR}/_ext/863579873/comparator.o ${OBJECTDIR}/_ext/863579873/delay.o ${OBJECTDIR}/_ext/863579873/ds18b20.o ${OBJECTDIR}/_ext/863579873/format.o ${OBJECTDIR}/_ext/863579873/lcd44780.o ${OBJECTDIR}/_ext/863579873/lcd5110.o ${OBJECTDIR}/_ext/863579873/ledsense.o ${OBJECTDIR}/_ext/863579873/midi.o ${OBJECTDIR}/_ext/863579873/onewire.o ${OBJECTDIR}/_ext/863579873/pwm.o ${OBJECTDIR}/_ext/863579873/random.o ${OBJECTDIR}/_ext/863579873/ser.o ${OBJECTDIR}/_ext/863579873/softpwm.o ${OBJECTDIR}/_ext/863579873/softser.o ${OBJECTDIR}/_ext/863579873/timer.o ${OBJECTDIR}/_ext/863579873/uart.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/863579873/7segment.o.d ${OBJECTDIR}/_ext/863579873/adc.o.d ${OBJECTDIR}/_ext/863579873/buffer.o.d ${OBJECTDIR}/_ext/863579873/comparator.o.d ${OBJECTDIR}/_ext/863579873/delay.o.d ${OBJECTDIR}/_ext/863579873/ds18b20.o.d ${OBJECTDIR}/_ext/863579873/format.o.d ${OBJECTDIR}/_ext/863579873/lcd44780.o.d ${OBJECTDIR}/_ext/863579873/lcd5110.o.d ${OBJECTDIR}/_ext/863579873/ledsense.o.d ${OBJECTDIR}/_ext/863579873/midi.o.d ${OBJECTDIR}/_ext/863579873/onewire.o.d ${OBJECTDIR}/_ext/863579873/pwm.o.d ${OBJECTDIR}/_ext/863579873/random.o.d ${OBJECTDIR}/_ext/863579873/ser.o.d ${OBJECTDIR}/_ext/863579873/softpwm.o.d ${OBJECTDIR}/_ext/863579873/softser.o.d ${OBJECTDIR}/_ext/863579873/timer.o.d ${OBJECTDIR}/_ext/863579873/uart.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/863579873/7segment.o ${OBJECTDIR}/_ext/863579873/adc.o ${OBJECTDIR}/_ext/863579873/buffer.o ${OBJECTDIR}/_ext/863579873/comparator.o ${OBJECTDIR}/_ext/863579873/delay.o ${OBJECTDIR}/_ext/863579873/ds18b20.o ${OBJECTDIR}/_ext/863579873/format.o ${OBJECTDIR}/_ext/863579873/lcd44780.o ${OBJECTDIR}/_ext/863579873/lcd5110.o ${OBJECTDIR}/_ext/863579873/ledsense.o ${OBJECTDIR}/_ext/863579873/midi.o ${OBJECTDIR}/_ext/863579873/onewire.o ${OBJECTDIR}/_ext/863579873/pwm.o ${OBJECTDIR}/_ext/863579873/random.o ${OBJECTDIR}/_ext/863579873/ser.o ${OBJECTDIR}/_ext/863579873/softpwm.o ${OBJECTDIR}/_ext/863579873/softser.o ${OBJECTDIR}/_ext/863579873/timer.o ${OBJECTDIR}/_ext/863579873/uart.o

# Source Files
SOURCEFILES=/home/roman/Sources/libpicp/7segment.c /home/roman/Sources/libpicp/adc.c /home/roman/Sources/libpicp/buffer.c /home/roman/Sources/libpicp/comparator.c /home/roman/Sources/libpicp/delay.c /home/roman/Sources/libpicp/ds18b20.c /home/roman/Sources/libpicp/format.c /home/roman/Sources/libpicp/lcd44780.c /home/roman/Sources/libpicp/lcd5110.c /home/roman/Sources/libpicp/ledsense.c /home/roman/Sources/libpicp/midi.c /home/roman/Sources/libpicp/onewire.c /home/roman/Sources/libpicp/pwm.c /home/roman/Sources/libpicp/random.c /home/roman/Sources/libpicp/ser.c /home/roman/Sources/libpicp/softpwm.c /home/roman/Sources/libpicp/softser.c /home/roman/Sources/libpicp/timer.c /home/roman/Sources/libpicp/uart.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-htc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/863579873/7segment.o: /home/roman/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/7segment.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/7segment.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/7segment.c 
	
${OBJECTDIR}/_ext/863579873/adc.o: /home/roman/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/adc.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/adc.c 
	
${OBJECTDIR}/_ext/863579873/buffer.o: /home/roman/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/buffer.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/buffer.c 
	
${OBJECTDIR}/_ext/863579873/comparator.o: /home/roman/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/comparator.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/comparator.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/comparator.c 
	
${OBJECTDIR}/_ext/863579873/delay.o: /home/roman/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/delay.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/delay.c 
	
${OBJECTDIR}/_ext/863579873/ds18b20.o: /home/roman/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ds18b20.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ds18b20.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ds18b20.c 
	
${OBJECTDIR}/_ext/863579873/format.o: /home/roman/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/format.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/format.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/format.c 
	
${OBJECTDIR}/_ext/863579873/lcd44780.o: /home/roman/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd44780.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/lcd44780.c 
	
${OBJECTDIR}/_ext/863579873/lcd5110.o: /home/roman/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd5110.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd5110.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/lcd5110.c 
	
${OBJECTDIR}/_ext/863579873/ledsense.o: /home/roman/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ledsense.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ledsense.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ledsense.c 
	
${OBJECTDIR}/_ext/863579873/midi.o: /home/roman/Sources/libpicp/midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/midi.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/midi.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/midi.c 
	
${OBJECTDIR}/_ext/863579873/onewire.o: /home/roman/Sources/libpicp/onewire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/onewire.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/onewire.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/onewire.c 
	
${OBJECTDIR}/_ext/863579873/pwm.o: /home/roman/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/pwm.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/pwm.c 
	
${OBJECTDIR}/_ext/863579873/random.o: /home/roman/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/random.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/random.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/random.c 
	
${OBJECTDIR}/_ext/863579873/ser.o: /home/roman/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ser.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ser.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ser.c 
	
${OBJECTDIR}/_ext/863579873/softpwm.o: /home/roman/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/softpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/softpwm.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/softpwm.c 
	
${OBJECTDIR}/_ext/863579873/softser.o: /home/roman/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/softser.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/softser.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/softser.c 
	
${OBJECTDIR}/_ext/863579873/timer.o: /home/roman/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/timer.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/timer.c 
	
${OBJECTDIR}/_ext/863579873/uart.o: /home/roman/Sources/libpicp/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/uart.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/uart.c 
	
else
${OBJECTDIR}/_ext/863579873/7segment.o: /home/roman/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/7segment.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/7segment.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/7segment.c 
	
${OBJECTDIR}/_ext/863579873/adc.o: /home/roman/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/adc.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/adc.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/adc.c 
	
${OBJECTDIR}/_ext/863579873/buffer.o: /home/roman/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/buffer.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/buffer.c 
	
${OBJECTDIR}/_ext/863579873/comparator.o: /home/roman/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/comparator.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/comparator.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/comparator.c 
	
${OBJECTDIR}/_ext/863579873/delay.o: /home/roman/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/delay.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/delay.c 
	
${OBJECTDIR}/_ext/863579873/ds18b20.o: /home/roman/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ds18b20.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ds18b20.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ds18b20.c 
	
${OBJECTDIR}/_ext/863579873/format.o: /home/roman/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/format.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/format.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/format.c 
	
${OBJECTDIR}/_ext/863579873/lcd44780.o: /home/roman/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd44780.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd44780.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/lcd44780.c 
	
${OBJECTDIR}/_ext/863579873/lcd5110.o: /home/roman/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd5110.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/lcd5110.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/lcd5110.c 
	
${OBJECTDIR}/_ext/863579873/ledsense.o: /home/roman/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ledsense.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ledsense.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ledsense.c 
	
${OBJECTDIR}/_ext/863579873/midi.o: /home/roman/Sources/libpicp/midi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/midi.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/midi.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/midi.c 
	
${OBJECTDIR}/_ext/863579873/onewire.o: /home/roman/Sources/libpicp/onewire.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/onewire.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/onewire.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/onewire.c 
	
${OBJECTDIR}/_ext/863579873/pwm.o: /home/roman/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/pwm.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/pwm.c 
	
${OBJECTDIR}/_ext/863579873/random.o: /home/roman/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/random.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/random.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/random.c 
	
${OBJECTDIR}/_ext/863579873/ser.o: /home/roman/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/ser.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/ser.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/ser.c 
	
${OBJECTDIR}/_ext/863579873/softpwm.o: /home/roman/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/softpwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/softpwm.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/softpwm.c 
	
${OBJECTDIR}/_ext/863579873/softser.o: /home/roman/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/softser.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/softser.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/softser.c 
	
${OBJECTDIR}/_ext/863579873/timer.o: /home/roman/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/timer.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/timer.c 
	
${OBJECTDIR}/_ext/863579873/uart.o: /home/roman/Sources/libpicp/uart.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	@${RM} ${OBJECTDIR}/_ext/863579873/uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/863579873/uart.o 
	 ${MP_CC} $(MP_EXTRA_CC_PRE)  /home/roman/Sources/libpicp/uart.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-htc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)  
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-18f2550-htc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE)  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default
