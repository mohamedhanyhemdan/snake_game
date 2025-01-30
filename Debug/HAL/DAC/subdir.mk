################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../HAL/DAC/DAC_prog.c 

OBJS += \
./HAL/DAC/DAC_prog.o 

C_DEPS += \
./HAL/DAC/DAC_prog.d 


# Each subdirectory must supply rules for building sources it contributes
HAL/DAC/%.o HAL/DAC/%.su HAL/DAC/%.cyclo: ../HAL/DAC/%.c HAL/DAC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-HAL-2f-DAC

clean-HAL-2f-DAC:
	-$(RM) ./HAL/DAC/DAC_prog.cyclo ./HAL/DAC/DAC_prog.d ./HAL/DAC/DAC_prog.o ./HAL/DAC/DAC_prog.su

.PHONY: clean-HAL-2f-DAC

