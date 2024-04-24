#heavily inspired by  https://twilco.github.io/riscv-from-scratch/2019/04/27/riscv-from-scratch-2.html
######
CC=riscv32-none-elf-gcc
CFLAGS= -g -ffreestanding -Os 
LDFLAGS= -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,linker.ld

gimli_KAT.h:
	python parse_KAT.py  > gimli_KAT.h
gimli.S: gimli.jazz
	jasminc -arch risc-v gimli.jazz -o gimli.S -nowarning

main.elf: gimli_KAT.h main.o crt.o gimli.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o main.elf $^


sim: main.elf
	echo "press Ctrl-A X to quit qemu"
	qemu-system-riscv32 -machine virt -bios none -kernel main.elf -nographic
all: sim
clean: 
	rm main.elf
	rm main.o 
	rm crt.o
	rm gimli.{o,S} ref_gimli.o gimli_KAT.h
