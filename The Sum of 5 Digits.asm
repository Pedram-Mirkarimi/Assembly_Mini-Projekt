.model small
.data
  maxlena db 6
  actlena db ?
  numa    db 6 dup(?)
  maxlenb db 6
  actlenb db ?
  numb    db 6 dup(?)
  messagea db 0DH,0AH,'please enter numberA:',0AH,0DH,'$'
  messageb db 0DH,0AH,'please enter numberB:',0AH,0DH,'$'
  messagec db 0DH,0AH,'numberA + numberB =  ',0AH,0DH,'$'
  cary db 0
 
  numc db 6 dup(' '),'$'
 .code
  main proc
    mov ax,@data
    mov ds,ax
 
    lea dx,messagea     ;mov  dx,offset  messagea
    call print_string
    lea dx,maxlena
    call read_string

    lea dx,messageb
    call print_string
    lea dx,maxlenb
    call read_string

    lea si,numa
    call asctobin
    mov bx,ax
    
    lea si,numb
    call asctobin
    add ax,bx
    
    jnc a1:
    
    mov cary,1
    
    a1:mov si,offset numc
    call bintoasc
  
    lea dx,messagec
    call print_string
 
    lea dx,numc
    call print_string
    mov ah,4ch
    int 21h
  main endp
 
  read_string proc
    mov ah,10      ;mov  ah,0ah
    int 21h
    ret
  read_string endp
  print_string proc
    mov ah,9
    int 21h
    ret
  print_string endp
  asctobin proc
    push bx
    
    mov ax,0
  cont:
    mov bl,[si]
    cmp bl,0dh
    jz exit1
    mov dx,10
    mul dx
    sub bl,'0'
    mov bh,0
    add ax,bx 
    
    inc si
    jmp cont
  exit1:
    pop bx
    ret
  asctobin endp
  bintoasc proc
    
    add si, 5
      
    mov bx,10
    mov dh,0
    
    mov dl,cary
    
  conti:
    
    div bx
    add dl,'0'
    mov [si],dl
    cmp ax,0  
    je fin
    mov dx,0
    dec si
    
    jmp conti
  fin:
    ret
  bintoasc endp
  end main
