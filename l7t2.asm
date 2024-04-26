.model tiny
.data
usn1	db	'conflicted'
len		db	0
inp1	db	32 dup('$')
pass1	db	'1nn0c3nt'
inp2	db	32 dup('$')
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
	mov bx, handle1
	lea dx, inp1
	read_username:
	mov cx, 1
	mov ah, 3fh
	int 21h
	mov si, dx
	lodsb
	; push dx
	; mov dl, al
	; mov ah, 02h
	; int 21h
	; pop dx
	inc dx
	mov cl, len
	inc cl
	mov len, cl
	cmp al, '$'
	jnz read_username
	mov al, len
	dec al
	mov len, al
	
	; close file
	mov ah, 3eh
	int 21h
	
	; check username
	lea si, usn1
	lea di, inp1
	mov cl, len
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
	mov bx, handle2
	lea dx, inp2
	mov al, 0
	mov len, al
	read_password:
	mov cx, 1
	mov ah, 3fh
	int 21h
	mov si, dx
	lodsb
	inc dx
	mov cl, len
	inc cl
	mov len, cl
	cmp al, '$'
	jnz read_password
	mov al, len
	dec al
	mov len, al
	
	; close file
	mov ah, 3eh
	int 21h
	
	; check password
	lea si, pass1
	lea di, inp2
	mov cl, len
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


; Now modify the ALP in Task 1, such that the username
;and password can be of variable length with max number of
;characters being 20h (i.e. 32 in decimal). The username and
;password have to be picked from user.txt   and pswd.txt le
;respectively
	