    mov ax, 0x07c0 ;corresponds to physical address 0x7c00, where the BIOS loads the boot sector
    mov ds, ax ; we can't move a value into ds directly

    mov si, msg ;moves the offset of msg into si
    cld ; clears the direction flag (DF) (string operations will increment DI/SI)
ch_loop:
    lodsb ; loads byte from DS:SI into al
    or al, al
    jz hang ; if al=0 hang
    ; AL = Character, BH = Page Number, BL = Color (only in graphic mode)
    mov ah, 0x0E
    mov bh, 0
    int 0x10 ; BIOS interrupt call for video services
    jmp ch_loop

hang:
    jmp hang

msg db  'Hello World', 13, 10, 0
    times 510 - ($-$$) db 0 ; times N db 0 — repeat db 0 (a zero byte) N times
    db 0x55
    db 0xAA

    ; $ = current offset  
    ; $$ = offset of section start
