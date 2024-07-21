.model big
.stack 128 
.data
  msg1  db "Please enter first number: $"   
  msg2  db "Now enter second number: $"
  msg3  db "What operation do you need (+,-,*,/): $"  
  msg5  dw "0$" 
  msg6  dw "The Result is: $"
  
  Firstnumber  dw ?  
  Secondnumber  dw ?     
  index db ?  
  temp dw ?  
  Result dw 5 dup("$") 
.code    
function proc far 
    
    mov ax,@data
    mov ds,ax
    
   REEE: 
    lea dx,msg1
    mov ah,09h
    int 21h  
    
   RE1:
    mov index,0
     
   R1:
    cmp index,2 ;brayeh mahdod kardan tedad vorodi
    je next1
    add index,1
     
    mov ah,07h
    int 21h
     
    cmp al,13 ;agar enter bod edameh nadahad
    je next1 
     
    cmp al,47
    jle WI1     ;agar kochktar bod 
    cmp al,58   
    jge WI1     ;agar bozorgtar bod
    mov ah,0      
    sub ax,48       ;tabdil be adad
    
    mov temp,ax     ;backup
               
                    ;chap addad dasorat dorost bodan
    mov msg5,ax
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov ax,0     
    mov al,10
    mul firstnumber
    add ax,temp
    mov firstnumber,ax 
    jmp R1
     
   WI1: 
    sub index,1
    jmp R1
     
   next1:
    cmp index,1
    je RE1 
    
    mov  dl,13  ;shif back to first
    mov  ah,02h
    int  21h
            
    mov  dl,10  ;new line
    mov  ah,02h
    int  21h
    
    lea dx,msg2
    mov ah,09h
    int 21h 
    
    mov index,0 
    
    
   RE2:
    mov index,0 
    
   R2:
    cmp index,2 ;brayeh mahdod kardan tedad vorodi
    je next2
    add index,1
     
    mov ah,07h
    int 21h
     
    cmp al,13 ;agar enter bod edameh nadahad
    je next2 
     
    cmp al,47
    jle WI2     ;agar kochktar bod 
    cmp al,58   
    jge WI2     ;agar bozorgtar bod
    mov ah,0      
    sub ax,48       ;tabdil be adad
    
    mov temp,ax     ;backup
               
                    ;chap addad dasorat dorost bodan
    mov msg5,ax
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov ax,0     
    mov al,10
    mul Secondnumber
    add ax,temp
    mov Secondnumber,ax 
    jmp R2
     
   WI2: 
    sub index,1
    jmp R2
     
   next2: 
    cmp index,1
    je RE2 
   
   
    mov  dl,13  ;shif back to first
    mov  ah,02h
    int  21h
            
    mov  dl,10  ;new line
    mov  ah,02h
    int  21h
    
    
    lea dx,msg3
    mov ah,09h
    int 21h 
    
    
   R3: 
    mov ah,07h
    int 21h
    
    mov ah,0
    mov msg5,ax
    add msg5,9216
      
    cmp al,'+'
    je SUM1     ;agar + bod 
    cmp al,'-'   
    je SUB1     ;agar - bod 
    cmp al,'*'
    je MUL1     ;agar * bod 
    cmp al,'/'   
    je DIV1     ;agar / bod
    jmp R3
    cmp al,13
    je R3 
    
   SUM1:
    mov ax,Firstnumber
    add Secondnumber,ax
    mov ax,Secondnumber
    mov Result,ax 
    jmp End
    
   SUB1:
    mov ax,Secondnumber
    sub Firstnumber,ax  
    mov ax,Firstnumber
    mov Result,ax
    jmp End
    
   MUL1:
    mov ax,Firstnumber
    mul Secondnumber
    mov Result,ax
    jmp End
    
   DIV1:
    mov dx,0
    mov ax,0
    mov ax,Firstnumber 
    div Secondnumber
    mov Result,ax 
   End:
   
    lea dx,msg5
    mov ah,09h
    int 21h 
    
    mov  dl,13  ;shif back to first
    mov  ah,02h
    int  21h
            
    mov  dl,10  ;new line
    mov  ah,02h
    int  21h
    
    lea dx,msg6
    mov ah,09h
    int 21h
    
    cmp Result,0
    jl nag
    
   keep: 
    mov dx,0 
    mov cx,1000
    mov ax,Result
    div cx
    
    mov Result,dx
    mov msg5,ax
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov dx,0 
    mov cx,100
    mov ax,Result
    div cx
    
    mov Result,dx
    mov msg5,ax
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov dx,0 
    mov cx,10
    mov ax,Result
    div cx
    
    mov Result,dx
    mov msg5,ax
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov dx,Result
    mov msg5,dx
    add msg5,48
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov  dl,13  ;shif back to first
    mov  ah,02h
    int  21h
            
    mov  dl,10  ;new line
    mov  ah,02h
    int  21h
    
    mov msg5,"0$" 
    mov Firstnumber,0  
    mov Secondnumber,0
    mov index,0  
    mov temp,0  
    mov Result,0
    
    jmp REEE
    
   nag:
    mov msg5,045
    add msg5,9216
    lea dx,msg5
    mov ah,09h
    int 21h
    
    mov cx,-1
    mov ax,Result
    mul cx
    mov Result,ax
    jmp keep 
   End1:  
function endp
end function