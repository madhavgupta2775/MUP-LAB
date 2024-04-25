.model tiny
.data
msg1	db	'enter 10 character long username: $'
usn1	db	'chutiyados'
max1	db	20
len1	db	?
inp1	db	20 dup('$')
msg2	db	'enter 5 character long password: $'
pass1	db	'3x1st'
inp2	db	30 dup('$')
msg3	db	'hallo :D $'
msg4	db	'why is this a thing wtf$'
msg5	db	'wh4t d0 y0u d0?'
nline	db	0ah, 0dh, '$'

.code 
.startup
	; print msg1
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	; print nline
	lea dx, nline
	mov ah, 09h
	int 21h
	
	; input username
	lea dx, max1
	mov ah, 0ah
	int 21h
	
	lea dx, nline
	mov ah, 09h
	int 21h
	
	; check username
	lea si, usn1
	lea di, inp1
	mov cl, len1
	mov ch, 0
	repe cmpsb
	
	jnz invalid_username
	
	; print msg2
	lea dx, msg2
	mov ah, 09h
	int 21h
	
	; print nline
	lea dx, nline
	mov ah, 09h
	int 21h
	
	; input password
	mov cx, 5
	lea di, inp2
	p_inp:
	mov ah, 08h
	int 21h
	stosb
	mov dl, '*'
	mov ah, 02h
	int 21h
	loop p_inp
	
	mov ah, 09h
	lea dx, nline
	int 21h
	
	; check password
	lea si, pass1
	lea di, inp2
	mov cl, 5
	mov ch, 0
	repe cmpsb
	
	jnz invalid_password
	
	; print welcome
	lea dx, msg3
	mov ah, 09h
	int 21h
	
	; print username
	lea dx, inp1
	mov ah, 09h
	int 21h
	
	jmp end_program
	
	invalid_username:
	lea dx, msg4
	mov ah, 09h
	int 21h
	jmp end_program
	
	invalid_password:
	lea dx, msg5
	mov ah, 09h
	int 21h
	jmp end_program
	
	end_program:
	lea dx, nline
	mov ah, 09h
	int 21h
.exit
end
	