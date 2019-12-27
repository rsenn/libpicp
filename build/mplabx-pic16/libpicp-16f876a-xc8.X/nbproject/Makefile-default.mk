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
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=/home/roman/Dokumente/Sources/libpicp/7segment.c /home/roman/Dokumente/Sources/libpicp/adc.c /home/roman/Dokumente/Sources/libpicp/buffer.c /home/roman/Dokumente/Sources/libpicp/comparator.c /home/roman/Dokumente/Sources/libpicp/delay.c /home/roman/Dokumente/Sources/libpicp/ds18b20.c /home/roman/Dokumente/Sources/libpicp/format.c /home/roman/Dokumente/Sources/libpicp/lcd44780.c /home/roman/Dokumente/Sources/libpicp/lcd5110.c /home/roman/Dokumente/Sources/libpicp/ledsense.c /home/roman/Dokumente/Sources/libpicp/pwm.c /home/roman/Dokumente/Sources/libpicp/random.c /home/roman/Dokumente/Sources/libpicp/ser.c /home/roman/Dokumente/Sources/libpicp/softpwm.c /home/roman/Dokumente/Sources/libpicp/softser.c /home/roman/Dokumente/Sources/libpicp/timer.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/40321244/7segment.p1 ${OBJECTDIR}/_ext/40321244/adc.p1 ${OBJECTDIR}/_ext/40321244/buffer.p1 ${OBJECTDIR}/_ext/40321244/comparator.p1 ${OBJECTDIR}/_ext/40321244/delay.p1 ${OBJECTDIR}/_ext/40321244/ds18b20.p1 ${OBJECTDIR}/_ext/40321244/format.p1 ${OBJECTDIR}/_ext/40321244/lcd44780.p1 ${OBJECTDIR}/_ext/40321244/lcd5110.p1 ${OBJECTDIR}/_ext/40321244/ledsense.p1 ${OBJECTDIR}/_ext/40321244/pwm.p1 ${OBJECTDIR}/_ext/40321244/random.p1 ${OBJECTDIR}/_ext/40321244/ser.p1 ${OBJECTDIR}/_ext/40321244/softpwm.p1 ${OBJECTDIR}/_ext/40321244/softser.p1 ${OBJECTDIR}/_ext/40321244/timer.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/40321244/7segment.p1.d ${OBJECTDIR}/_ext/40321244/adc.p1.d ${OBJECTDIR}/_ext/40321244/buffer.p1.d ${OBJECTDIR}/_ext/40321244/comparator.p1.d ${OBJECTDIR}/_ext/40321244/delay.p1.d ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d ${OBJECTDIR}/_ext/40321244/format.p1.d ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d ${OBJECTDIR}/_ext/40321244/ledsense.p1.d ${OBJECTDIR}/_ext/40321244/pwm.p1.d ${OBJECTDIR}/_ext/40321244/random.p1.d ${OBJECTDIR}/_ext/40321244/ser.p1.d ${OBJECTDIR}/_ext/40321244/softpwm.p1.d ${OBJECTDIR}/_ext/40321244/softser.p1.d ${OBJECTDIR}/_ext/40321244/timer.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/40321244/7segment.p1 ${OBJECTDIR}/_ext/40321244/adc.p1 ${OBJECTDIR}/_ext/40321244/buffer.p1 ${OBJECTDIR}/_ext/40321244/comparator.p1 ${OBJECTDIR}/_ext/40321244/delay.p1 ${OBJECTDIR}/_ext/40321244/ds18b20.p1 ${OBJECTDIR}/_ext/40321244/format.p1 ${OBJECTDIR}/_ext/40321244/lcd44780.p1 ${OBJECTDIR}/_ext/40321244/lcd5110.p1 ${OBJECTDIR}/_ext/40321244/ledsense.p1 ${OBJECTDIR}/_ext/40321244/pwm.p1 ${OBJECTDIR}/_ext/40321244/random.p1 ${OBJECTDIR}/_ext/40321244/ser.p1 ${OBJECTDIR}/_ext/40321244/softpwm.p1 ${OBJECTDIR}/_ext/40321244/softser.p1 ${OBJECTDIR}/_ext/40321244/timer.p1

