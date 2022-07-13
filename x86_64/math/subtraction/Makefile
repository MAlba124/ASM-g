BASEF = subtraction

ASM = nasm
FORMAT = elf64

clean:
	rm $(BASEF) $(BASEF).o

build:
	$(ASM) -f $(FORMAT) -o $(BASEF).o $(BASEF).asm
	ld $(BASEF).o -o $(BASEF)
