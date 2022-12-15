assume cs:code

code segment
start:
    mov ax,4240h
    mov dx,000fh
    mov cx,0ah

    call divdw

    mov ax,4c00h
    int 21h

divdw:
    push ax
    push dx
    push bx 

    mov bx,ax
    ;公式：x/n = int(h/n)*65536 + [rem(h/n)*65536 + l] / n
    ;x被除数32位,n除数16位，h:x高16位数 l:x低16位数 int(): 商   rem(): 余数

    ;先算int(h/n) 除数是16位，被除数是32位，分别放在dx,ax     div除数为16位的情况：商放在ax,余数放在dx
    mov ax,dx
    mov dx,0h
    div cx 
    ;int(h/n)*65536 => ax * 65536 = ax * 0001 0000h 相当于将ax的值当成乘法结果的高16位，低16位为0
    mov si,ax

    ;rem(h/n) 的值存在dx中，* 65536 相当于将dx的值当成乘法结果的高16位，低16位为0, +l后低16位为l
    ;[rem(h/n)*65536 + l] / n
    mov ax,bx
    div cx

    ;返回：(dx)=结果高16位 (ax)=结果的低16位 (cx)=余数
    mov cx,dx
    mov dx,si

    pop bx
    pop dx
    pop ax
    ret
    
code ends

end start