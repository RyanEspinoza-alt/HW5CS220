// Div.asm
// Computes R2 = R0 / R1 (integer division) by repeated subtraction.
// Equivalent Java:
//   R2 = 0;
//   while (R0 >= R1) { R0 = R0 - R1; R2++; }

// --- Initialize the quotient ---
@R2
M=0          // R2 = 0 (quotient starts at 0)

// --- Load the dividend into D ---
@R0
D=M          // D = R0 (D holds what's left of the dividend)

(LOOP)
// --- Subtract the divisor once ---
@R1
D=D-M        // D = D - R1

// --- Stop if we subtracted too much (D went negative) ---
@END
D;JLT        // if D < 0, R1 no longer fits, so jump to END

// --- Count one successful subtraction ---
@R2
M=M+1        // R2 = R2 + 1

// --- Repeat ---
@LOOP
0;JMP        // unconditional jump back to LOOP

(END)
// --- Infinite loop to end the program (prevents NOOP slide) ---
@END
0;JMP        // jump to itself forever