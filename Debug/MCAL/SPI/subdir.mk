################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../MCAL/SPI/SPI_prog.c 

OBJS += \
./MCAL/SPI/SPI_prog.o 

C_DEPS += \
./MCAL/SPI/SPI_prog.d 


# Each subdirectory must supply rules for building sources it contributes
MCAL/SPI/%.o MCAL/SPI/%.su MCAL/SPI/%.cyclo: ../MCAL/SPI/%.c MCAL/SPI/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m3 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F1 -DSTM32F103C8Tx -c -I../Inc -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-MCAL-2f-SPI

clean-MCAL-2f-SPI:
	-$(RM) ./MCAL/SPI/SPI_prog.cyclo ./MCAL/SPI/SPI_prog.d ./MCAL/SPI/SPI_prog.o ./MCAL/SPI/SPI_prog.su

.PHONY: clean-MCAL-2f-SPI

