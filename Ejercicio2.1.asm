; programa que despliega un margen y una x en medio
org 100h ;inicializa el programa
jmp salto
    nombre db ' ',0

salto:
mov ah, 00h ;inicializa el modo video
mov al, 00h ;modo de texto 80x25
int 10h     ; sacar pantalla
mov dx, 0 ;numero de espacios que va a dar
mov bl, 11h     ;color de la letra
mov si, 0

;imprime primer renglon
    mov ah, 02h     ;posicion del cursor
    mov dh, 0       ; renglon
    mov dl, 0       ;columna
    mov bh, 0       ;numero de pagina
    int 10h
    mov ah, 09h     ; escribe el caracter y atributo en la posicion del cursor
    mov cx, 40   ; numero de veces que se va a escribir el caracter
    mov al, ' '
    int 10h

;imprime margen izquierdo
mov dh, 1       ; renglon
aqui:
    mov ah, 02h     ;posicion del cursor
    mov dl, 0       ;columna
    mov bh, 0       ;numero de pagina
    int 10h          ; imprimir pantalla
    mov ah, 09h     ; escribe el caracter y atributo en la posicion del cursor
    mov cx, 1   ; numero de veces que se va a escribir el caracter
    mov al, ' '    ;guarda caracter a imprimir
    int 10h
    inc dh
    cmp dh, 25
    jnz aqui

;imprime margen derecho
mov dh, 1       ; renglon
entiendo:
    mov ah, 02h     ;posicion del cursor
    mov dl, 39       ;columna
    mov bh, 0       ;numero de pagina
    int 10h          ; imprimir pantalla
    mov ah, 09h     ; escribe el caracter y atributo en la posicion del cursor
    mov cx, 1   ; numero de veces que se va a escribir el caracter
    mov al, ' '    ;guarda caracter a imprimir
    int 10h
    inc dh
    cmp dh, 25
    jnz entiendo

;imprime margen inferior
    mov ah, 02h     ;posicion del cursor
    mov dh, 24      ; renglon
    mov dl, 0       ;columna
    mov bh, 0       ;numero de pagina
    int 10h
    mov ah, 09h     ; escribe el caracter y atributo en la posicion del cursor
    mov cx, 40   ; numero de veces que se va a escribir el caracter
    mov al, ' '
    int 10h

;imprime x de en medio
    mov bl, 0xfh
    mov ah, 02h     ;posicion del cursor
    mov dh, 12      ; renglon
    mov dl, 20       ;columna
    mov bh, 0       ;numero de pagina
    int 10h
    mov ah, 09h     ; escribe el caracter y atributo en la posicion del cursor
    mov cx, 1   ; numero de veces que se va a escribir el caracter
    mov al, 'X'
    int 10h
    ret
