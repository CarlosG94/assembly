;Tarea de Semaforo

;macros function
PRINT MACRO X1, X2

MOV AL, ' '
MOV BL, X1  ;parametro para color
MOV BH, 00
MOV CX, 5   ;repeticion de pantalla
MOV DX, x2  ;parametro para columna y renglon
MOV AH, 02h ;posicion de cursor
INT 10h
MOV AH, 09h
INT 10h     ;impresion de pantalla
PRINT endm

;Inicio de programa

ORG 100h
MOV AH, 00
MOV AL, 03
INT 10h

;PRIMER CICLO
PRINT 44h, 0505h    ;Rojo
PRINT 22h, 0a19h    ;Verde
;tiempo para primer ciclo, arriba rojo, abajo verde
MOV DX, 0E1C0h   ;TIEMPO CONVERTIDO EN HEX
MOV CX, 0E4h     ;TIEMPO EN HEX
MOV AH, 86h
INT 15h
CALL cleanVideo

;SEGUNDO CICLO
PRINT 44h, 0505h    ;rojo
PRINT 0e0h, 0a0fh   ;amarillo
;tiempo para segundo ciclo, arriba rojo, abajo amarillo
MOV DX, 4B40h  ;Tiempo en hex
MOV CX, 4Ch    ;Tiempo en hex
MOV AH, 86h
INT 15h
CALL cleanVideo

;TERCER CICLO
PRINT 44h, 0a05h   ;rojo
PRINT 22h, 0516h   ;verde
;tiempo para tercer ciclo, arriba verde, abajo rojo
MOV DX, 0E1C0h  ;Tiempo en hex
MOV CX, 0E4h    ;Tiempo en hex
MOV AH, 86h
INT 15h
CALL cleanVideo

;CUARTO CICLO
PRINT 0e0h, 050fh    ;Amarillo
PRINT 44h, 0a05h    ;Rojo
;tiempo para primer ciclo, arriba amarillo, abajo rojo
MOV DX, 04B40h   ;TIEMPO CONVERTIDO EN HEX
MOV CX, 04Ch     ;TIEMPO EN HEX
MOV AH, 86h
INT 15h
CALL cleanVideo

;Quinto CICLO
PRINT 44h, 0505h    ;Rojo
PRINT 22h, 0a19h    ;Verde
;tiempo para primer ciclo, arriba rojo, abajo verde
MOV DX, 0E1C0h   ;TIEMPO CONVERTIDO EN HEX
MOV CX, 0E4h     ;TIEMPO EN HEX
MOV AH, 86h
INT 15h
CALL cleanVideo


;PROCEDIMIENTOS

cleanVideo proc
    MOV CX, 25
    MOV BL, 00
    MOV AL, ' '
    MOV AH, 02
    MOV BH, 00
    MOV DX, 0505h
    INT 10h
    MOV AH, 09
    INT 10h
    MOV AH, 02
    MOV DX, 0a05h
    INT 10h
    MOV AH, 09
    INT 10h
    RET
cleanVideo endp
