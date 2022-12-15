assume cs:codesg
    data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'
        
        dd 16,22,382,1356,2390,8000,16000,24486,50065
        dd 97479,140417,197514,345980,590827,803530,1183000,1843000,2759000
        dd 3753000,4649000,5937000
        
        dw 3,7,9,13,28,38,130,220,476
        dw 778,1001,1442,2258,2793,4037,5635,8826,11542
        dw 14430,15257,17800
    data ends

    table segment
    db 21 dup ('year summ ne ?? ')
    table ends

    codesg segment
    start:
        mov ax,data
        mov ds,ax
        mov ax,table
        mov es,ax

        mov cx,21
        mov bx,0
        mov si,0
        mov di,0

    s0: 
        mov ax,ds:[si]
        mov dx,ds:[si+2]
        mov es:[bx],ax
        mov es:[bx+2],dx

        ;总收入
        mov ax,ds:054h[si]
        mov dx,ds:054h[si+2]
        mov es:[bx+5],ax
        mov es:[bx+7],dx

        mov ax,ds:0A8h[di]
        mov es:[bx+10],ax

        ;人均收入
        mov ax,ds:054h[si]
        mov dx,ds:054h[si+2]
        div word ptr ds:0A8h[di]
        mov es:[bx+13],ax

        add si,4
        add di,2
        add bx,10h
    loop s0
    
    mov ax,4c00h
    int 21h

    codesg ends
end start