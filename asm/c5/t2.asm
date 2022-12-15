assume cs:code

code segment

mov ax,2000H
mov ds,ax

mov bx,0
mov byte ptr [bx],11h
mov al,[bx]

mov bx,1
mov byte ptr [bx],22h
mov ah,[bx]

mov bx,2
mov byte ptr [bx],33h
mov bl,[bx]

mov bx,3
mov byte ptr [bx],44h
mov bh,[bx]

mov ax,4c00h
int 21h

code ends

end