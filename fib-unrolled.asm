; vim: set ft=asm:
global _main
extern  _printf

section .data
    format  db    "%u", 10, 0

section .text

_main: ; unrolled for n = 40
    mov eax, 1                      ; set eax=1
    mov ebx, 1                      ; set ebx=1

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    mov     edx, ebx                ; temp = b
    add     ebx, eax                ; b = a + b

    mov     eax, ebx                ; a = b
    add     ebx, edx                ; b = b + temp

    sub     esp, 12
    mov     dword[esp], format
    mov     dword[esp + 4], eax
    call    _printf
    add     esp, 12

    xor     eax, eax                ; return code
    ret

