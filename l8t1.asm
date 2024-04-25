.model tiny
.data
inp1	db	'MADHAV GUPTA'
len 	db	12

.code
.startup
	mov ah, 00h
	mov al, 03h
	int 10h
	
	mov ah, 02h
	mov dl, 1
	mov dh, 1
	mov bh, 0
	int 10h
	
	lea bx, inp1
	mov ah, 0
	mov al, len
	add bx, ax
	dec bx
	mov si, bx
	mov cl, len
	
	x1:
	mov ah, 09h
	mov al, [si]
	dec si
	mov bh, 0
	mov bl, 10001001b
	push cx
	mov cx, 1
	int 10h
	mov ah, 02h
	inc dl
	inc dh
	int 10h
	pop cx
	loop x1
	
	mov ah, 07h
	x2:
	int 21h
	cmp al, '%'
	jnz x2
.exit
end