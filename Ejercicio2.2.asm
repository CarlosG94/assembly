;este programa pretende dibujar el tablero de un gato
org 10h

;inicializa la pantalla de video
mov al, 0h      ;modo de texto 40x25
mov ah, 0h      ;inicializa el modo de video
int 10h
mov bl, 11h      ;atributo

;dibuja la primer linea vertical
mov dl, 4       ;columna
mov dh, 0       ;renglon
ey:
mov ah, 02h     ;posicion del cursor
mov bh, 0       ;numero de pagina
int 10h
mov ah, 09h     ;escribe el caracter y atributo en la posicion de cursor
mov cx, 1
mov al, ' '
int 10h
inc dh
cmp dh, 14
jnz ey

;dibuja la segunda linea vertical
mov dl, 9       ;columna
mov dh, 0       ;renglon
aja:
mov ah, 02h     ;posicion del cursor
mov bh, 0       ;numero de pagina
int 10h
mov ah, 09h     ;escribe el caracter y atributo en la posicion de cursor
mov cx, 1
mov al, ' '
int 10h
inc dh
cmp dh, 14
jnz aja

;dibuja la primera linea horizonal
mov dl, 0       ;columna
mov dh, 4       ;renglon
ajua:
mov ah, 02h     ;posicion del cursor
mov bh, 0       ;numero de pagina
int 10h
mov ah, 09h     ;escribe el caracter y atributo en la posicion de cursor
mov cx, 1
mov al, ' '
int 10h
inc dl
cmp dl, 14
jnz ajua

;dibuja la segunda linea horizonal
mov dl, 0       ;columna
mov dh, 9       ;renglon
naruto:
mov ah, 02h     ;posicion del cursor
mov bh, 0       ;numero de pagina
int 10h
mov ah, 09h     ;escribe el caracter y atributo en la posicion de cursor
mov cx, 1
mov al, ' '
int 10h
inc dl
cmp dl, 14
jnz naruto
ret
