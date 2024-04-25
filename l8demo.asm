.model tiny
.data
inp1	db	'PLIJ WOKR'
len		db	9

.code
.startup
	;mov ah, 00h
	;mov al, 12h
	;int 10h
	;mov ah, 07h
	;
	;x1:
	;int 21h
	;cmp al, '%'
	;jnz x1
	
	;mov ah, 02h
	;mov dl, 40
	;mov dh, 12
	;mov bh, 0
	;int 10h
	
	mov ah, 00h
	mov al, 03h
	int 10h
	
	mov ah, 02h
	mov dl, 20
	mov dh, 20
	mov bh, 0
	int 10h
	
	lea si, inp1
	mov cl, len
	x1:
	mov ah, 09h
	mov al, [si]
	inc si
	mov bh, 0
	mov bl, 10001001b
	push cx
	mov cx, 1
	int 10h
	mov ah, 02h
	inc dl
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