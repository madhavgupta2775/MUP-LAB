.model tiny
.data
fname		db	'lab9.txt', 0
handle		dw	?
file_con	db	13 dup(0)
inp			db	?
color1		db	?
color2		db	?

.code
.startup
	; open file
	mov ah, 3dh
	lea dx, fname
	mov al, 0
	int 21h
	mov handle, ax
	
	; read file
	mov ah, 3fh
	mov bx, handle
	mov cx, 12
	lea dx, file_con
	int 21h
	
	; input
	mov ah, 08h
	int 21h
	
	mov dl, 1010b
	mov dh, 1101b
	
	; check input
	lea bx, file_con
	add bx, 11
	cmp al, [bx]
	je match
	mov bl, dl
	mov dl, dh
	mov dh, bl
	
	match:
	mov color1, dl
	mov color2, dh
	
	
	; make display
	mov ah, 00h
	mov al, 12h
	int 10h
	
	mov dx, 0
	
	; color 1
	loop1:
	mov ah, 0ch
	mov al, color1
	mov bx, 20
	
		tired1:
		mov cx, 0
		
			inlop1:
			int 10h
			inc cx
			cmp cx, 640
			jnz inlop1
			
		inc dx
		dec bx
		jnz tired1
	
	add dx, 20
	cmp dx, 480
	jnz loop1
	
	mov dx, 20
	
	; color 2
	loop2:
	mov ah, 0ch
	mov al, color2
	mov bx, 20
	
		tired2:
		mov cx, 0
		
			inlop2:
			int 10h
			inc cx
			cmp cx, 640
			jnz inlop2
			
		inc dx
		dec bx
		jnz tired2
	
	add dx, 20
	cmp dx, 500
	jnz loop2
	
	
	mov ah, 07h
	x1:
	int 21h
	cmp al, '%'
	jnz x1
.exit
end
	
;Write an ALP that takes in a single user input from the
;keyboard. The key pressed by the user must not be displayed.
;The program should compare the user input with the 12th byte
;in the le lab1.txt and if the user input is equal to the 12th byte
;(counting from one) in the le then the following pattern must
;be displayed on the screen