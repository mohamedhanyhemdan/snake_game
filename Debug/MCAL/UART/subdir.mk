################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MCAL/UART/UART_prog.c 

OBJS += \
./MCAL/UART/UART_prog.o 

C_DEPS += \
./MCAL/UART/UART_prog.d 


# Each subdirectory must supply rules for building sources it contributes
MCAL/UART/%.o MCAL/UART/%.su MCAL/UART/%.cyclo: ../MCAL/UART/%.c MCAL/UART/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MCAL-2f-UART

clean-MCAL-2f-UART:
	-$(RM) ./MCAL/UART/UART_prog.cyclo ./MCAL/UART/UART_prog.d ./MCAL/UART/UART_prog.o ./MCAL/UART/UART_prog.su

.PHONY: clean-MCAL-2f-UART

