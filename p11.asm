pila segment 'stack'
    db 500 dup (?)
pila ends

extra segment para public'data'

    A db +100
    B db +64
    Amb db "a es mayor que b $"
    AnmB db "a no es mayor que b $"

extra ends

datos segment para public'data'

datos ends

codigo segment para public 'code'
    assume cs:codigo, ds:datos, es:extra, ds:pila
    public p0
p0    proc far

       push ds
       mov ax,0
       push ax
       mov ax, datos
       mov ds, ax
       mov ax, extra
       mov es, ax 


       Lea bx, A
       mov al, [bx]
       lea bx, B
       mov bl,[bx]

       Cmp al, bl
       Jg iamb

       lea dx, AnmB
       mov ah, 9
       int 21H
       jmp fin

iamb:  lea dx, amb
       mov ah,9
       int 21h

       ret
p0    endp

codigo ends

    end p0