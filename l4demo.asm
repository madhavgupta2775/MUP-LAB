.model tiny
.data
myString		db	12h, 34h, 56h, 42h, 78h, 9ah
myStringLength	db	06h
res				dw 	0000h

.code
.startup
	mov di, offset myString
	mov cl, myStringLength
	mov al, 42h
	cld
	
	x1:
	scasb
	jne x2
	mov res, di
	dec res
	jmp x3
	
	x2:
	dec cl
	jnz x1
	
	x3:
	
.exit
end