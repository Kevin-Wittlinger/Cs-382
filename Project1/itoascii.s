
/*  
    Name:Kevin Wittlinger
    Pledge: I pledge my honor that I have abided by the Stevens Honor System
 */

.global itoascii

itoascii:
   SUB SP, SP, 16          // space in storage
   STR X30, [SP]           // Store X30 in the stack

   MOV X1, 10              // X1 = 10
   MOV X2, 0               // Initialize X2 (length) to 0
   MOV X3, 0               // Initialize X3 (index) to 0
   MOV X4, X0              // Copy input to X4
   ADR X7, buffer          // Load address of buffer
   ADR X8, reversebuffer   // Load address of reversebuffer
   CBZ X4, base            // If input is zero, go to base case

length:
   UDIV X0, X4, X1         // Divide by 10
   MUL  X6, X0, X1         // Multiply quotient by 10
   SUB  X6, X4, X6         // Calculate remainder
   ADD  X6, X6, 48         // Convert to ASCII
   STRB W6, [X8, X2]       // Store in reversebuffer
   ADD  X2, X2, 1          // Increment length
   MOV  X4, X0             // Update input for the next iteration
   CBZ  X0, loop           // If quotient is zero, go to endloop
   B length

base:
   MOV  X6, 48             // X6 = ASCII '0'
   STRB W6, [X7]           // Store '0' in the buffer
   B end                   // Go to end

loop:
   CBZ  X2, end            // If length is zero, go to end
   SUB  X2, X2, 1          // Decrement length
   LDRB W6, [X8, X2]       // Load character from reversebuffer
   STRB WZR, [X8, X2]      // Clear character in reversebuffer
   STRB W6, [X7, X3]       // Store character in buffer
   ADD  X3, X3, 1          // Increment index for buffer
   B loop

end:
   ADR X0, buffer          // Load address of buffer to return
   LDR X30, [SP]           // Restore register
   ADD SP, SP, 16          // Deallocate space
   RET

.data
    /* Put the converted string into buffer,
       and return the address of buffer */
   buffer: .fill 128, 1, 0
   reversebuffer: .fill 128, 1, 0



