ASSEMBLER = nasm
FORMAT = elf64

clean:
	rm hello_name.o hello_name

build:
	$(ASSEMBLER) -f $(FORMAT) -o hello_name.o hello_name.asm
	ld hello_name.o -o hello_name
