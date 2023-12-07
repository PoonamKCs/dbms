.MODEL SMALL
.DATA
    prompt0 DB    'Enter Length of Array (<=10): $'
    prompt1 DB    13, 10, 'Enter Elements (Sorted): $'
    prompt2 DB    13, 10, 'Enter Key: $'
    msg1    DB    13, 10, 'Element Not Found $'
    msg2    DB    13, 10, 'Element Found $'
    array   DB    10 DUP(?)
    len     DW    ?
    key     DB    ?
    found   DB    ?
.CODE
.STARTUP
    LEA     DX,   prompt0
    MOV     AH,   09H
    INT     21H

    MOV     AH,   01H
    INT     21H
    MOV     AH,   00H
    SUB     AL,   30H
    MOV     len,  AX

    LEA     DX,   prompt1
    MOV     AH,   09H
    INT     21H

    LEA     SI,   array
    MOV     AL,   key
    MOV     CX,   len

input:
    MOV     AH,   01H
    INT     21H
    MOV     [SI], AL
    INC     SI
    MOV     DL,   20H
    MOV     AH,   02H
    INT     21H
    LOOP    input

    LEA     DX,   prompt2
    MOV     AH,   09H
    INT     21H

    MOV     AH,   01H
    INT     21H
    MOV     key,  AL

    LEA     SI,   array
    MOV     CX,   len

    
    XOR     CX, CX         
    MOV     DX, len        
    DEC     DX              
    CALL    BinarySearch

    
    CMP     found, 1
    JE      found_msg
    JMP     not_found_msg

found_msg:
    LEA     DX, msg2
    MOV     AH, 09H
    INT     21H
    JMP     final

not_found_msg:
    LEA     DX, msg1
    MOV     AH, 09H
    INT     21H

final:
.EXIT

BinarySearch:
    PUSH    SI
    MOV     SI, DX          
    ADD     SI, CX         
    SHR     SI, 1         
    MOV     AL, [array + SI]
    CMP     AL, key
    JE      KeyFound
    JB      LowerHalf
    JA      UpperHalf

KeyFound:
    MOV     found, 1
    POP     SI
    RET

LowerHalf:
    DEC     SI
    PUSH    SI
    PUSH    CX
    CALL    BinarySearch
    POP     CX
    POP     SI
    RET

UpperHalf:
    INC     SI
    PUSH    SI
    PUSH    DX
    CALL    BinarySearch
    POP     DX
    POP     SI
    RET
final:
.EXIT
END