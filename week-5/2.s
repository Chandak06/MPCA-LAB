.DATA
A: .WORD 1,2,3,4,5,6,7,8,9
B: .WORD 0,0,0,0,0,0,0,0,0

.TEXT

MOV R0,#0
MOV R2,#3
LDR R3,=A
LDR R4,=B

ROW:
    CMP R0,#3
    BEQ EXIT
    MOV R1,#0
    COLUMN:
        CMP R1,#3
        BEQ NEXT_ROW
        BL ADDRESS
        LDR R7,[R6]
        STR R7,[R4]
        ADD R4,R4,#4
        ADD R1,R1,#1
        B COLUMN

NEXT_ROW:
    ADD R0,R0,#1
    B ROW

ADDRESS:
    STMFD R13!,{R2,R1,LR}
    MLA R5,R0,R2,R1
    MOV R5, R5, LSL #2
    ADD R6,R3,R5
    LDMFD R13!,{R2,R1,LR}
    MOV PC,LR

EXIT:
    SWI 0x11

.END