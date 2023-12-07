.model small
 .386
.data 
  n1 dd 12345678h  
  n2 dd 11112222h
  n3 dd ?
  carry dd 0
.code 
   
.startup
  MOV eax,n1
  MOV ebx,n2
  add eax ,ebx
  add eax,carry
  mov n3,eax
  
  call disp
   mov ah,04ch
   int 21h
   
 disp proc near
 
 MOV ch,08h 
    
 up: mov eax,n3
     rol eax,04h
     
     mov n3,eax
     and al,0Fh
     cmp al,0Ah
     jc d1
      add al,07h
      
   d1:add al,30h
       mov dl,al
       mov ah,02h
       int 21h
       dec ch
       jnz up
      ret
   ends disp
  
end
.exit