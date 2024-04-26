.model tiny
.data
str1	db	'Enter your name: $'
max1	db	50
len1	db	?
inp1	db	50 dup('$')
fname	db	'testing.txt', 0
handle	dw	?

.code
.startup
	printstr:
	lea dx, str1
	mov ah, 09h
	int 21h
	
	readstr:
	lea dx, max1
	mov ah, 0ah
	int 21h
	
	createfile:
	lea dx, fname
	mov ah, 3ch
	mov al, 1
	int 21h
	mov handle, ax
	
	writestr:
	lea dx, inp1
	mov cl, len1
	mov ch, 0
	inc cx
	mov bx, handle
	mov ah, 40h
	int 21h
	
	closefile:
	mov ah, 3eh
	int 21h
.exit
end


;Read data from console and write to file
;. Print line on screen asking “Enter your name:”
;. Give your name as input, and save it in a local variable
;. Create a new text file
;. Write your name to this file