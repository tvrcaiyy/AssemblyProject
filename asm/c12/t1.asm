assume cs:codesg

codesg segment
start:
    ;设置源地址
    mov ax,cs
    mov ds,ax
    mov ax,offset interrupt
    mov si,ax
    ;设置目标地址 0000:0200h
    mov ax,0
    mov es,ax
    mov ax,0200h
    mov di,ax
    ;计算要传送的字节数
    mov cx, offset interrupend - offset interrupt
    cld
    rep movsb

    ;设置中断向量表指向的0号中断处理程序的入口地址
    mov ax,0
    mov ds,ax
    mov word ptr ds:[0],0200h
    mov word ptr ds:[2],0

    mov ax,4c00h
    int 21h

interrupt:
    jmp short dot
    db "life is a struggle!!!"
dot:
    mov ax,0
    mov ds,ax
    mov si,0202h

    mov ax,0b800h
    mov es,ax
    mov di,13*160+20*2

    mov cx,21
s:
    mov al,ds:[si]
    mov byte ptr es:[di],al
    inc si
    add di,2
    loop s

    mov ax,4c00h
    int 21h
interrupend: nop


codesg ends

end start