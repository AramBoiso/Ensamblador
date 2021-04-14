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
    fec    db 'Fecha: 03 de marzo de 2021$'
    prog   db 'Programa 01$'
    desc   db 'Este es un programa que muestra los datos personales, '
           db 'incluyendo una breve descripci',162,'n del lenguaje ensamblador.$' 
    text   db 'El lenguaje ensamblador o assembly'
           db 'es un lenguaje de programaci',162,'n de bajo nivel.'
           db 'Consiste en un conjunto de mnem',162,'nicos que representan.'
           db 'instrucciones b',160,'sicas para los computadores, microprocesadores, microcontroladores y otros circuitos.$'
    ex     db 'Presione una tecla para terminar$'


datos ends

extra segment para public 'data'

extra ends

codigo segment para public 'code'

    assume cs:codigo, ds:datos, ss:pila, es:extra
    public principal

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
	   mov dx,0D50h
	   int 10H

       lea DX,desc
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx,1100h
	   int 10H

       lea DX,text
	   mov AH,09
	   int 21H


       mov ah,02H
	   mov bh,00
	   mov dx,14B4h
	   int 10H

       lea DX,ex
	   mov AH,09
	   int 21H

       MOV DL, 0AH
       MOV AH, 02
       INT 21H
	
	   mov AH,01H 
	   int 21H
	
	   mov ax,0600h 
       mov bh,07h    
       mov cx,0000h  
       mov dx,184Fh 
       int 10h 
	

       ret
    principal endp

codigo ends

end principal