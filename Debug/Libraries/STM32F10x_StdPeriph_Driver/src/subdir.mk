################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/STM32F10x_StdPeriph_Driver/src/Touch.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/lcd.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/misc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_adc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_bkp.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_can.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_cec.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_crc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dac.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dbgmcu.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dma.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_exti.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_flash.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_fsmc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_gpio.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_i2c.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_iwdg.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_pwr.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_rcc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_rtc.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_sdio.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_spi.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_tim.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_usart.c \
../Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_wwdg.c 

OBJS += \
./Libraries/STM32F10x_StdPeriph_Driver/src/Touch.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/lcd.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/misc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_adc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_bkp.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_can.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_cec.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_crc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dac.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dbgmcu.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_dma.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_exti.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_flash.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_fsmc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_gpio.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_i2c.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_iwdg.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_pwr.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_rcc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_rtc.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_sdio.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_spi.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_tim.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_usart.o \
./Libraries/STM32F10x_StdPeriph_Driver/src/stm32f10x_wwdg.o 


# Each subdirectory must supply rules for building sources it contributes
Libraries/STM32F10x_StdPeriph_Driver/src/%.o: ../Libraries/STM32F10x_StdPeriph_Driver/src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM C Compiler 5'
	armcc -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\CoreSupport" -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x" -I"C:\Users\USER\Desktop\week10\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x\startup\arm" -I"C:\Users\USER\Desktop\week10\Libraries\STM32F10x_StdPeriph_Driver\inc" -I"C:\Users\USER\Desktop\week10\Libraries\STM32F10x_StdPeriph_Driver\src" -I"C:\Users\USER\Desktop\week10" -O0 --cpu=Cortex-M3 -g -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


