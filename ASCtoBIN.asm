.model small
.data

msg0 db 10,13,"Enter ASCII character : $"
msg1 db 10,13,"The binary equivalent to : $"
a db ?
 
.code
.startup
    LEA DX,msg0
    MOV AH,09H
    int 21H
    MOV AL,01H
    int 21H
    LEA DX,msg1
    MOV AH,09H
    int 21H
    MOV CH,08H
    MOV AH,00H

UP: SHL AL,01H
    MOV BL,AL
    MOV AL,00H
    ADC AL,30H
    MOV DL,AL
    MOV AH,02H
    DEC CL
    JNZ UP
    MOV AH,04CH
    int 21H
end
    