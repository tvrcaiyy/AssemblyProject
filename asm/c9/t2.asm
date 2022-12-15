assume cs:codesg,ds:data
    data segment
        db 'welcome to masm!'
        db 02h,24h,71h
    data ends
    codesg segment
    ;显示在11、12、13行对应的行首地址为0780h,0820h,08c0h
    ;显示在32-48列，地址从64-95
start:
        mov ax,data
        mov ds,ax
        mov ax,0b800h
        mov es,ax
        mov bx,0780h
        mov cx,3
        mov bp,10h
    s0:
        push cx
        mov cx,16
        mov si,64
        mov di,0
        mov dh,ds:[bp]
        s1:
            mov dl,ds:[di]
            mov byte ptr es:[bx + si],dl
            
            ;color
            mov byte ptr es:[bx + si + 1],dh

            inc di
            add si,2
        loop s1
        inc bp
        pop cx

        add bx,160
    loop s0

    mov ax,4c00h
    int 21h

    codesg ends
end start