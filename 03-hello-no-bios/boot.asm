[ORG 0x7c00]


    cld
    mov ax, 0xb800 ; video memory
    mov es, ax
    
    call clear_screen

hang:
    jmp hang



clear_screen: 
    mov al, ' ' 
    mov ah, 0x0F ; attribute
    mov cx, ax
    xor di, di
loop:
    stosw
    cmp di, 4000 ; 80 columns * 25 rows
    jne loop
    ret



    times 510 - ($-$$) db 0
    db 0x55
    db 0xAA
