set PATH=%PATH%;C:\Program Files (x86)\Atmel\Atmel Toolchain\AVR8 GCC\Native\3.4.2.1002\avr8-gnu-toolchain\bin
cd /d %~dp0
avr-objcopy.exe -O binary Debug/Kicker6.elf app.bin
avr-objcopy.exe -O binary DebugDFU/Kicker6.elf dfu.bin