.model small
display macro msg
     lea dx,msg
     mov ah,09h
     int 21h
endm

.data
n db 6
x db 06,08,05,04,03,09
msg1 db 0dh,0ah,"1 - Sort in ascending order$"
msg2 db 0dh,0ah,"2 - Sort in descending order$"
msg3 db 0dh,0ah,"3 - Exit$"
msg4 db 0dh,0ah,"Enter choice -$"
msg5 db 0dh,0ah,"Invalid choice.$"

.code
mov ax,@data
mov ds,ax
lea si,x
mov cl,n
dec cl
display msg1
display msg2
display msg3
display msg4
mov ah,01h
int 21h
sub al,30h
cmp al,01h
je ascend
cmp al,02h
je descend
cmp al,03h
je final
display msg5
jmp final

ascend:mov ch,cl
mov si,00h
inloop_asc:mov al,x[si]
inc si
cmp al,x[si]
jc no_asc
xchg al,x[si]
mov x[si-1],al
no_asc:dec ch
jnz inloop_asc
dec cl
jnz ascend
jmp final

descend:mov ch,cl
mov si,00h
inloop_desc:mov al,x[si]
inc si
cmp al,x[si]
jnc no_desc
xchg al,x[si]
mov x[si-1],al
no_desc:dec ch
jnz inloop_desc
dec cl
jnz descend
jmp final

final:mov ah,4ch
int 21h
end