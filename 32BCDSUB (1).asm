.MODEL SMALL
.DATA
   
    n1_low DW 5678h 
    n1_high DW 1234h  
    n2_low DW 2222h  
    n2_high DW 1111h 
    result_low DW ?
    result_high DW ?
    borrow DW 0
    temp DW ?

.CODE
.STARTUP

    MOV result_low, 0
    MOV result_high, 0
    CALL bcd_sub_low
    MOV AX, 0
    SBB AX, 0  
    SUB result_high, AX

    CALL bcd_sub_high

    CALL disp
    MOV AH, 4Ch
    INT 21h

bcd_sub_low PROC NEAR
    ; Initialize loop counter
    MOV CX, 4

up_low:
    MOV AX, n1_low
    ROL AX, 4
    MOV temp, AX  ; Store a copy in temp

    MOV AX, n2_low
    ROL AX, 4
    SUB AX, temp  
    SBB AL, 0     

    ; Store the result in result_low
    ROR AX, 4
    MOV result_low, AX

    DEC CX
    JNZ up_low

    RET
bcd_sub_low ENDP

bcd_sub_high PROC NEAR
    MOV CX, 4

up_high:
    
    MOV AX, n1_high
    ROL AX, 4
    MOV temp, AX 

    MOV AX, n2_high
    ROL AX, 4
    SUB AX, temp  
    SBB AL, 0     ; Subtract borrow if present

    ROR AX, 4
    MOV result_high, AX

    
    DEC CX
    JNZ up_high

    RET
bcd_sub_high ENDP

disp PROC NEAR
    ; Display result_high
    MOV AX, result_high
    CALL display_digit

    ; Display result_low
    MOV AX, result_low
    CALL display_digit

    RET

display_digit PROC NEAR
    PUSH CX
    MOV CX, 4  ; Display 4 digits

up_disp:
    
    MOV DL, '0'
    ADD DL, AL
    MOV AH, 02h
    INT 21h

    
    ROL AX, 4

    
    DEC CX
    JNZ up_disp

    POP CX
    RET
display_digit ENDP

MOV AX, 4C00h
INT 21h

END
