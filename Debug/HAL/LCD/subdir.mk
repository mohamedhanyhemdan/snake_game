################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../HAL/LCD/LCD_prog.c 

OBJS += \
./HAL/LCD/LCD_prog.o 

C_DEPS += \
./HAL/LCD/LCD_prog.d 


# Each subdirectory must supply rules for building sources it contributes
HAL/LCD/%.o HAL/LCD/%.su HAL/LCD/%.cyclo: ../HAL/LCD/%.c HAL/LCD/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-HAL-2f-LCD

clean-HAL-2f-LCD:
	-$(RM) ./HAL/LCD/LCD_prog.cyclo ./HAL/LCD/LCD_prog.d ./HAL/LCD/LCD_prog.o ./HAL/LCD/LCD_prog.su

.PHONY: clean-HAL-2f-LCD

