.model tiny
.data
array1	db	91h, 02h, 83h, 0Ah, 75h, 47h, 12h, 76h, 061h
.code
.startup
	lea si, array1
	mov cl, 10
	mov al, 0Ah
	mov bl, 69
	
	x1:
	mov ah, [si]
	cmp al, ah
	jne x2
	mov [si], bl
	
	x2:
	inc si
	dec cl
	jnz x1
	
.exit
end