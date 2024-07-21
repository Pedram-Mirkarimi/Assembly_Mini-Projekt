.model  small
.stack  256
.data
  s1   db "far,ord,khor","$"
  s   db "no session","$"
  k  db "spring","$"
   l1   label byte
     max  db  20
     len  db  ?
     b  db 20 dup(" ")
     d   db  "$"    
     
     
.code
p  proc  far
            mov  ax,@data
            mov  ds,ax
                  
                  mov ah,01
                  int  21h
  cmp  al,'s'
  je  l_1    
  mov dx,offset  s
  mov  ah,09h
  int  21h
  jmp  e_n
    l_1:
  mov dx,offset  s1
  mov  ah,09h
  int  21h
  jmp  e_n
            
            
 e_n: 
    mov ah,4ch
    int  21h
    p  endp
end p