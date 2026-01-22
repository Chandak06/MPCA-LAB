.DATA
A:   .WORD 1,2,3,4,5,6,7,8,9,10
SUM: .WORD 0

.TEXT
    LDR R0,=A
    MOV R1,#10
    MOV R2,#0

LOOP:
    LDR R3,[R0]
    TST R3,#1
    BNE SKIP         

    ADD R2,R2,R3   

SKIP:
    ADD R0,R0,#4    
    SUBS R1,R1,#1  
    BNE LOOP

    LDR R4,=SUM
    STR R2,[R4]

    SWI 0x011
.END
