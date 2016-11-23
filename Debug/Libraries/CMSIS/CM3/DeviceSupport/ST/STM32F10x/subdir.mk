################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.c 

OBJS += \
./Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/system_stm32f10x.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/%.o: ../Libraries/CMSIS/CM3/DeviceSupport/ST/STM32F10x/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM C Compiler 5'
	armcc -I"C:\Users\USER\7choterm\Libraries\CMSIS\CM3\CoreSupport" -I"C:\Users\USER\7choterm\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x" -I"C:\Users\USER\7choterm\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x\startup\arm" -I"C:\Users\USER\7choterm\Libraries\STM32F10x_StdPeriph_Driver\inc" -I"C:\Users\USER\7choterm\Libraries\STM32F10x_StdPeriph_Driver\src" -I"C:\Users\USER\7choterm" --c99 -O0 --cpu=Cortex-M3 -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


