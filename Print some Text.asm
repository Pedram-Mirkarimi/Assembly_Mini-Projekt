.model  small
        .stack   256
        .data 
            s   db "this is a test","$"
        .code
        p   proc  far   
              mov  ax,@data
              mov  ds,ax
              
            mov   ah,06h
            mov   al,5
            mov   ch,10    ;mov cx,0a19h
            mov   cl,0
            mov   dh,14
            mov   dl,79
            mov   bh,0ech  ; e:Bacground Color / c:Font Color / h:hexadecimal
            int   10h
             
            mov  ah,02h
            mov  dh,12
            mov  dl,32
            mov   bh,0
            int  10h  
                  
            mov  dx,offset  s  ;My Text     
            mov  ah,09h
            int  21h  
            
            mov  ah,4ch
            int  21h
            p  endp
        end  p

