// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(WHILE)
    @8191 // screen's "length" in 16bit-words = 8192 -> 0 - 8191
    D=A

    @n  
    M=D

    @KBD
    D=M

    @color
    M=0

    @DRAW
    D;JEQ

    @color
    M=-1 // RAM[addr]=1111111111111111

(DRAW)

    @SCREEN
    D=A
    
    @addr
    M=D // addr = 16384
        // (screen’s base address)
    @i
    M=0 //i=0

(LOOP)
    @i
    D=M

    @n
    D=D-M

    @END
    D;JGT // if i>n goto END

    @color
    D=M

    @addr
    A=M
    M=D 

    @i
    M=M+1 //i=i+1

    @addr
    M=M+1 

    @LOOP
    0;JMP

(END)
    @WHILE
    0;JMP
