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
    fec    db 'Fecha: 08 de marzo de 2021$'
    prog   db 'Programa 02$'
    msg    db 'Introduzca el nombre del lugar donde vive: $' 
    sig  db 'Precione una tecla para continuar$'
    ul db 'Usted vive en: $'
    domicilio db 20, ?, 20 dup ("$")

   


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
	   mov dx, 0F00h
	   int 10H

       lea DX,msg
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx, 0F2Bh
	   int 10H

       lea dx,domicilio
       mov ah, 0ah
       int 21h

       mov ah,02H
	   mov bh,00
	   mov dx, 1800h
	   int 10H
      
       lea DX, sig
	   mov AH,09
	   int 21H

       mov AH,01H 
	   int 21H

       mov ax,0600h 
       mov bh,07h    
       mov cx,0000h  
       mov dx,184Fh 
       int 10h

       mov ah,02H
	   mov bh,00
	   mov dx, 0000h
	   int 10H
      
       lea DX, ul
	   mov AH,09
	   int 21H

       mov ah,02H
	   mov bh,00
	   mov dx, 000Fh
	   int 10H

      lea dx, domicilio+2
	  mov ah,09
	  int 21H

       ret
    principal endp

codigo ends

end principal