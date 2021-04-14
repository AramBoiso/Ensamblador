pila segment para stack 'stack'

	db 500 dup (?)

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
    fec    db 'Fecha: 24 de marzo de 2021$'
    prog   db 'Programa 03$'

    msg db 'Introduzca un car', 160 ,'cter: ', "$"
    ms db 'Introduzaca un car',160,'cter: ',"$"
    digito db "Es un digito.","$"
    mayuscula db 'Es una may',163,'scula.',"$"
    minuscula db 'Es una min',163,'scula.',"$"
    control db "Es de control.","$"
    extendido db "Es extendido.","$"
    especial db "Es especial.", "$"
    band db 1

datos ends


extra segment para public 'data'

extra ends

codigo segment para public 'code'
	public principal
	
principal proc far
	assume cs:codigo, ds:datos, ss:pila, es:extra
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

       ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,0E00h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

    ;Código para imprimir un caracter
    MOV AH, 9H
    LEA DX, msg
    INT 21H

    ;Lineas para mover el cursor
	mov ah,02H
	mov dx,0E18h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	mov bh,00h
	int 10H

    ;Capturar una cadena
    mov ah, 1h
    int 21h

    cmp al, 30h
    jge main

    cmp al, 1bh
    jle decontrol

    jmp especiales

    cmp band, 1
    je final

    ret
    main:

         cmp al, 0a4h
         je minusculas

         cmp al, 0a0h
         je minusculas

         cmp al, 0a1h
         je minusculas

         cmp al, 0a2h
         je minusculas

         cmp al, 0a3h
         je minusculas

         cmp al, 0a5h
         je mayusculas

         cmp al, 39h
         jle digitos

         cmp al, 41h
         jge auxiliar

        cmp band, 1
        je final
        
         ret

    auxiliar:
        cmp al, 5Ah
        jle mayusculas

        cmp al, 061h
        jge auxfg

        cmp band, 1
        je final

        ret

   auxfg:
        cmp al, 7ah
        jle minusculas

        cmp al, 7Fh
        jge extendidos

        cmp band, 1
        je final

        ret

    digitos:
        ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

        MOV AH, 9H
        LEA DX, digito
        INT 21H

        cmp band, 1
        je final

        ret

    mayusculas:
        ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

        MOV AH, 9H
        LEA DX, mayuscula
        INT 21H

        cmp band, 1
        je final

        ret

    minusculas:
        ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

        MOV AH, 9H
        LEA DX, minuscula
        INT 21H

        cmp band, 1
        je final

        ret

    decontrol:
        ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

        MOV AH, 9H
        LEA DX, control
        INT 21H

        cmp band, 1
        je final

        ret

    extendidos:
       ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H

        MOV AH, 9H
        LEA DX, extendido
        INT 21H

        cmp band, 1
        je final

        ret

    especiales:
        ;Lineas para mover el cursor
	    mov ah,02H
	    mov dx,1100h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
	    mov bh,00h
	    int 10H
        MOV AH, 9H
        LEA DX, especial
        INT 21H

        cmp band, 1
        je final

        ret

    final:
       
        mov ah,02H
        mov dx,1300h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
        mov bh,00h
        int 10H

        ;Código para imprimir un caracter
        MOV AH, 9H
        LEA DX, ms
        INT 21H

        ;Lineas para mover el cursor
        mov ah,02H
        mov dx,1319h ;Los primeros 2 digitos representan la fila hacia donde se posicionara el cursor, los ultimos 2 digitos representa la columna hacia donde se posiciopnara el cursor. 
        mov bh,00h
        int 10H

        mov ah, 1h
        int 21h

        cmp al, 0dh
        jne final

        MOV AH, 0FH
        INT 10H
        MOV AH, 0H
        INT 10H

        ret

principal endp

codigo ends
	end principal