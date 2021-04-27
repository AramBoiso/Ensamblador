pila segment para stack 'stack'

    dw 500 dup(?)

pila ends

datos segment para public 'data'

    gen    db 'Tecnol',162,'gico Nacional de Mexico$'
    school db 'Instituto Tecno',162,'lgico de Ciudad Guzm',160,'n$'
    carrer db 'Carrera: Ing. Sistemas Computacionales$'
    sem    db 'Semestre: 6to$'
    grup   db 'Grupo: A$'
    mat    db 'Materia: Lenguajez de Interfaz$'
    stu    db 'Alumno: Guzm',160,'n Boiso Aram  Missael$'
    nc     db 'N',163,'mero de Control: 18290889$'
    doc    db 'Docente: Estanislao Castillo Horta$'
    per    db 'Periodo: Enero - Junio de 2021$'
    fec    db 'Fecha: 26 de abril de 2021$'
    prog   db 'Programa 04$'
    desc   db 'Programa para calcular la raiz cuadrada de un n',163,'mero.', '$'
    m1     db 'Ingrese la cantidad a calcular: ','$'
    cad2 db 'El resultado es:$'
    cad3 db 'El programa calcula la ra',162,'z cuadrada de un numero aproximadamente$'
    cad4 db 'El programa solo maneja n',163,'meros$'
    cad5 db 'N',163,'mero invalido el n',163,'mero mayor es 65535$'
    clean db '                                $'
    num dw 6,?,6 dup(?)

datos ends

extra segment para public 'data'

extra ends

codigo segment para public 'code'

    assume cs:codigo, ds:datos, ss:pila, es:extra ;Se asignan sus los segmentos a sus respectivos registros

    public principal ; se hace publico el procedimiento

    principal proc far

        push ds
        mov ax,0
        push ax
        mov ax,datos
        mov ds,ax
        mov ax,extra
        mov es,ax

        ;Lineas necesarias para limpiar pantalla	
        mov ax,0600h 
        mov bh,07h    
        mov cx,0000h  
        mov dx,184Fh 
        int 10h

        mov ah,02H
        mov bh,00
        mov dx,0118h
        int 10H 

        lea DX,gen
	    mov AH,09
	    int 21H
        
     	mov ah,02H
        mov bh,00
        mov dx,0164h
        int 10H

        lea DX,school
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,01B4h
        int 10H

        lea DX,carrer
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,02B4h
        int 10H

        lea DX,sem
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,03B4h
        int 10H

        lea DX,grup
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,0564h
        int 10H

        lea DX,mat
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,05B4h
        int 10H

        lea DX,stu
	    mov AH,09
	    int 21H

        mov ah,02H
        mov bh,00
        mov dx,06B4h
        int 10H

        lea DX,nc
	    mov AH,09
	    int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,07B4h
	   int 10H

       lea DX,doc
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,0964h
       int 10H

       lea DX,per
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,0A64h
	   int 10H

       lea DX,fec
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,0AB4h
	   int 10H

       lea DX,prog
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,0E0Eh
	   int 10H

       lea DX,desc
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,1100h
	   int 10H

       lea DX, m1
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,1121h
	   int 10H

    main:
        cmp bp, 0
        jne com1
        mov dh, 18
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, cad5
        mov ah, 9h
        int 21h
        mov ah, 1

        mov dh, 17
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, clean
        mov ah, 9h
        int 21h
  rt:
        mov dh, 17
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, clean
        mov ah, 9h
        int 21h
  com1:
        mov dh, 17
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        
        lea dx, num
        mov ah, 0Ah
        int 21h

        cmp ah, 1
        jne n1
        mov ch,17
        mov cl,00
        mov dh,24
        mov dl,79
        mov ah,6
        mov al,0
        mov bh,7
        int 10h
        jmp conti
  n1:
        mov ch,18
        mov cl,00
        mov dh,24
        mov dl,79
        mov ah,6
        mov al,0
        mov bh,7
        int 10h
  conti:
        
        mov bx, offset num+1
        mov ch, 0
        mov cl, [bx]
  com:
        inc bx
        mov al, [bx]
        cmp al,30h
        je s
        cmp al,31h
        je s
        cmp al,32h
        je s
        cmp al,33h
        je s
        cmp al,34h
        je s
        cmp al,35h
        je s
        cmp al,36h
        je s
        cmp al,37h
        je s
        cmp al,38h
        je s
        cmp al,39h
        je s
        
        mov dh, 18
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, cad4
        mov ah, 9h
        int 21h
        mov ah, 1
        jmp rt
  s:
        loop com
        
        mov bx, offset num+1
        push bx
        mov ch, 0
        mov cl, [bx]
  c1:
        inc bx
        sub [bx], byte ptr 30h
        loop c1

        pop si
        mov cl, [si]
        mov ch, 0
        dec cx

        inc si
        mov al, [si]
        cmp al, 0
        je fin
        mov ah, 0
        cmp cl, 00
        je cont

        mov di, 0ah
        mov bp ,0
        cmp ax, 0
        je fin
  c2:
        mul di
        jc main
        inc si
        mov bl, [si]
        mov bh, 0
        add ax,  bx
        jc main 
        loop c2
  cont:
        mov bx, 00
        mov bx, 1
        mov cx, 00
  raiz:
        sub ax, bx
        add bx, 2
        inc cx
        cmp ax, bx
        jae raiz

        mov ax, cx
        mov bx, 0Ah
        mov cx, 0

  c3:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jne c3

        ;;coloca el cursor en la linea 18
        mov dh, 18
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, cad2
        mov ah, 9h
        int 21h
  c4:
        pop dx
        add dl, 30h
        mov ah, 2
        int 21h
        loop c4
        jmp fin1

  fin:
        mov dh, 18
        mov dl, 00
        mov ah,2
        mov bh,0
        int 10h

        lea dx, cad2
        mov ah, 9h
        int 21h

        mov dl, 30h
        mov ah, 2
        int 21h
  fin1:
      ret


        ; ;Lineas necesarias para limpiar pantalla	
        ; mov ax,0600h 
        ; mov bh,07h    
        ; mov cx,0000h  
        ; mov dx,184Fh 
        ; int 10h

        ; ;Lineas para mover el cursor
	    ; mov ah,02H
	    ; mov dx,0h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    ; mov bh,00h
	    ; int 10H

        ; ;Imprimir cadena
        ; lea dx, m1
        ; mov ah, 9h
        ; int 21h

        ; mov ah,02H
	    ; mov dx,001Eh ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    ; mov bh,00h
	    ; int 10H

        ; lea dx, valor
        ; mov ah, 0ah
        ; int 21h

        ; mov ah,02H
	    ; mov dx,0300h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    ; mov bh,00h
	    ; int 10H


        
       ret
    principal endp

