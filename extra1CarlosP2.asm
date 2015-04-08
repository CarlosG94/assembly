mov ah, 0   ; set display mode function.
MOV AL, 02h ;80x25
int 10h     ; set it!

mov cx, 64  ;col
mov dx, 64  ;row
mov ah, 0ah ; put square

colcount:
inc cx
int 10h
cmp cx, 30
JNE colcount

mov cx, 10  ; reset to start of col
inc dx      ;next row
cmp dx, 30
JNE colcount
