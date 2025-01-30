################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MCAL/ADC/ADC_prog.c 

OBJS += \
./MCAL/ADC/ADC_prog.o 

C_DEPS += \
./MCAL/ADC/ADC_prog.d 


# Each subdirectory must supply rules for building sources it contributes
MCAL/ADC/%.o MCAL/ADC/%.su MCAL/ADC/%.cyclo: ../MCAL/ADC/%.c MCAL/ADC/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MCAL-2f-ADC

clean-MCAL-2f-ADC:
	-$(RM) ./MCAL/ADC/ADC_prog.cyclo ./MCAL/ADC/ADC_prog.d ./MCAL/ADC/ADC_prog.o ./MCAL/ADC/ADC_prog.su

.PHONY: clean-MCAL-2f-ADC

