ASSEMBLER = nasm
FORMAT = elf64

clean:
	rm hello_world.o hello_world

build:
	$(ASSEMBLER) -f $(FORMAT) -o hello_world.o hello_world.asm
	ld hello_world.o -o hello_world
