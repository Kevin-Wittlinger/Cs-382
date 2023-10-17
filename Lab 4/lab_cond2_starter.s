// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
// CS 382 LC
// check that if the given three points (𝑥, 𝑦) can be a right triangle.

.text
.global _start
.extern scanf

_start:
    
    ADR   X0, fmt_str   // Load address of formated string
    ADR   X1, left      // Load &left
    ADR   X2, right     // Load &right
    ADR   X3, target    // Load &target
    BL    scanf         // scanf("%ld %ld %ld", &left, &right, &target);

    ADR   X1, left      // Load &left
    LDR   X1, [X1]      // Store left in X1
    ADR   X2, right     // Load &right
    LDR   X2, [X2]      // Store right in X2
    ADR   X3, target    // Load &target
    LDR   X3, [X3]      // Store target in X3

    CMP   X3, X1  //Compare target with left
    B.LT range    //Branch to range if target < left
    CMP   X3, X2  //Compare target with right
    B.GE range    //Branch to range if target >= right

    //if its in the range 
    MOV X0, 1       //Set register X0 to 1
    ADR X1, yes     //load address of yes
    ADR X2, len_yes //load address of len_yes
    LDR X2, [X2]    //Load X2
    MOV X8, 64      //set register X8 as 64
    SVC 0           //Invoke syscall
    B exit          //branch to exit

range: //not in the range 
    MOV X0, 1       //set register X0 to 1
    ADR X1, no      //load address of no
    ADR X2, len_no  //load address of len_no
    LDR X2, [X2]    //Load X2
    MOV X8, 64      //set register X8 as 64
    SVC 0           //Invoke syscall
    B exit          //branch to exit

exit: // exit branch
    MOV   X0, 0        // Pass 0 to exit()
    MOV   X8, 93       // Move syscall number 93 (exit) to X8
    SVC   0            // Invoke syscall

.data
    left:    .quad     0
    right:   .quad     0
    target:  .quad     0
    fmt_str: .string   "%ld%ld%ld"
    yes:     .string   "Target is in range\n"
    len_yes: .quad     . - yes  // Calculate the length of string yes
    no:      .string   "Target is not in range\n"
    len_no:  .quad     . - no   // Calculate the length of string no
