# WIP

```

$ git clone --recursive git@github.com:zeri42/gimli-KAT-riscv-jasmin.git
$ cd gimli-KAT-riscv-jasmin
$ nix-shell 


# ....
# this will take a while the first time and every time the risc-v branch changes
# in the shell.nix file it's the pkgs.callPackage ./jasmin/default.nix {} that triggerst the compilation 
# change if the compiling becomes bothersome
# ...

$ make sim
riscv32-none-elf-gcc -g -ffreestanding -Os -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,linker.ld   -c -o main.o main.c
riscv32-none-elf-gcc    -c -o crt.o crt.S
riscv32-none-elf-gcc -g -ffreestanding -Os -Wl,--gc-sections -nostartfiles -nostdlib -nodefaultlibs -Wl,-T,linker.ld crt.S main.c -o main.elf
echo "press Ctrl-A X to quit qemu"
press Ctrl-A X to quit qemu
qemu-system-riscv32 -machine virt -bios none -kernel main.elf -nographic
Hello World
QEMU: Terminated
```
