// A register → holds an address
// M (memory[A]) → value in memory
// D register → general-purpose working register

// result = base + base + base ... (N times), for example, 3 * 2 = 3 + 3
// result = 0; loop (N) { result+= base}

// initialize R2 = 0
@R2
M=0

// initialize counter
@R1
D=M
@counter
M=D

(LOOP)
   // load counter into D
   @counter
   D=M

   @END
   D;JEQ   // stop if counter == 0

   // R2 = R2 + value
   @R2
   D=M
   @R0
   D=D+M
   @R2
   M=D

   // counter--
   @counter
   D=M-1
   M=D

   @LOOP
   0;JMP

(END)
