assume cs:codesg
datasg segment
    db "Beginner`s All-purpose Symbolic Instruction Code.",0
datasg ends

codesg segment
    start:
        mov ax,datasg
        mov ds,ax
        mov si,0

        call letterc

        mov ax,4c00h
        int 21h

    letterc:
        push cx
    s0: 
        mov cl, byte ptr ds:[si]
        jcxz ok

        cmp cl,97
        jb s1
        cmp cl,122
        ja s1
    
        and byte ptr ds:[si],11011111b
        jmp short s1

    s1:
        inc si
        jmp short s0

    ok:
        pop cx
        ret

codesg ends

end start