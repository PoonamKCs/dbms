.MODEL SMALL
.DATA
 
    n1_low DW 5678h
    n1_high DW 1234h
    n2_low DW 2222h
    n2_high DW 1111h
    result_low DW ?
    result_mid DW ?
    result_high DW ?
    carry1 DW 0
    carry2 DW 0

.CODE
.STARTUP
    MOV result_low, 0
    MOV result_mid, 0
    MOV result_high, 0
    MOV AX, n1_low
    MUL n2_low
    ADD result_low, AX 
    MOV AX, 0
    ADC AX, 0  
    ADD result_mid, AX
    MOV AX, n1_low
    MUL n2_high
    ADD result_mid, AX

    MOV AX, n1_high
    MUL n2_low
    ADD result_mid, AX

    MOV AX, 0
    ADC AX, 0
    ADD result_high, AX
    MOV AX, n1_high
    MUL n2_high
    ADD result_high, AX

    CALL disp
    MOV AH, 4Ch
    INT 21h

disp PROC NEAR
    MOV CX, 16  

up:
    MOV AX, result_high
    ROL AX, 4
    MOV result_high, AX

    MOV AX, result_mid
    ROL AX, 4
    MOV result_mid, AX

    MOV AX, result_low
    ROL AX, 4
    MOV result_low, AX
    MOV AX, result_low  
    AND AX, 0Fh
    CMP AL, 0Ah
    JAE dl
    ADD AL, 7

dl:
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h
    DEC CX
    JNZ up
    RET

disp ENDP

MOV AX, 4C00h
INT 21h

END
