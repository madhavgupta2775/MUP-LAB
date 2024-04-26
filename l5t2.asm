.model tiny
.data
max1	db	64
len1	db	?
inp1	db	64 dup(0)
out1	db	64 dup(0)

.code
.startup
	lea dx, max1
	mov ah, 0ah
	int 21h
	lea si, inp1
	lea di, out1
	mov cl, len1
	mov ch, 0
	mov bl, 24h
	
	convert:
	lodsb
	sub al, 32
	stosb
	loop convert
	
	mov [di], bl
	lea dx, out1
	mov ah, 09h
	int 21h
.exit
end


;Write an ALP to convert an input string from the user (in all
;lowercase letters only) to uppercase letters and display it to
;the user.