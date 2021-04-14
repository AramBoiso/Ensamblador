pila segment para stack 'stack'

	db 500 dup (?)

pila ends

datos segment para public 'data'
	
	;R0 db "XXX"
	CE db 15,?,15 dup ("$")
	;R1 db "XXX"

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
	
	lea dx,CE
	mov ah, 0ah ;Funcion 0a para introducir una cadena desde el teclado
	int 21h
	
	; Poner salto de linea
    MOV DL, 0AH
    MOV AH, 02
    INT 21H
	
	lea dx,CE+2
	mov ah,09
	int 21H
	
	ret
principal endp




codigo ends
	end principal