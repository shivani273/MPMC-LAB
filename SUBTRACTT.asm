.model small

.data
n1 db 49
n2 db 18
res db ?

.code
mov ax, @data
mov ds, ax
mov al, n1
sub al, n2
mov res, al

mov ah, 4ch
int 21h
end