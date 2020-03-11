nasm -fwin32 hello.asm
gcc -o hello.exe hello.obj asm_io.obj driver.c
hello.exe