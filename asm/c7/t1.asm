assume cs:codesg,ds:datasg

    datasg segment
        db 'ibm             '
        db 'dec             '
        db 'dos             '
        db 'vax             '
    datasg ends

    codesg segment
    start:
        mov ax,datasg
        mov ds,ax
        mov bx,0
        mov cx,4

    s0: 
        push cx
        mov cx,3
        mov si,0
        s1:
        mov al,[bx+si]
        and al,11011111b
        mov [bx+si],al
        inc si
        loop s1
        add bx,16
        pop cx
    loop s0

        mov ax,4c00h
        int 21h

    codesg ends

end start