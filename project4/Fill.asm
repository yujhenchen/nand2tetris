// M always means RAM[A], for example, A=16, M means RAM[16]
// read from keyboard, write to screen
// Screen memory ends at: 24575
// KBD = 24576





// loop label
(LOOP)

// read key from keyboard and store into D register
@KBD
D=M

// if the key is 0, load to D register, jump to clear
// else, jump to fill
@CLEAR
D;JEQ

@FILL
D;JNE

// clear label
(CLEAR)

// select the address of the screen and load into D register
@SCREEN
D=A
// allocate a memory for the variable pointer, and select the memory
// (which loads the memory address automatically into A register)
@pointer
// assign the screen address stores in D now to the selected memory
// (which becomes the value of pointer)
M=D

// label for inner loop clear screen
(CLEAR_LOOP)

// select the pointer, so that M is the value of the memory that stores in pointer
// (which points to the current screen memory),
// and load the memory value into D register
@pointer
D=M
// D = pointer - KBD
@KBD
D=D-A
// has the pointer reached the keyboard memory boundary? (D-M is 0 or not)
// (if pointer == KBD → we reached end of screen memory → exit loop)
@EXIT
D;JGE

// select the pointer variable , now A = address of variable "pointer"
@pointer
// make A become the value stored in pointer
A=M
// clear the memory at RAM[pointer]
M=0

// else, increase the value of pointer and write it back to pointer
@pointer
M=M+1
@CLEAR_LOOP
0;JMP


// jump to the main loop
(EXIT)
@LOOP
0;JMP


(FILL)
// init pointer to point to the address of the first memory of the screen
// inner loop to fill the screen if not pointer has not reached the keyboard memory boundary
@SCREEN
D=A
@pointer
M=D

(FILL_LOOP)
// calculate D
@pointer
D=M
@KBD
D=D-A
// exit check should be in the loop cycle
@EXIT
D;JGE

// fill the screen
@pointer
A=M
M=-1

// pointer++
@pointer
M=M+1

@FILL_LOOP
0;JMP


// jump to main loop
@LOOP
0;JMP
