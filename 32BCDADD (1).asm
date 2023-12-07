.MODEL SMALL
.DATA
    ; Split the two 32-bit BCD values into four 16-bit variables
    n1_low DW 5678h 
    n1_high DW 1234h  
    n2_low DW 2222h  
    n2_high DW 1111h 
    result_low DW ?
    result_high DW ?
    carry DW 0
    temp DW ?

.CODE
.STARTUP
 
    MOV result_low, 0
    MOV result_high, 0
    CALL bcd_add_low
    MOV AX, 0
    ADC AX, 0  
    ADD result_high, AX

    CALL bcd_add_high

    CALL disp
    MOV AH, 4Ch
    INT 21h

bcd_add_low PROC NEAR

    MOV CX, 4

up_low:
    
    MOV AX, n1_low
    ROL AX, 4
    MOV temp, AX  ; Store a copy in temp

    MOV AX, n2_low
    ROL AX, 4
    ADD AX, temp  
    ADC AL, 0     

    
    ROR AX, 4
    MOV result_low, AX

  
    DEC CX
    JNZ up_low

    RET
bcd_add_low ENDP

bcd_add_high PROC NEAR
    ; Initialize loop counter
    MOV CX, 4

up_high:
    ; Load the BCD digits from n1_high and n2_high
    MOV AX, n1_high
    ROL AX, 4
    MOV temp, AX  ; Store a copy in temp

    MOV AX, n2_high
    ROL AX, 4
    ADD AX, temp  
    ADC AL, 0     

    
    ROR AX, 4
    MOV result_high, AX

    ; Decrement the counter and continue
    DEC CX
    JNZ up_high

    RET
bcd_add_high ENDP

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
    ; Load and display the least significant digit
    MOV DL, '0'
    ADD DL, AL
    MOV AH, 02h
    INT 21h

    ; Shift to the next digit
    ROL AX, 4

    ; Decrement the counter and continue
    DEC CX
    JNZ up_disp

    POP CX
    RET
display_digit ENDP

MOV AX, 4C00h
INT 21h

END
