.model tiny
.data
max1	db	32
len1	db	?
inp1	db	32 dup('$')
max2 	db	32
len2	db	?
inp2	db	32 dup('$')
fname1	db	'name.txt', 0
fname2	db	'id.txt', 0
handle1	dw	?
handle2	dw	?

.code
.startup
	; read name
	lea dx, max1
	mov ah, 0ah
	int 21h
	
	; read id
	lea dx, max2
	mov ah, 0ah
	int 21h
	
	; create first file
	lea dx, fname1
	mov ah, 3ch
	mov cl, 1
	int 21h
	
	; open first file
	lea dx, fname1
	mov ah, 3dh
	mov al, 1
	int 21h
	mov handle1, ax
	
	; write name into file
	mov bx, handle1
	lea dx, inp1
	mov cl, len1
	mov ch, 0
	mov ah, 40h
	int 21h
	
	mov ah, 3eh
	int 21h
	
	; create second file
	lea dx, fname2
	mov ah, 3ch
	mov cl, 1
	int 21h
	
	; open second file
	lea dx, fname2
	mov ah, 3dh
	mov al, 1
	int 21h
	mov handle2, ax
	
	; write id into file
	mov bx, handle2
	lea dx, inp2
	mov cl, len2
	mov ch, 0
	mov ah, 40h
	int 21h
	
	mov ah, 3eh
	int 21h
.exit
end