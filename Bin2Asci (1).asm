.model small
.data

Input DB 10,13,"Enter 8-bit Binary no. : $"
Output DB 10,13,"The ASCII code is : $"
Arr DB ?

.code
.startup
    MOV AH,09H
    MOV DX,offset Input
    Int 21H
    MOV BL,00H
    MOV CL,08H
   
I1 :MOV AH,01H
    Int 21H
    SUB AL,30H
    SHL BL,01H
    ADD BL,AL
    Loop I1
    MOV AH,09H
    LEA DX, Output
    Int 21H
    Mov AH,02H
    Mov DL,BL
    Int 21H
    MOV AH,04CH
    Int 21H
   end