codigo ends

end principal

; pila segment  para stack  'stack'
;     db 100 dup(?)
; pila ends

; extra segment para public 'data'
;   ;acentos
;   oce equ 0a2h
;   ece equ 082h
;   ace equ 0A0h
;   ice equ 0A1h
;   uce equ 0A3h
;   inte equ 0A8h

; extra ends

; datos segment para public 'data'
;   num word 6,?,6 dup(?)
;   cad1 db 'Inserte n',uce,'mero para calcular la ra',ice,'z  cuadrada$'
;   cad2 db 'El resultado es:$'
;   cad3 db 'El programa calcula la ra',ice,'z cuadrada de un numero aproximadamente$'
;   cad4 db 'El programa solo maneja n',uce,'meros$'
;   cad5 db 'N',uce,'mero invalido el n',uce,'mero mayor es 65535$'
;   nom_tec db 'Instituto Tecnol',oce,'gico Nacional De M',ece,'xico$'
;   nom_tecG db 'Instituto Tecnol',oce,'gico de Ciudad Guzm',ace,'n$'
;   carrera db 'Ingenier',ice,'a en Sistemas Computacionales$'
;   departamento db 'Departamento de Sistemas e Inform',ace,'tica$'
;   materia db 'Materia: Lenguajes de Interfaz$'
;   unidad db 'Unidad: 2$'
;   grupo db 'Grupo: A$'
;   titulo db 'Programa: 04$'
;   profesor db 'Estanislao Catillo Horta$'
;   alumno db 'Autor: Juan Fernando Brambila Rivera$'
;   nc db 'Numero de Control: 18290858$'
;   fecha db 'Fecha: 23/Abril/2021$'
;   clean db '                                $'


; datos ends
; codigo segment para public 'code'
;         assume cs:codigo , ds:datos , es:extra , ss:pila
;         public p0
;   p0    proc far
;         push ds
;         mov ax,0
;         push ax
;         mov ax, datos
;         mov ds, ax
;         mov ax, extra
;         mov es, ax

;         ;limpia pantalla
;         mov ch,00
;         mov cl,00
;         mov dh,24
;         mov dl,79
;         mov ah,6
;         mov al,0
;         mov bh,7
;         int 10h
;         ;pone el cursor al principio
;         mov dh, 0
;         mov dl, 10
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime nombre tec
;         lea dx, nom_tec
;         mov ah, 9h
;         int 21h

;         mov dh, 1
;         mov dl, 11
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime nombre tec guzman
;         lea dx, nom_tecG
;         mov ah, 9h
;         int 21h

;         mov dh, 2
;         mov dl, 11
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;imprime nombre carrera
;         lea dx, carrera
;         mov ah, 9h
;         int 21h

;         mov dh, 3
;         mov dl, 11
;         mov ah,2
;         mov bh,0
;         int 10h


;         ;imprime departamento
;         lea dx, departamento
;         mov ah, 9h
;         int 21h

;         mov dh, 4
;         mov dl, 15
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime materia
;         lea dx, materia
;         mov ah, 9h
;         int 21h

