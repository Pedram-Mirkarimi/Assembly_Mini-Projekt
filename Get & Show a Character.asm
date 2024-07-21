.model small
.stack  256
.data
    s1   db "Enter a character:$"
    s2   db   0dh,0ah,"view   char:$"
    c    db  ?
    s3   db 0dh,0ah, "Enter a string:$"
    s4   db 0dh,0ah, "View string:$"                
    s5   db  0dh,0ah,"Found$"
    s6   db 0dh,0ah,"not  found$"
    list1   label   byte
    max  db  15
    len  db  ?
    b   db  15 dup(" ")
    d   db "$"
.code
p  proc  far
   mov  ax,@data
   mov   ds,ax
   mov  dx,offset  s1
   mov  ah,09h
   int 21h
   mov   ah,01h
   int  21h
   mov   c,al
          mov  dx,offset  s2
   mov  ah,09h
   int 21h
   mov   dl,c
   mov  ah,02h
   int  21h
                               
 mov  dx,offset  s3
   mov  ah,09h
   int 21h         
   
   mov ah,0ah
   mov   dx,offset  list1 
   int  21h                      
 
 mov  dx,offset  s4
   mov  ah,09h
   int 21h         
   
   mov  dx,offset  b
   mov  ah,09h
   int 21h         
     mov  dl,c 
      mov  si,offset  b
      mov   cx,15
back:      
      cmp   [si],dl   ;[]  -->  *
      je   e1
      inc  si
      loop  back
      jmp  e2
e1:
      mov  dx,offset  s5
      mov  ah,09h
      int 21h        
      jmp  e3 
 e2:
      mov  dx,offset  s6
      mov  ah,09h
      int 21h         
e3:
      mov  ah,4ch
      int  21h
p  endp
end  p