;proyecto para hoy (5 pts)
org 100h
jmp INICIO

;vectores de datos
CRONO DB '1) Cronometro', 10, 13,
TEMPO DB '2) Temporizador', 10, 13,
SALIR DB '3) Salir', 10, 13, 0

;imprimir men�
INICIO: mov AH, 00H  ;inicializa el modo video (funcion 1)
        mov AL, 03H  ;modo texto (funcion 1)
        int 10H      ;funcion 1
        mov AH, 0EH  ;escribe cada ASCII (funcion 5)
        mov BX, 0    ;primer espacio en el arreglo de chars

MENU:   mov AL, CRONO[BX];mueve a AL lo que haya en NOMBRE[BX] (parametro de la funcion 5)
        int 10H           ;ejecuta el video (funcion 5)
        inc BX            ;moverse un espacio a la derecha en el arreglo de chars
        cmp CRONO[BX], 0 ;comparaci�n, lo hacemos antes y es mas eficiente
        JNZ MENU
        JMP CICLO

CICLO:  CALL TECLA
        SUB AL, 30H   ;CONVERTIR DE ASCII A DECIMAL (RESTAR 30H)
        mov SI, 1300H ;guardar AL en 1300H
        MOV [SI], AL  ;GUARDAR EL DECIMAL EN MEMORIA
        INC SI        ;SIGUIENTE DIRECCI�N EN MEMORIA
        ;LOOP CICLO    ;HACER CICLO 1 VEZ (CX VALE 1)
        MOV SI, 1300H ;REGRESAR APUNTADOR (DESPU�S DE QUE YA SE GUARDARON TODOS)
        CALL COMPARA
        RET

;LEE TECLAS DESDE EL TECLADO
TECLA PROC       ;DECLARAR UN PROCESO
    MOV AH, 01   ;FUNCION 17 (BUSCAR EN BUFER DE TECLADO)
AC: INT 16H      ;FUNCION 17 (BUSCAR EN BUFER DE TECLADO)
    JZ AC        ;SI SE OPRIME ALGO, SE GUARDA EN AL
    MOV AH, 00   ;FUNCION 7
    INT 16H      ;FUNCION 7
    MOV AH, 0EH  ;SE IMPRIME LO QUE SE TOMA DESDE TECLADO (FUNCION 5)
    INT 10H      ;FUNCION 5
    RET
TECLA ENDP      ;FIN DE UN PROCESO


COMPARA PROC        ;CHECAR LA TECLA QUE SE INGRES� AL MENU
AQUI:MOV AL, [SI]
    CMP AL, 1
    JNZ U
    JMP CRONOMETRO

U:  CMP AL, 2
    JNZ D
    JMP CRONOMETRO

D:  CMP AL, 3
    RET
COMPARA ENDP        ;CHECAR LA TECLA QUE SE INGRES� AL MENU

CRONOMETRO:

;meter interrupcion

MOV DH, 06H     ;FUNCION 11
MOV DL, 06H     ;FUNCION 11
MOV AH, 02H     ;FUNCION 11
INT 10H         ;FUNCION 11
MOV AL, 048     ;FUNCION 5
MOV AH, 0EH     ;FUNCION 5
INT 10H         ;FUNCION 5

REPETIR:        ;ESPERAR
MOV CX, 0Fh     ;FUNCION 16
MOV DX, 4240h   ;FUNCION 16
MOV AH, 86h     ;FUNCION 16
INT 15H         ;FUNCION 16

INC AL          ;INCREMENTAR UNO POR UNO

MOV DH, 06H     ;FUNCION 11
MOV DL, 06H     ;FUNCION 11
MOV AH, 02H     ;FUNCION 11
INT 10H         ;FUNCION 11
MOV AH, 0AH     ;FUNCION 13
MOV CX, 01H     ;FUNCION 13
INT 10H         ;FUNCION 13

CMP AL, 39h     ;COMPARAR LA SALIDA CON 9 (LLEGA HASTA 9 EL CRONO)
JNZ REPETIR     ;REPETIR HASTA QUE ACABE

;IGNORA TODO DEBAJO DE ESTA L�NEA
TEMPORIZADOR:

PEDIR DB 'INGRESA EL NUMERO DE SEGUNDOS QUE ESPERARA EL CONTADOR', 10, 13, 0

IMPRE:  mov AL, CRONO[BX];mueve a AL lo que haya en NOMBRE[BX] (parametro de la funcion 5)
        int 10H           ;ejecuta el video (funcion 5)
        inc BX            ;moverse un espacio a la derecha en el arreglo de chars
        cmp CRONO[BX], 0 ;comparaci�n, lo hacemos antes y es mas eficiente
        JNZ MENU
        JMP CICLO
;print ingresar tecla
;leer la tecla
;moverla a Al

MOV DH, 06H     ;FUNCION 11
MOV DL, 06H     ;FUNCION 11
MOV AH, 02H     ;FUNCION 11
INT 10H         ;FUNCION 11
MOV AL, 048     ;FUNCION 5
MOV AH, 0EH     ;FUNCION 5
INT 10H         ;FUNCION 5

REPETIR2:        ;ESPERAR
MOV CX, 0Fh     ;FUNCION 16
MOV DX, 4240h   ;FUNCION 16
MOV AH, 86h     ;FUNCION 16
INT 15H         ;FUNCION 16

INC AL          ;INCREMENTAR UNO POR UNO

MOV DH, 06H     ;FUNCION 11
MOV DL, 06H     ;FUNCION 11
MOV AH, 02H     ;FUNCION 11
INT 10H         ;FUNCION 11
MOV AH, 0AH     ;FUNCION 13
MOV CX, 01H     ;FUNCION 13
INT 10H         ;FUNCION 13

CMP AL, 39h     ;COMPARAR LA SALIDA CON 9 (LLEGA HASTA 9 EL CRONO)
JNZ REPETIR     ;REPETIR HASTA QUE ACABE
