//Kevin Wittlinger
//I pledge my honor that I have abided by the stevens honor system

.text
.global _start
_start:

    MOV X0, 0 //Set register X0 to 0
    MOV X1, 0 //Set register X1 to 0
    ADR X2, vec1 //loads vec1 into register X2
    ADR X3, vec2 //loads vec2 into register X3
    ADR X4, dot //loads dot into register X7

    LDR X5, [X2, 0] //Loads first element of vec1
    LDR X6, [X3, 0] //Loads first element of vec2
    MUL X7, X5, X6  //Multiplies X5 and X6 stored in X7
    ADD X0, X0, X7  //add X0 and X7 to X0

    ADD X2, X2, #8 // Move to next element of vec1
    ADD X3, X3, #8 // Move to next element of vec2

    LDR X5, [X2] //Loads second element of vec1
    LDR X6, [X3] //Loads second element of vec2
    MUL X7, X5, X6  //Multiplies X5 and X6 stored in X7
    ADD X0, X0, X7  //add X0 and X7 to X0

    ADD X2, X2, #8 // Move to next element of vec1
    ADD X3, X3, #8 // Move to next element of vec2

    LDR X5, [X2] //Loads third element of vec1
    LDR X6, [X3] //Loads thrid element of vec2
    MUL X7, X5, X6  //Multiplies X5 and X6 stored in X7
    ADD X0, X0, X7  //add X0 and X7 to X0
    
    STR X0, [X4]  //Store the result into X4

    MOV X0, 0           // Set register X0 to 0 (return code)
    MOV X8, 93          // Set register X8 to 93 (syscall number for exit)
    SVC 0               // Invoke syscall to exit

.data
    vec1: .quad 10, 20, 30
    vec2: .quad 1, 2, 3
    dot: .quad 0
