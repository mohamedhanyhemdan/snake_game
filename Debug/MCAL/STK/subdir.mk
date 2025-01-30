################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MCAL/STK/STk_program.c 

OBJS += \
./MCAL/STK/STk_program.o 

C_DEPS += \
./MCAL/STK/STk_program.d 


# Each subdirectory must supply rules for building sources it contributes
MCAL/STK/%.o MCAL/STK/%.su MCAL/STK/%.cyclo: ../MCAL/STK/%.c MCAL/STK/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MCAL-2f-STK

clean-MCAL-2f-STK:
	-$(RM) ./MCAL/STK/STk_program.cyclo ./MCAL/STK/STk_program.d ./MCAL/STK/STk_program.o ./MCAL/STK/STk_program.su

.PHONY: clean-MCAL-2f-STK

