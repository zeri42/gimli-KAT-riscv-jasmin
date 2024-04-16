#heavily inspired by  https://twilco.github.io/riscv-from-scratch/2019/04/27/riscv-from-scratch-2.html
######
CC=riscv32-none-elf-gcc
CFLAGS= -g -ffreestanding -Os 
LDFLAGS= -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,linker.ld
gimli.S: 
	jasminc -arch risc-v jasmin/compiler/tests/success/risc-v/gimli.jazz -o gimli.S

main.elf: main.o crt.o gimli.o linker.ld
	$(CC) $(CFLAGS) $(LDFLAGS) main.o crt.o gimli.o -o main.elf


sim: main.elf
	echo "press Ctrl-A X to quit qemu"
	qemu-system-riscv32 -machine virt -bios none -kernel main.elf -nographic
all: sim
clean: 
	rm main.elf main.o crt.o gimli.o
