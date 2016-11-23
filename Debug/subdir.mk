################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../abc.c \
../stm32f10x_it.c 

OBJS += \
./abc.o \
./stm32f10x_it.o 


# Each subdirectory must supply rules for building sources it contributes
%.o: ../%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM C Compiler 5'
	armcc -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\CoreSupport" -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x" -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x\startup\arm" -I"C:\Users\USER\Desktop\week10\Libraries\STM32F10x_StdPeriph_Driver\inc" -I"C:\Users\USER\Desktop\week10\Libraries\STM32F10x_StdPeriph_Driver\src" -I"C:\Users\USER\Desktop\week10" -O0 --cpu=Cortex-M3 -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


