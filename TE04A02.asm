pila segment  para stack  'stack'
    db 100 dup(?)
pila ends

extra segment para public 'data'
  ;acentos
  oce equ 0a2h
  ece equ 082h
  ace equ 0A0h
  ice equ 0A1h
  uce equ 0A3h
  inte equ 0A8h

extra ends

datos segment para public 'data'
  num word 6,?,6 dup(?)
  cad1 db 'Inserte n',uce,'mero para calcular la ra',ice,'z  cuadrada$'
  cad2 db 'El resultado es:$'
  cad3 db 'El programa calcula la ra',ice,'z cuadrada de un numero aproximadamente$'
  cad4 db 'El programa solo maneja n',uce,'meros$'
  cad5 db 'N',uce,'mero invalido el n',uce,'mero mayor es 65535$'
  nom_tec db 'Instituto Tecnol',oce,'gico Nacional De M',ece,'xico$'
  nom_tecG db 'Instituto Tecnol',oce,'gico de Ciudad Guzm',ace,'n$'
  carrera db 'Ingenier',ice,'a en Sistemas Computacionales$'
  departamento db 'Departamento de Sistemas e Inform',ace,'tica$'
  materia db 'Materia: Lenguajes de Interfaz$'
  unidad db 'Unidad: 2$'
  grupo db 'Grupo: A$'
  titulo db 'Programa: 04$'
  profesor db 'Estanislao Catillo Horta$'
  alumno db 'Autor: Juan Fernando Brambila Rivera$'
  nc db 'Numero de Control: 18290858$'
  fecha db 'Fecha: 23/Abril/2021$'
  clean db '                                $'


datos ends
codigo segment para public 'code'
        assume cs:codigo , ds:datos , es:extra , ss:pila
        public p0
        
  p0    proc far
        push ds
        mov ax,0
        push ax
        mov ax, datos
        mov ds, ax
        mov ax, extra
        mov es, ax

        ;limpia pantalla
        mov ch,00
        mov cl,00
        mov dh,24
        mov dl,79
        mov ah,6
        mov al,0
        mov bh,7
        int 10h
      
        mov dh, 15
        mov dl, 0
        mov ah,2
        mov bh,0
        int 10h

        lea dx, cad1
        mov ah, 9h
        int 21h
        mov bp, 54
  reto:
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

        ;pide numero a sacar raiz
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
        ;comprueba que no alla mas que numeros
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
        ;imprime mensaje de error
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
        ;transforma el numero a hexadecimal y lo manda a AX
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
        jc reto ; regresa cuando la bandera de acarreo es 1
        inc si
        mov bl, [si]
        mov bh, 0
        add ax,  bx
        jc reto ; regresa cuando la bandera de acarreo es 1
        loop c2
  cont:
        ;prepara para sacar raiz cuadrada
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
  p0    endp


codigo ends
      end p0
