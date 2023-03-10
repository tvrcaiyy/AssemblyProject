assume cs:codesg,ds:datasg,ss:stacksg

stacksg segment
    dw 0,0,0,0,0,0,0,0
stacksg ends

datasg segment
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
datasg ends

codesg segment
start:
    mov ax,stacksg
    mov ss,ax
    mov sp,16
    mov ax,datasg
    mov ds,ax

    mov cx,4
    mov bx,0
    s0:
        push cx
        mov cx,4
        mov si,0

        s1:
        mov al,[bx+3+si]
        and al,11011111b
        mov [bx+3+si],al
        inc si
        loop s1
        
        pop cx
        add bx,16
    loop s0

    mov ax,4c00h
    int 21h

codesg ends

end start