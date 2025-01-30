################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../HAL/LDMX/LDMX_prog.c 

OBJS += \
./HAL/LDMX/LDMX_prog.o 

C_DEPS += \
./HAL/LDMX/LDMX_prog.d 


# Each subdirectory must supply rules for building sources it contributes
HAL/LDMX/%.o HAL/LDMX/%.su HAL/LDMX/%.cyclo: ../HAL/LDMX/%.c HAL/LDMX/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-HAL-2f-LDMX

clean-HAL-2f-LDMX:
	-$(RM) ./HAL/LDMX/LDMX_prog.cyclo ./HAL/LDMX/LDMX_prog.d ./HAL/LDMX/LDMX_prog.o ./HAL/LDMX/LDMX_prog.su

.PHONY: clean-HAL-2f-LDMX

