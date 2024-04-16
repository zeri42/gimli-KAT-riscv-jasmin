#heavily inspired by  https://twilco.github.io/riscv-from-scratch/2019/04/27/riscv-from-scratch-2.html
######
CC=riscv32-none-elf-gcc
CFLAGS= -g -ffreestanding -Os -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,linker.ld
main.elf: main.o crt.o linker.ld
	$(CC) $(CFLAGS) crt.S main.c -o main.elf
sim: main.elf
	echo "press Ctrl-A X to quit qemu"
	qemu-system-riscv32 -machine virt -bios none -kernel main.elf -nographic
all: sim
clean: 
	rm main.elf main.o crt.o
