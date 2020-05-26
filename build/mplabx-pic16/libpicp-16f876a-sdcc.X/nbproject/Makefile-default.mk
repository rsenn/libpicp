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
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=/home/roman/Sources/libpicp/7segment.c /home/roman/Sources/libpicp/adc.c /home/roman/Sources/libpicp/comparator.c /home/roman/Sources/libpicp/delay.c /home/roman/Sources/libpicp/pwm.c /home/roman/Sources/libpicp/random.c /home/roman/Sources/libpicp/timer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/863579873/7segment.o ${OBJECTDIR}/_ext/863579873/adc.o ${OBJECTDIR}/_ext/863579873/comparator.o ${OBJECTDIR}/_ext/863579873/delay.o ${OBJECTDIR}/_ext/863579873/pwm.o ${OBJECTDIR}/_ext/863579873/random.o ${OBJECTDIR}/_ext/863579873/timer.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/863579873/7segment.o.d ${OBJECTDIR}/_ext/863579873/adc.o.d ${OBJECTDIR}/_ext/863579873/comparator.o.d ${OBJECTDIR}/_ext/863579873/delay.o.d ${OBJECTDIR}/_ext/863579873/pwm.o.d ${OBJECTDIR}/_ext/863579873/random.o.d ${OBJECTDIR}/_ext/863579873/timer.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/863579873/7segment.o ${OBJECTDIR}/_ext/863579873/adc.o ${OBJECTDIR}/_ext/863579873/comparator.o ${OBJECTDIR}/_ext/863579873/delay.o ${OBJECTDIR}/_ext/863579873/pwm.o ${OBJECTDIR}/_ext/863579873/random.o ${OBJECTDIR}/_ext/863579873/timer.o

# Source Files
SOURCEFILES=/home/roman/Sources/libpicp/7segment.c /home/roman/Sources/libpicp/adc.c /home/roman/Sources/libpicp/comparator.c /home/roman/Sources/libpicp/delay.c /home/roman/Sources/libpicp/pwm.c /home/roman/Sources/libpicp/random.c /home/roman/Sources/libpicp/timer.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/863579873/7segment.o: /home/roman/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/7segment.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/7segment.c  -o${OBJECTDIR}/_ext/863579873/7segment.o
	
${OBJECTDIR}/_ext/863579873/adc.o: /home/roman/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/adc.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/adc.c  -o${OBJECTDIR}/_ext/863579873/adc.o
	
${OBJECTDIR}/_ext/863579873/comparator.o: /home/roman/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/comparator.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/comparator.c  -o${OBJECTDIR}/_ext/863579873/comparator.o
	
${OBJECTDIR}/_ext/863579873/delay.o: /home/roman/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/delay.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/delay.c  -o${OBJECTDIR}/_ext/863579873/delay.o
	
${OBJECTDIR}/_ext/863579873/pwm.o: /home/roman/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/pwm.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/pwm.c  -o${OBJECTDIR}/_ext/863579873/pwm.o
	
${OBJECTDIR}/_ext/863579873/random.o: /home/roman/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/random.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/random.c  -o${OBJECTDIR}/_ext/863579873/random.o
	
${OBJECTDIR}/_ext/863579873/timer.o: /home/roman/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/timer.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 --debug -c -mpic14 -p16f876a /home/roman/Sources/libpicp/timer.c  -o${OBJECTDIR}/_ext/863579873/timer.o
	
else
${OBJECTDIR}/_ext/863579873/7segment.o: /home/roman/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/7segment.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/7segment.c  -o${OBJECTDIR}/_ext/863579873/7segment.o
	
${OBJECTDIR}/_ext/863579873/adc.o: /home/roman/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/adc.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/adc.c  -o${OBJECTDIR}/_ext/863579873/adc.o
	
${OBJECTDIR}/_ext/863579873/comparator.o: /home/roman/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/comparator.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/comparator.c  -o${OBJECTDIR}/_ext/863579873/comparator.o
	
${OBJECTDIR}/_ext/863579873/delay.o: /home/roman/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/delay.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/delay.c  -o${OBJECTDIR}/_ext/863579873/delay.o
	
${OBJECTDIR}/_ext/863579873/pwm.o: /home/roman/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/pwm.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/pwm.c  -o${OBJECTDIR}/_ext/863579873/pwm.o
	
${OBJECTDIR}/_ext/863579873/random.o: /home/roman/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/random.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/random.c  -o${OBJECTDIR}/_ext/863579873/random.o
	
${OBJECTDIR}/_ext/863579873/timer.o: /home/roman/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} "${OBJECTDIR}/_ext/863579873" 
	${RM} ${OBJECTDIR}/_ext/863579873/timer.o 
	${MP_CC} --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -c -mpic14 -p16f876a /home/roman/Sources/libpicp/timer.c  -o${OBJECTDIR}/_ext/863579873/timer.o
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} -Wl-c -Wl-m --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -mpic14 -p16f876a ${OBJECTFILES_QUOTED_IF_SPACED} -odist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} 
else
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} -Wl-c -Wl-m --use-non-free -DUSE_HD44780_LCD=1 -DUSE_PWM=1 -DUSE_SER=1 -DUSE_TIMER0=1 -DUSE_TIMER1=1 -DUSE_TIMER2=1 -D__16f876a=1 -mpic14 -p16f876a ${OBJECTFILES_QUOTED_IF_SPACED} -odist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-sdcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default
