           .model small
.data
    array1  db 5 DUP(?)  
    array2  db 5 DUP(?)  
    result  db 5 DUP(?)  ; Array to store the result in decimal format
    array_size db 5
    result_prompt db 13, 10, 'Resultant Array in Decimal (Subtraction): $'
    input_prompt db 13, 10, 'Enter 5 elements for the array: $'
.code
.startup
    
    mov ah, 09h
    lea dx, input_prompt
    int 21h
    mov cx, 5
    lea di, array1
    call read_array
    mov ah, 09h
    lea dx, input_prompt
    int 21h
    mov cx, 5
    lea di, array2
    call read_array

    ; Subtract the two arrays and store the result in the 'result' array
    mov cx, 5
    lea si, array1
    lea di, array2
    lea bx, result
subtract_arrays:
    mov al, [si]
    sub al, [di]
    mov [bx], al
    inc si
    inc di
    inc bx
    loop subtract_arrays

    ; Print the result array in decimal format
    mov ah, 09h
    lea dx, result_prompt
    int 21h
    mov cx, 5
    lea bx, result
    call print_result

exit:
    int 20h

read_array:
    mov ah, 01h
    int 21h
    mov dl, al
    sub dl, 30h
    mov [di], dl
    inc di
    loop read_array
    ret

print_result:
    mov cx, 5
    mov ah, 02h
print_loop:
    add dl, 30h   ; Convert to ASCII character
    int 21h
    inc bx
    loop print_loop
    ret
