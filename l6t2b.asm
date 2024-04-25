.model tiny
.data
fname1	db	'name.txt', 0
fname2	db	'id.txt', 0
fname3	db	'splice.txt', 0
handle1	dw	?
handle2	dw	?
handle3	dw	?
out1	db	32 dup('$')

.code
.startup
	lea si, out1
	
	; open file 2
	lea dx, fname2
	mov ah, 3dh
	mov al, 0
	int 21h
	mov handle2, ax
	
	; read file 2
	mov bx, handle2
	mov dx, si
	mov ah, 3fh
	mov cx, 32
	int 21h
	mov bx, si
	add bx, ax
	mov si, bx
	
	; open file 1
	lea dx, fname1
	mov ah, 3dh
	mov al, 0
	int 21h
	mov handle1, ax
	
	; read file 1
	mov bx, handle1
	mov dx, si
	mov ah, 3fh
	mov cx, 32
	int 21h
	mov bx, si
	add bx, ax
	mov si, bx
	
	; create file 3
	lea dx, fname3
	mov ah, 3ch
	mov cl, 2
	int 21h
	
	; open file 3
	lea dx, fname3
	mov ah, 3dh
	mov al, 1
	int 21h
	mov handle3, ax
	
	; write to file 3
	mov bx, handle3
	lea dx, out1
	mov cx, si
	sub cx, dx
	mov ah, 40h
	int 21h
	
	; close file 3
	mov bx, handle3
	mov ah, 3eh
	int 21h
.exit
end