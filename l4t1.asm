.model tiny
.data
dat1		db	'wasitcatisaw'
dat1length	db 0ch
res dw 0000h

.code
.startup
	lea si, dat1
	lea dx, dat1
	mov ch, 0
	mov cl, dat1length
	add dx, cx
	dec dx
	mov di, dx
	mov bx, 01h
	mov [res], bx
	
	x1:
	mov al, [si]
	cmp al, [di]
	jne x2
	mov bx, 00h
	mov [res], bx
	
	x2:
	inc si
	dec di
	dec cl
	jnz x1
.exit
end
