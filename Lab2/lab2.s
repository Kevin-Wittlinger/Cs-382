// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
//  CS 382 LC

.text      //Where program lives
.global _start  //declares an entry point for program 
_start:          //calls the entry point


ADR X1, msg     //Moves address of msg into X1
ADR X10, length  //moves address of length into X10
LDR X2, [X10]    //Loads values at address of msg into register X2
MOV X0, 1       //set register X0 to 1
MOV X8, 64      //set register X8 to 64
SVC 0           //Invoke syscall to exit


MOV X0, 0           // Set register X0 to 0 (return code)
MOV X8, 93          // Set register X8 to 93 (syscall number for exit)
SVC 0               // Invoke syscall to exit


.data                  //able to store variables in memory
length: .quad 13        //variable of length has value of quad 13
msg: .string "Hello World!\n"   //variable of msg has value of string Hello World!
