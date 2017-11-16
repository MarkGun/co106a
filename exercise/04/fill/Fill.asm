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

// Put your code here.
        @8192   // (512 * 32) / 16
        D=A
        @dot
        M=D     // dot = 8192 (# of bytes)
(MAINLOOP)
        @index
        M=0     // index = 0
(INPUT)
        @KBD
        D=M
        @WHITE
        D;JEQ   // goto WHITE if KBD value is 0
        //@KBD
        //M=D-1
        //@BLACK
        //D;JEQ   // goto BLACK if KBD value is 1
(BLACK)
        @index
        D=M
        @SCREEN
        A=A+D   // Calculate byte address
        M=-1    // Fill with black
        @END
        0;JMP   // goto END
(WHITE)
        @index
        D=M
        @SCREEN
        A=A+D   // Calculate byte address
        M=0     // Fill with white
        @END
        0;JMP
(END)   
        @index
        MD=M+1  // Increment index by 1
        @dot
        D=D-M
        @MAINLOOP
        D;JEQ   // goto MAINLOOP if dot - index == 0
        @INPUT
        0;JMP   // goto INPUT