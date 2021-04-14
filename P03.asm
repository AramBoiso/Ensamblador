pila  segment   para stack'stack'
pila  ends

extra segment para public 'data'
extra ends

datos segment para public 'data'
c1 db"ensamblador es facilisimo$"
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
          
          mov DH,24
          mov dl,79
          mov CH,0
          mov CL,0
          mov AH,6
          mov AL,0
          mov BH,7
          mov 10H


          mov DH,10
          mov dl,05
          mov ah,2
          mov bh,0
          int 10h


         lea dx, c1
         mov ah, 9h 
         int 21h


          ret
p0        endp


codigo  ends
        end p0
