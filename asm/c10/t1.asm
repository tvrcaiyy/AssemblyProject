assume cs:code
data segment
    db 'Welcome to masm!',0
data ends
;段地址为0b800h,行首地址为： 160 * 行数

code segment
start: mov dh,8
       mov dl,3
       mov cl,2
       mov ax,data
       mov ds,ax
       mov si,0

       mov ax,0b800h
       mov es,ax

       call show_str

       mov ax,4c00h
       int 21h

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

        ; push ax

        ; mov al,160
        ; mov ah,0
        ; mul dh
        ; mov bx,ax

        ; mov al,dl
        ; mov ah,0
        ; mov di,2
        ; mul di
        ; add bx,ax

        ; mov di,cx

        ; mov cl,[si]
        ; mov ch,0
        ; jcxz ok 

        ; mov dl,ds:[si]
        ; mov byte ptr es:[bx + si],dl
        ; mov byte ptr dl,di
        ; mov byte ptr es:[bx+1],di

        ; inc si

        ; ok: pop ax
        ;     ret