org 100h
mov bp, 100h	;pone direccion inicial en 100
		mov cx, 40h		;cx es el contador (40 para repetir 40 veces)
		mov si, 200h		;Source Index empieza en 200 para guarder los datos desde la direccion 200 hasta la 300
		mov di, 300h ;Destination Index
next:	mov dx, 01h	;Pone dx en 01
		and dx, bp		;Hace un and con 01 y 100 en binario
		cmp dx, 0h	;If res=0 te manda a la funcion evenmem, if res �= 0 te manda a la funci�n oddmem
		jz evenmem		;if dx = 0 jump to even memory label
oddmem:	add di, [bp]	;Suma lo que te da a la memoria
		inc bp			;increment bp
		dec cx			;decrement cx(count)
		jnz next		;if cx != 0 loop back
evenmem:add si, [bp]	;same as odd memory location
		inc bp
		dec cx	;for i=40:0 i--
		jnz next ;jump if not zero if zf=0 te manda a la function next, else sigue
		mov ax, si		;guarda resultado de pares en ax
		mov bx, di	;guarda resultado de nones en bx
end
