// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
// CS 382 LC
// check that if the given three points (𝑥, 𝑦) can be a right triangle.

.text 
.global _start
_start:
    
    ADR   X0, side_a    // Load address of side_a
    ADR   X1, side_b     // Load address of side_b
    ADR   X2, side_c     // Load address of side_c
    
    LDR X0, [X0]   //load X0
    LDR X1, [X1]   //load X1
    LDR X2, [X2]   //load X2
    
    MUL X3, X0, X0  //calculates ^2 of side_a
    MUL X4, X1, X1  //calculates ^2 of side_b
    MUL X5, X2, X2  //calculates ^2 of side_c
    ADD X6, X3, X4  //Adds X3 and X4 then puts in register X6

    CMP X6, X5  //X5 and X6 with one another
    B.EQ right_triangle   //Branches to yes if X5 == X6

    MOV X0, 1       //set register X0 to 1
    ADR X1, no      //load address of no
    ADR X2, len_no    //load address of len_no
    LDR X2, [X2]      //load X2 
    MOV X8, 64        //set register X8 to 64
    SVC 0             //invoke syscall
    B exit            //branch to exit

right_triangle:      //yes branch
    MOV X0, 1       //set register X0 to 1
    ADR X1, yes    //load address of yes
    ADR X2, len_yes //load address of len_yes
    LDR X2, [X2]    //load X2
    MOV X8, 64      //set register X8 to 64
    SVC 0           //invoke syscall
    B exit          //branch to exit

exit: //exit branch
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
side_a: .quad 3
side_b: .quad 4
side_c: .quad 5
yes: .string "It is a right triangle.\n"
len_yes: .quad . - yes // Calculate the length of string yes
no: .string "It is not a right triangle.\n"
len_no: .quad . - no // Calculate the length of string no
