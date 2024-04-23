.model tiny
.data
array1	dw	9100h, 0200h, 8300h, 0A00h, 7500h, 0A00h, 4700h, 1200h, 7600h, 6100h
count	db	10
NEG1	db	?
.code
.startup
	lea si, array1
	mov cl, count
	mov al, 0
	mov bx, 0
	
	x1:
	cmp bx, [si]
	jle x2
	inc al
	
	x2:
	inc si
	dec cl
	jnz x1
	mov NEG1, al
	
.exit
end