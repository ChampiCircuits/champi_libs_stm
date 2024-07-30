################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Src/ChampiCan.cpp \
../Src/ChampiState.cpp \
../Src/MessageRecomposer.cpp 

C_SRCS += \
../Src/msgs_can.pb.c \
../Src/pb_common.c \
../Src/pb_decode.c \
../Src/pb_encode.c \
../Src/syscalls.c \
../Src/sysmem.c 

C_DEPS += \
./Src/msgs_can.pb.d \
./Src/pb_common.d \
./Src/pb_decode.d \
./Src/pb_encode.d \
./Src/syscalls.d \
./Src/sysmem.d 

OBJS += \
./Src/ChampiCan.o \
./Src/ChampiState.o \
./Src/MessageRecomposer.o \
./Src/msgs_can.pb.o \
./Src/pb_common.o \
./Src/pb_decode.o \
./Src/pb_encode.o \
./Src/syscalls.o \
./Src/sysmem.o 

CPP_DEPS += \
./Src/ChampiCan.d \
./Src/ChampiState.d \
./Src/MessageRecomposer.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.cpp Src/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G431xx -c -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G431xx -c -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/ChampiCan.cyclo ./Src/ChampiCan.d ./Src/ChampiCan.o ./Src/ChampiCan.su ./Src/ChampiState.cyclo ./Src/ChampiState.d ./Src/ChampiState.o ./Src/ChampiState.su ./Src/MessageRecomposer.cyclo ./Src/MessageRecomposer.d ./Src/MessageRecomposer.o ./Src/MessageRecomposer.su ./Src/msgs_can.pb.cyclo ./Src/msgs_can.pb.d ./Src/msgs_can.pb.o ./Src/msgs_can.pb.su ./Src/pb_common.cyclo ./Src/pb_common.d ./Src/pb_common.o ./Src/pb_common.su ./Src/pb_decode.cyclo ./Src/pb_decode.d ./Src/pb_decode.o ./Src/pb_decode.su ./Src/pb_encode.cyclo ./Src/pb_encode.d ./Src/pb_encode.o ./Src/pb_encode.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su

.PHONY: clean-Src

