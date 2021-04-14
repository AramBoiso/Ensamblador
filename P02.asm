pila  segment   para stack 'stack'


pila  ends
extra segment para public 'data'

 c1 db"ensamblador es facilisimo$"
   
extra ends
datos segment para public 'data'



datos ends
codigo  segment  para public 'code'
          assume cs:codigo , ds:datos , es:extra , ss:pila
          public p0
p0        proc far
          push ds
          mov ax,0
          push ax
          mov ax, datos
          mov ds, ax
          mov ax, extra
          mov es,ax


        lea dx, c1
        mov ah, 9h 
        int 21h


          ret
p0        endp

p1        proc

        ret
p1        endp

codigo  ends
        end
