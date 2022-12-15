assume cs:code
    a segment
        db 1,2,3,4,5,6,7,8
    a ends
    b segment
        db 1,2,3,4,5,6,7,8
    b ends
    c segment
        db 0,0,0,0,0,0,0,0
    c ends
    
    code segment
start:  mov ax,a
        mov ds,ax
        mov ax,b
        mov es,ax
        mov cx,4
        mov bx,0

    s:  mov dx,[bx]
        add dx,es:[bx]
        push ds
        mov ax,c
        mov ds,ax
        mov [bx],dx
        pop ds
        add bx,2
        loop s

        mov ax,4c00h
        int 21h

    code ends
end start