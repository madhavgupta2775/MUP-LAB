.model tiny
.data

.code
.startup
	mov ah, 0
	mov al, 12h
	int 10h
	
	mov bx, 400
	mov dx, 10
	
	rows:
	push bx
	mov bx, 400
	mov cx, 10
		
		columns:
		mov ah, 0ch
		mov al, 01111111b
		int 10h
		inc cx
		dec bx
		jnz columns
		
	inc dx
	pop bx
	dec bx
	jnz rows
	
	mov ah, 07h
	x1:
	int 21h
	cmp al, '%'
	jnz x1
.exit
end
	