assume cs:code
data segment
    dw 12666,6204,123,209
    db 16 dup(0)
data ends

code segment
    start:  mov ax,data
            mov ds,ax

            mov si,0
            mov bp,16
            mov cx,4
        s3:
            call itoc
            add si,2
        loop s3

        ;第8行，第3列，绿色字体
        mov dh,8
        mov dl,3
        mov cl,2

        mov ax,0b800h
        mov es,ax
        mov bp,16
        mov si,bp
        call show_str

            mov ax,4c00h
            int 21h
            

    itoc:
        push ax
        push di
        push cx
        mov ax,ds:[si]
        mov di,0
    s1:
        mov dx,0
        mov bx,10
        div bx
        mov cx,ax
        push dx
        inc di
        jcxz okk
        mov ax,cx
        mov dx,0
        jmp short s1

    okk:
        mov cx,di
        s2:
        pop dx
        add dx,30h
        mov ds:[bp],dl
        inc bp
        loop s2
        
        pop cx
        pop di
        pop ax
        ret



    show_str:
        ;计算行首地址为，存在ax中
        mov al,160
        mov ah,0
        mul dh
        add al,dl
        add al,dl
        mov di,ax

        
    s:  push cx
        mov cl,ds:[si]
        mov ch,0
        jcxz ok
        pop cx

        mov dl,ds:[si]
        mov byte ptr es:[di],dl
        mov byte ptr es:[di + 1],cl       ;颜色
        inc si
        add di,2
        jmp short s

    ok: pop cx
        ret
code ends

end start