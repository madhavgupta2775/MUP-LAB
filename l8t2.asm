.model tiny
.data
n	db	1
n_1	db	0

.code
.startup
	mov ah, 00h
	mov al, 03h
	int 10h
	
	mov ah, 02h
	mov dx, 0
	mov bh, 0
	int 10h
	
	mov cl, 8
	
	x1:
	mov ah, 09h
	mov al, 'a'
	add al, n
	dec al
	mov bh, 0
	mov bl, 10001001b
	push cx
	mov cl, n
	int 10h
	mov ah, 02h
	inc dh
	int 10h
	mov al, n_1
	mov n_1, cl
	add cl, al
	mov n, cl
	pop cx
	loop x1
	
	mov ah, 07h
	x2:
	int 21h
	cmp al, '%'
	jnz x2
.exit
end
	