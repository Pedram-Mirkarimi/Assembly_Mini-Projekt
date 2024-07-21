.model small
.stack 256
.data
          s db "Enter your name:","$"
         list1 label byte
             max db 15
             len db ?
             b db 15 dup(" ")
             d db '$'
           s1  db 13,10,"Enter a Character:","$"
           k   db ?            
           s2  db 00001101b,0aH,"found","$"
           s3  db 13,10,"not  found","$"
.code
p1 proc far
    mov ax,@data
    mov ds,ax    
    ;  clear  screen
    mov ah,06h
    mov al,25
    mov cx,0
    mov dx,184fh          ;mov  dh,24   mov dl,79
    mov bh,0e9h
    int 10h
      ;  view       s
        mov  dx,offset s        
        mov  ah,09h
        int  21h               
        ;input  name       
    mov ah,0ah
    mov dx,offset list1    ;  lea   dx,list1
    int 21h  
       ;  char to char 
    mov cl,len           
    mov ch,0
    mov bx,offset b
back:                    
;  enter
    mov dl,13       
    mov ah,02h
    int 21h
    
    mov dl,10
    mov ah,02h
    int 21h   
        ;
    mov dl,[bx]
    mov ah,02h
    int  21h   
    
    inc bx
    loop back
          ;  view       s1
        mov  dx,offset s1        
        mov  ah,09h
        int  21h         
         ;  input char
         mov  ah,01h
         int  21h
         mov  k,al   
        
    mov cl,len           
    mov ch,0
    mov bx,offset b
    back2:    
            cmp  al,[bx]
            je   e1
       
    inc bx
    loop back2           
    ;  view       s3
        mov  dx,offset s3        
        mov  ah,09h    
        int  21h 
        jmp  e2
    e1:  ; view       s2
        mov  dx,offset s2
        mov  ah,09h    
        int  21h 
           e2:
    mov ah,4ch
    int 21h
    p1 endp
end p1

