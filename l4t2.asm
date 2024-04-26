.model tiny
.data
string1			db	'BITSIOTLAB'
string2			db	'IOT'
string1length	db	0ah
string2length	db 	3

.code
.startup
	lea si, string1
	mov di, offset string2
	mov bh, string1length
	mov bl, 2ah
	cld
	
	start:
	mov ax, di
	mov dx, si
	mov cl, string2length
	mov ch, 0
	
	check:
	cmpsb
	jne failed
	loop check
	
	success:
	mov cl, bh
	mov ch, string2length
	sub cl, ch
	mov ch, 0
	mov di, dx
	mov [di], bl
	inc di
	push ax
	
	move:
	lodsb
	stosb
	loop move
	pop ax
	mov bh, cl
	
	failed:
	mov di, ax
	mov si, dx
	inc si
	dec bh
	jnz start
.exit
end


;Write an 8086 program to replace a substring S1 of a string S
;with “*”