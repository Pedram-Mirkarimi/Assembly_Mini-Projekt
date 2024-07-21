.model  small
.stack  256
.data
   s1  db "lower ","$"
   s2  db "grather ","$"
   k   db  ?
.code
p  proc  far
            mov  ax,@data
            mov  ds,ax
                  mov al,01h
                  int  21h
                  mov  k,al
                  sub  k,48
            Cmp   k,5
            Jnl    w         
               mov dx,offset s1
               mov ah,09h
               int  21h
            Jmp   end_if
W:             mov dx,offset s2
               mov ah,09h
               int  21h
End_if:
    mov ah,4ch
    int  21h
    p  endp
end p