.model small
.stack 128 
.data
  s1  db "Enter a number1:","$"   
  s2  db "Enter a number2:","$"  
  s3  db "Enter a character:","$"  
  c1  db  ?
  c2  db  ?
  c3  db  ?
  sum  db  ?
  s    db   ?
  m    dw  ?
  d  db  ?
  r  db  ?
  s4   db "not  operator!!!","$"
.code
p  proc  far
            mov  ax,@data
            mov  ds,ax          
            
            ;  view   s1
            mov  dx,offset s1
             call view      
                       
            ;input  character                        
            call input
            mov  c1,al
            sub  c1,48
            ;  enter 
            
           call enter
            
           ;  view   s2
            mov  dx,offset s2
            call view        
                       
            ;input  character                        
            call input
            mov  c2,al              
            sub  c2,48
            ;  enter 
            
            call enter
            
           ;  view   s3
            mov  dx,offset s3
            call view        
                       
            ;input  character                        
            call input
            mov  c3,al              
              
            cmp  c3,'+'
            je   l1
            cmp  c3,'-'
            je   l2
            cmp  c3,'*'
            je   l3
            cmp  c3,'/'
            je  l4
             ;  enter 
            
            call enter            
            ;  view   s4
            mov  dx,offset s4
            call view              
            jmp  end_s
          l1:     
              mov  al,c1
              add  al,c2
              mov  sum,al
              jmp  end_s
          l2:     
              mov  al,c1
              sub  al,c2
              mov  s,al
              jmp  end_s              
           l3:     
              mov  al,c1
              mul  c2
              mov  m,ax
              jmp  end_s
          l4:     
              mov  al,c1
              mov  ah,0
              div  c2
              mov  d,al
              mov  r,ah
              jmp  end_s    
 end_s:           
  mov  ah,4ch
  int  21h
p  endp   
enter proc near
            ;  enter 
            
            mov  dl,13
            mov  ah,02h
            int  21h
            
            mov  dl,10
            mov  ah,02h
            int  21h  
            ret  
            
            enter endp  
view proc near
            mov  ah,09h
            int 21h 
            ret
           
            view endp 
input proc near
            mov ah,01h
            int  21h
                         
            ret
            input endp
end  p
    