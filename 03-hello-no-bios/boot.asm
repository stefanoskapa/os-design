[ORG 0x7c00]


    cld
    mov ax, 0xb800 ; video memory
    mov es, ax

    
    mov al, 'a'
    mov ah, 0x0F ; attribute
    mov cx, ax
    xor di, di
    stosw

hang:
    jmp hang


    times 510 - ($-$$) db 0
    db 0x55
    db 0xAA