# Source Files
SOURCEFILES=/home/roman/Dokumente/Sources/libpicp/7segment.c /home/roman/Dokumente/Sources/libpicp/adc.c /home/roman/Dokumente/Sources/libpicp/buffer.c /home/roman/Dokumente/Sources/libpicp/comparator.c /home/roman/Dokumente/Sources/libpicp/delay.c /home/roman/Dokumente/Sources/libpicp/ds18b20.c /home/roman/Dokumente/Sources/libpicp/format.c /home/roman/Dokumente/Sources/libpicp/lcd44780.c /home/roman/Dokumente/Sources/libpicp/lcd5110.c /home/roman/Dokumente/Sources/libpicp/ledsense.c /home/roman/Dokumente/Sources/libpicp/pwm.c /home/roman/Dokumente/Sources/libpicp/random.c /home/roman/Dokumente/Sources/libpicp/ser.c /home/roman/Dokumente/Sources/libpicp/softpwm.c /home/roman/Dokumente/Sources/libpicp/softser.c /home/roman/Dokumente/Sources/libpicp/timer.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=16F876A
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/40321244/7segment.p1: /home/roman/Dokumente/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/7segment.p1 /home/roman/Dokumente/Sources/libpicp/7segment.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/7segment.d ${OBJECTDIR}/_ext/40321244/7segment.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/7segment.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/adc.p1: /home/roman/Dokumente/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/adc.p1 /home/roman/Dokumente/Sources/libpicp/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/adc.d ${OBJECTDIR}/_ext/40321244/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/buffer.p1: /home/roman/Dokumente/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/buffer.p1 /home/roman/Dokumente/Sources/libpicp/buffer.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/buffer.d ${OBJECTDIR}/_ext/40321244/buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/comparator.p1: /home/roman/Dokumente/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/comparator.p1 /home/roman/Dokumente/Sources/libpicp/comparator.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/comparator.d ${OBJECTDIR}/_ext/40321244/comparator.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/comparator.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/delay.p1: /home/roman/Dokumente/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/delay.p1 /home/roman/Dokumente/Sources/libpicp/delay.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/delay.d ${OBJECTDIR}/_ext/40321244/delay.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/delay.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ds18b20.p1: /home/roman/Dokumente/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ds18b20.p1 /home/roman/Dokumente/Sources/libpicp/ds18b20.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ds18b20.d ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/format.p1: /home/roman/Dokumente/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/format.p1 /home/roman/Dokumente/Sources/libpicp/format.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/format.d ${OBJECTDIR}/_ext/40321244/format.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/format.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/lcd44780.p1: /home/roman/Dokumente/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/lcd44780.p1 /home/roman/Dokumente/Sources/libpicp/lcd44780.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/lcd44780.d ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/lcd5110.p1: /home/roman/Dokumente/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/lcd5110.p1 /home/roman/Dokumente/Sources/libpicp/lcd5110.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/lcd5110.d ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ledsense.p1: /home/roman/Dokumente/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ledsense.p1 /home/roman/Dokumente/Sources/libpicp/ledsense.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ledsense.d ${OBJECTDIR}/_ext/40321244/ledsense.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ledsense.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/pwm.p1: /home/roman/Dokumente/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/pwm.p1 /home/roman/Dokumente/Sources/libpicp/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/pwm.d ${OBJECTDIR}/_ext/40321244/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/random.p1: /home/roman/Dokumente/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/random.p1 /home/roman/Dokumente/Sources/libpicp/random.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/random.d ${OBJECTDIR}/_ext/40321244/random.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/random.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ser.p1: /home/roman/Dokumente/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ser.p1 /home/roman/Dokumente/Sources/libpicp/ser.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ser.d ${OBJECTDIR}/_ext/40321244/ser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/softpwm.p1: /home/roman/Dokumente/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/softpwm.p1 /home/roman/Dokumente/Sources/libpicp/softpwm.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/softpwm.d ${OBJECTDIR}/_ext/40321244/softpwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/softpwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/softser.p1: /home/roman/Dokumente/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/softser.p1 /home/roman/Dokumente/Sources/libpicp/softser.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/softser.d ${OBJECTDIR}/_ext/40321244/softser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/softser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/timer.p1: /home/roman/Dokumente/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1  --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/timer.p1 /home/roman/Dokumente/Sources/libpicp/timer.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/timer.d ${OBJECTDIR}/_ext/40321244/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/40321244/7segment.p1: /home/roman/Dokumente/Sources/libpicp/7segment.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/7segment.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/7segment.p1 /home/roman/Dokumente/Sources/libpicp/7segment.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/7segment.d ${OBJECTDIR}/_ext/40321244/7segment.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/7segment.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/adc.p1: /home/roman/Dokumente/Sources/libpicp/adc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/adc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/adc.p1 /home/roman/Dokumente/Sources/libpicp/adc.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/adc.d ${OBJECTDIR}/_ext/40321244/adc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/adc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/buffer.p1: /home/roman/Dokumente/Sources/libpicp/buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/buffer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/buffer.p1 /home/roman/Dokumente/Sources/libpicp/buffer.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/buffer.d ${OBJECTDIR}/_ext/40321244/buffer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/buffer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/comparator.p1: /home/roman/Dokumente/Sources/libpicp/comparator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/comparator.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/comparator.p1 /home/roman/Dokumente/Sources/libpicp/comparator.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/comparator.d ${OBJECTDIR}/_ext/40321244/comparator.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/comparator.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/delay.p1: /home/roman/Dokumente/Sources/libpicp/delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/delay.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/delay.p1 /home/roman/Dokumente/Sources/libpicp/delay.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/delay.d ${OBJECTDIR}/_ext/40321244/delay.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/delay.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ds18b20.p1: /home/roman/Dokumente/Sources/libpicp/ds18b20.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ds18b20.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ds18b20.p1 /home/roman/Dokumente/Sources/libpicp/ds18b20.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ds18b20.d ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ds18b20.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/format.p1: /home/roman/Dokumente/Sources/libpicp/format.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/format.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/format.p1 /home/roman/Dokumente/Sources/libpicp/format.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/format.d ${OBJECTDIR}/_ext/40321244/format.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/format.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/lcd44780.p1: /home/roman/Dokumente/Sources/libpicp/lcd44780.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd44780.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/lcd44780.p1 /home/roman/Dokumente/Sources/libpicp/lcd44780.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/lcd44780.d ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/lcd44780.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/lcd5110.p1: /home/roman/Dokumente/Sources/libpicp/lcd5110.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/lcd5110.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/lcd5110.p1 /home/roman/Dokumente/Sources/libpicp/lcd5110.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/lcd5110.d ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/lcd5110.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ledsense.p1: /home/roman/Dokumente/Sources/libpicp/ledsense.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ledsense.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ledsense.p1 /home/roman/Dokumente/Sources/libpicp/ledsense.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ledsense.d ${OBJECTDIR}/_ext/40321244/ledsense.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ledsense.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/pwm.p1: /home/roman/Dokumente/Sources/libpicp/pwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/pwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/pwm.p1 /home/roman/Dokumente/Sources/libpicp/pwm.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/pwm.d ${OBJECTDIR}/_ext/40321244/pwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/pwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/random.p1: /home/roman/Dokumente/Sources/libpicp/random.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/random.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/random.p1 /home/roman/Dokumente/Sources/libpicp/random.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/random.d ${OBJECTDIR}/_ext/40321244/random.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/random.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/ser.p1: /home/roman/Dokumente/Sources/libpicp/ser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/ser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/ser.p1 /home/roman/Dokumente/Sources/libpicp/ser.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/ser.d ${OBJECTDIR}/_ext/40321244/ser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/ser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/softpwm.p1: /home/roman/Dokumente/Sources/libpicp/softpwm.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softpwm.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/softpwm.p1 /home/roman/Dokumente/Sources/libpicp/softpwm.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/softpwm.d ${OBJECTDIR}/_ext/40321244/softpwm.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/softpwm.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/softser.p1: /home/roman/Dokumente/Sources/libpicp/softser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/softser.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/softser.p1 /home/roman/Dokumente/Sources/libpicp/softser.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/softser.d ${OBJECTDIR}/_ext/40321244/softser.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/softser.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/40321244/timer.p1: /home/roman/Dokumente/Sources/libpicp/timer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/40321244" 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.p1.d 
	@${RM} ${OBJECTDIR}/_ext/40321244/timer.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     -o${OBJECTDIR}/_ext/40321244/timer.p1 /home/roman/Dokumente/Sources/libpicp/timer.c 
	@-${MV} ${OBJECTDIR}/_ext/40321244/timer.d ${OBJECTDIR}/_ext/40321244/timer.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/40321244/timer.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: archive
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.map -D__DEBUG=1 --debugger=pickit3  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s" --OUTPUT=lpp      --rom=default,-1f00-1fff --ram=default,-0-0,-70-70,-80-80,-f0-f0,-100-100,-170-170,-180-180,-1e5-1f0  $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_AR} $(MP_EXTRA_AR_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.map  --double=24 --float=24 --opt=+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 --warn=-3 --asmlist -DXPRJ_default=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-osccal,-resetbits,-download,-stackcall,+clib --output=-mcof,+elf:multilocs --stack=compiled:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s" --OUTPUT=lpp      $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/libpicp-16f876a-xc8.X.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
