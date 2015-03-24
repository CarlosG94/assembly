;programa que simula un par de semaforos

Macro1 macro p1, p2   ;p1 es renglon
    mov bl, 50   ;atributo
    mov dh, p1  ;renglon
    mov si, 0   ;contador
    mov dl, p2  ;columna
    local ab
  ab:
    mov ah, 2       ; posicion del cursor
    mov bh, 0   ;numero de pagina
    int 10h
    mov ah, 9   ;escribe el caracter
    mov al, ' '
    mov cx, 1   ;numero de veces que se va a escribir el caracter
    int 10h
    inc p1
    inc si
    cmp si, 14
    jnz ab
endm

Macro2 macro p1, p2
    mov bl, 50   ;atributo                        ;0x20h
    mov dh, p1 ;renglon
    mov si, 0 ;contador
    mov dl, p2 ;columna
    local ab
    local bc
    local cd
    local de
  ab:
    mov ah, 2
    mov bh, 0
    int 10h
    mov ah, 9
    mov al, ' '
    mov cx, 1
    int 10h
    inc p1
    inc si
    cmp si, 1
    jna ab
    inc p1
    inc p1
  bc:
    mov ah, 2
    mov bh, 0
    int 10h
    mov ah, 9
    mov al, ' '
    mov cx, 1
    int 10h
    inc p1
    inc si
    cmp si, 3
    jna bc
    inc p1
    inc p1
  cd:
    mov ah, 2
    mov bh, 0
    int 10h
    mov ah, 9
    mov al, ' '
    mov cx, 1
    int 10h
    inc p1
    inc si
    cmp si, 5
    jna cd
    inc p1
    inc p1
   de:
    mov ah, 2
    mov bh, 0
    int 10h
    mov ah, 9
    mov al, ' '
    mov cx, 1
    int 10h
    inc p1
    inc si
    cmp si, 7
    jna de
endm

Macro3 macro        ;imprime los rojos

    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 4   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 70
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 5   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 70
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 4   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 70
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 5   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 70
    mov cx, 2
    int 10h

endm

Macro4 macro        ;apaga los rojos

    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 4   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 5   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 4   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor               ;imprimir los rojos
    mov dh, 5   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h

endm


Macro5 macro    ;imprimir amarillos
    mov ah, 02h ;posicion del cursor
    mov dh, 8   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 225
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 9   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 225
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor
    mov dh, 8   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 225
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 9   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 225
    mov cx, 2
    int 10h
endm

;apaga amarillos
Macro6 macro
    mov ah, 02h ;posicion del cursor
    mov dh, 8   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 9   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor
    mov dh, 8   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 9   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
endm

    ;imprimir verdes
Macro7 macro
    mov ah, 02h ;posicion del cursor
    mov dh, 12   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0x20h
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 13   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0x20h
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor
    mov dh, 12   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0x20h
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 13   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0x20h
    mov cx, 2
    int 10h
endm

;apaga los verdes
Macro8 macro
    mov ah, 02h ;posicion del cursor
    mov dh, 12   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 13   ;renglon
    mov dl, 4   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h

    mov ah, 02h ;posicion del cursor
    mov dh, 12   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
    mov ah, 02h ;posicion del cursor
    mov dh, 13   ;renglon
    mov dl, 14   ;columna
    mov bh, 0
    int 10h
    mov ah, 09h
    mov al, ' '
    mov bl, 0
    mov cx, 2
    int 10h
endm

Macro9 macro          ;tiempo
    mov ah, 0x2ch
    local ciclo
    int 0x21h
    mov al, dh
    add al, 20
    cmp al, 60
    jna  ciclo
    sbb al, 60
  ciclo:
    int 0x21h
    cmp al, dh
    jnz ciclo
endm

org 100h
mov ah, 0   ;inicializa el modo de video
mov al, 0   ;modo de texto 80x25
int 10h
mov dh, 2
Macro1 dh,2
mov dh, 2
Macro1 dh, 3
mov dh, 2
Macro1 dh, 6
mov dh, 2
Macro1 dh, 7
mov dh, 2
Macro1 dh, 12
mov dh, 2
Macro1 dh, 13
mov dh, 2
Macro1 dh, 16
mov dh, 2
Macro1 dh, 17
mov dh, 2
Macro2 dh, 4
mov dh, 2
Macro2 dh, 5
mov dh, 2
Macro2 dh, 14
mov dh, 2
Macro2 dh, 15
mov bp,0
inicio:
    Macro3
    Macro9
    Macro4
    Macro5
    Macro9
    Macro6
    Macro7
    Macro9
    Macro8
    inc bp
    cmp bp, 10
    jnz inicio

ret
