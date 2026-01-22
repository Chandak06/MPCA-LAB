.DATA
NUM: .WORD 0

.TEXT
    LDR R0,=NUM
    LDR R0,[R0]
    CMP R0,#0
    BEQ ZERO
    BGT POS
    MOV R1,#3
    B EXIT

ZERO: 
    MOV R1,#1
    B EXIT

POS: 
    MOV R1,#2
    B EXIT

EXIT: SWI 0x011
.END