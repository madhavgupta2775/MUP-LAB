.model tiny
.data
char	db	?
str1	db	'The character entered is $'
a		db	'a$'
nota	db	'not a$'

.code
.startup
	mov bl, 61h
	mov ah, 01h
	int 21h
	lea dx, str1
	mov ah, 09h
	int 21h
	cmp bl, al
	jne x2
	lea dx, a
	int 21h
	jmp x3
	
	x2:
	lea dx, nota
	int 21h
	
	x3:
	
.exit
end