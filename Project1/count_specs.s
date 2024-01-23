
/*  Name: Kevin Wittlinger
    Pledge: I pledge my honor that I have abided by the Stevens Honor System
 */

.global count_specs

.equ ascii_percent_character, 37   //value for '%'

count_specs:
    SUB SP, SP, 16      //allocate space in stack
    STR X0, [SP]        //store pointer to string in stack 
    MOV X1, 0           //Initialize X1 for counting 

loop:
    LDRB W3, [X0], 1    //Load a byte from memory and increment pointer
    CBZ W3, exit        //Exit if the byte is null
    CMP W3, ascii_percent_character //compare with '%'
    B.NE loop           //continue to next byte if not '%'
    LDRB W4, [X0]       //Load next byte after '%'
    CMP W4, #'a'        //Check if byte is 'a'
    B.NE loop           //continue to next byte if not 'a'
    ADD X1, X1, 1       //increment to # of '%a'
    ADD X0, X0, 1       //move to next char
    B loop              //loop

exit:
    MOV X0, X1          //store count as X0
    ADD SP, SP, 16      //restore stack pointer
    RET                 //return 


/*
    Declare .data here if you need.
*/
