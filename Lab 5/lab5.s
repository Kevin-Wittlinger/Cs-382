// Kevin Wittlinger
// I pledge my honor that I have abided by the stevens honor code
// CS 382 LC
// Prints a char into a string containing all capital letters

.text
.global _start
.extern printf

_uppercase:
    //convert chars to uppercase, store back into memory
    SUB SP, SP, 8
    STR X30, [SP]
    SUB W1, W1, 32
    STRB W1, [X0, X3]  
    LDR X30, [SP]      
    ADD SP, SP, 8    
    RET
    
_toupper:
        SUB SP, SP, 8
        STR X30, [SP]
     

iteration:
        //loads char from string, checks if null, call _upper
        LDRB W1, [X0, X3]       
        CBZ W1, return
        BL _uppercase
        ADD X3, X3, 1
        B iteration

return:
        //restore return address
        //deallocate space on stack
        LDR X30, [SP]
        ADD SP, SP, 8
        RET
        

_start:
        //load addresses, num of chars converted, print result
        ADR X0, str   
        MOV X3, 0
        BL _toupper             
        ADR X0, outstr        
        MOV X1, X3
        ADR X2, str            
        BL printf               
        MOV  X0, 0
        MOV  X8, 93
        SVC  0


.data
str:    .string   "helloworld"
outstr: .string   "Converted %ld characters: %s\n"
