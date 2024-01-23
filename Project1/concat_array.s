
/*  Name: Kevin Wittlinger
    Pledge: I pledge my honor that I have abided by the Stevens Honor System
 */

.global concat_array

concat_array:
   SUB SP, SP, 56       //allocate space in stack
   STR X19, [SP, 8]     //storing X19-X24 on stack
   STR X20, [SP, 16]
   STR X21, [SP, 24]
   STR X22, [SP, 32]
   STR X23, [SP, 40]
   STR X24, [SP, 48]
   STR X30, [SP]        //Store X30 in stack

   MOV X19, 0           //Initialize X19 to 0
   MOV X20, 0           //Initialize X20 to 0
   MOV X23, X1          //copy arraylength to X23
   ADR X24, concat_array_outstr  //Load address of concat_array into X24

ascii:
   CBZ X1, end          //check if array length is zero 
   LDR X8, [X0, X20]    //load value to X8, from value stored in X20 to base X0
   MOV X21, 0           //Initialize X21 to 0
   MOV X22, X0          //copy array pointer to X22
   MOV X23, X1          //copy array length to X23
   MOV X0, X8           //move to X0 to be converted
   BL itoascii          //call itoascii converting value to ascii
   LDRB W18, [X0]       //Load byte from new ascii string pointed at X0
   STRB WZR, [X0]       //Null Terminate 
   B store              //Branch

store:
   CBZ W18, space          //If byte is null, branch
   STRB W18, [X24, X19]    //store byte in concat_array
   STRB WZR, [X0, X21]     //Null terminate
   ADD X19, X19, 1         //Increment for concat_array
   ADD X21, X21, 1         //Increment Ascii string
   LDRB W18, [X0, X21]     //load next byte from ascii string
   B store                 //branch 

space:
   MOV X0, X22             //restore array pointer to X0
   MOV X1, X23             //restore array length to X1
   MOV W17, 32             //Ascii value for space 
   STRB W17, [X24, X19]    //store space into concat_array
   ADD X20, X20, 8         //Increment array index
   ADD X19, X19, 1         //Increment for concat_array
   SUB X1, X1, 1           //decrement for array length
   CBZ X1, end             //if array length = 0 go to end
   B ascii                 //branch

end:
   STRB WZR, [X24, X20]          //Null terminate
   ADR X0, concat_array_outstr   //load address of concat_array
   LDR X19, [SP, 8]              //Load registers X19-X24
   LDR X20, [SP, 16]
   LDR X21, [SP, 24]
   LDR X22, [SP, 32]
   LDR X23, [SP, 40]
   LDR X24, [SP, 48]
   LDR X30, [SP]                 //restore X30
   ADD SP, SP, 56                //Deallocate space in stack
   RET                           //return

.data
    /* Put the converted string into buffer,
       and return the address of buffer */
    concat_array_outstr:  .fill 1024, 1, 0
    