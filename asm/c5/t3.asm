assume cs:code
    code segment
        mov ax,0h
        mov ds,ax
        mov bx,200h
        mov cx,64

    s:  mov [bx],bl
        inc bl
        loop s
        
        
        mov ax,4c00h
        int 21h

    code ends
end