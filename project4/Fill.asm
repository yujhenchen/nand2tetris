// read from keyboard, write to screen
// loop (true) { if key === 0, clear screen; else write screen}


// loop label
(LOOP)

// read key from keyboard and store into D register
@KBD
D=M

// if the key is 0, load to D register, set to 0
// else, set to key
@CLEAR
D;JEQ

@FILL
D;JNE

(CLEAR)
@SCREEN
D=0
M=D

// jump tp loop
@LOOP
0;JMP

// a loop over all screen addresses
(FILL)
M=D

// jump tp loop
@LOOP
0;JMP
