.DATA
A: .WORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
B: .WORD 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

.TEXT
LDR R0, =A
LDR R1, =B
MOV R2, #16

LOOP:
    LDMIA R0!, {R3-R8}
    STMIA R1!, {R3-R8}
    SUB R2, R2, #6
    CMP R2, #6
    BLT REMAINDER
B LOOP

REMAINDER:
    CMP R2, #0
    BEQ EXIT
    LDMIA R0!, {R3}
    STMIA R1!, {R3}
    SUB R2, R2, #1
B REMAINDER

EXIT:
    SWI 0X11