################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MCAL/EXTI/EXTI_prog.c 

OBJS += \
./MCAL/EXTI/EXTI_prog.o 

C_DEPS += \
./MCAL/EXTI/EXTI_prog.d 


# Each subdirectory must supply rules for building sources it contributes
MCAL/EXTI/%.o MCAL/EXTI/%.su MCAL/EXTI/%.cyclo: ../MCAL/EXTI/%.c MCAL/EXTI/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MCAL-2f-EXTI

clean-MCAL-2f-EXTI:
	-$(RM) ./MCAL/EXTI/EXTI_prog.cyclo ./MCAL/EXTI/EXTI_prog.d ./MCAL/EXTI/EXTI_prog.o ./MCAL/EXTI/EXTI_prog.su

.PHONY: clean-MCAL-2f-EXTI