;         mov dh, 5
;         mov dl, 24
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime Unidad
;         lea dx, unidad
;         mov ah, 9h
;         int 21h

;         mov dh, 6
;         mov dl, 24
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime grupo
;         lea dx, grupo
;         mov ah, 9h
;         int 21h

;         mov dh, 7
;         mov dl, 24
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime titulo
;         lea dx, titulo
;         mov ah, 9h
;         int 21h

;         mov dh, 8
;         mov dl, 15
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime profesor
;         lea dx, profesor
;         mov ah, 9h
;         int 21h

;         mov dh, 9
;         mov dl, 13
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime alumno
;         lea dx, alumno
;         mov ah, 9h
;         int 21h

;         mov dh, 10
;         mov dl, 17
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime NC
;         lea dx, nc
;         mov ah, 9h
;         int 21h

;         mov dh, 11
;         mov dl, 18
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;Imprime fecha
;         lea dx, fecha
;         mov ah, 9h
;         int 21h

;         ;imprime mensaje para indicar que hace el Programa
;         mov dh, 14
;         mov dl, 0
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad3
;         mov ah, 9h
;         int 21h

;         mov dh, 15
;         mov dl, 0
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad1
;         mov ah, 9h
;         int 21h
;         mov bp, 54
;   reto:
;         cmp bp, 0
;         jne com1
;         mov dh, 18
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad5
;         mov ah, 9h
;         int 21h
;         mov ah, 1

;         mov dh, 17
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, clean
;         mov ah, 9h
;         int 21h
;   rt:
;         mov dh, 17
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, clean
;         mov ah, 9h
;         int 21h
;   com1:
;         mov dh, 17
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         ;pide numero a sacar raiz
;         lea dx, num
;         mov ah, 0Ah
;         int 21h

;         cmp ah, 1
;         jne n1
;         mov ch,17
;         mov cl,00
;         mov dh,24
;         mov dl,79
;         mov ah,6
;         mov al,0
;         mov bh,7
;         int 10h
;         jmp conti
;   n1:
;         mov ch,18
;         mov cl,00
;         mov dh,24
;         mov dl,79
;         mov ah,6
;         mov al,0
;         mov bh,7
;         int 10h
;   conti:
;         ;comprueba que no alla mas que numeros
;         mov bx, offset num+1
;         mov ch, 0
;         mov cl, [bx]
;   com:
;         inc bx
;         mov al, [bx]
;         cmp al,30h
;         je s
;         cmp al,31h
;         je s
;         cmp al,32h
;         je s
;         cmp al,33h
;         je s
;         cmp al,34h
;         je s
;         cmp al,35h
;         je s
;         cmp al,36h
;         je s
;         cmp al,37h
;         je s
;         cmp al,38h
;         je s
;         cmp al,39h
;         je s
;         ;imprime mensaje de error
;         mov dh, 18
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad4
;         mov ah, 9h
;         int 21h
;         mov ah, 1
;         jmp rt
;   s:
;         loop com
;         ;transforma el numero a hexadecimal y lo manda a AX
;         mov bx, offset num+1
;         push bx
;         mov ch, 0
;         mov cl, [bx]
;   c1:
;         inc bx
;         sub [bx], byte ptr 30h
;         loop c1

;         pop si
;         mov cl, [si]
;         mov ch, 0
;         dec cx

;         inc si
;         mov al, [si]
;         cmp al, 0
;         je fin
;         mov ah, 0
;         cmp cl, 00
;         je cont

;         mov di, 0ah
;         mov bp ,0
;         cmp ax, 0
;         je fin
;   c2:
;         mul di
;         jc reto ; regresa cuando la bandera de acarreo es 1
;         inc si
;         mov bl, [si]
;         mov bh, 0
;         add ax,  bx
;         jc reto ; regresa cuando la bandera de acarreo es 1
;         loop c2
;   cont:
;         ;prepara para sacar raiz cuadrada
;         mov bx, 00
;         mov bx, 1
;         mov cx, 00
;   raiz:
;         sub ax, bx
;         add bx, 2
;         inc cx
;         cmp ax, bx
;         jae raiz

;         mov ax, cx
;         mov bx, 0Ah
;         mov cx, 0

;   c3:
;         mov dx, 0
;         div bx
;         push dx
;         inc cx
;         cmp ax, 0
;         jne c3

;         ;;coloca el cursor en la linea 18
;         mov dh, 18
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad2
;         mov ah, 9h
;         int 21h
;   c4:
;         pop dx
;         add dl, 30h
;         mov ah, 2
;         int 21h
;         loop c4
;         jmp fin1

;   fin:
;         mov dh, 18
;         mov dl, 00
;         mov ah,2
;         mov bh,0
;         int 10h

;         lea dx, cad2
;         mov ah, 9h
;         int 21h

;         mov dl, 30h
;         mov ah, 2
;         int 21h
;   fin1:
;       ret
;   p0    endp


; codigo ends
;       end p0
