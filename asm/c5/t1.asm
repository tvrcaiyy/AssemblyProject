assume cs:code

code segment

mov ax,2000H
mov ds,ax

mov al,[0]
mov ah,[1]
mov bl,[2]
mov bh,[3]

mov ax,4c00h
int 21h

code ends

end