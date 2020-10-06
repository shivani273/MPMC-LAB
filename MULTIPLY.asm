.model small

.data
num1 db 20
num2 db 20
res dw ?

.code
mov ax,@data
mov ds,ax
mov al,num1
mov bl,num2
mul bl
mov res,ax

mov ah,4ch
int 21h
end
