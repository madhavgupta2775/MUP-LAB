.model tiny
.data
usn1	db	'chutiyados'
max1	db	20
inp1	db	20 dup('$')
pass1	db	'3x1st'
inp2	db	30 dup('$')
msg3	db	'hallo :D $'
msg4	db	'why is this a thing wtf$'
msg5	db	'wh4t d0 y0u d0?'
nline	db	0ah, 0dh, '$'
usernf	db	'username.txt', 0
passf	db	'password.txt', 0
handle1	dw	?
handle2	dw	?

.code 
.startup
	; open username file
	mov ah, 3dh
	mov al, 0
	lea dx, usernf
	int 21h
	mov handle1, ax
	
	; read username
	mov cx, 10
	mov bx, handle1
	mov ah, 3fh
	lea dx, inp1
	int 21h
	
	; close file
	mov ah, 3eh
	int 21h
	
	; check username
	lea si, usn1
	lea di, inp1
	mov cl, 10
	mov ch, 0
	repe cmpsb
	
	jnz invalid_username
	
	; open password file
	mov ah, 3dh
	mov al, 0
	lea dx, passf
	int 21h
	mov handle2, ax
	
	; read password
	mov cx, 5
	mov bx, handle2
	mov ah, 3fh
	lea dx, inp2
	int 21h
	
	; close file
	mov ah, 3eh
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
	
	
	
;Take the above problem and modify the ALP such that
;instead of taking username and password in the .data section,
;we take it from the user.txt and pswd.txt le.
;The user.txt le contains 10 character long username with 11th
;character being ‘$’ and pswd.txt le contains 5 character long
;password with 6th character being ‘$’.