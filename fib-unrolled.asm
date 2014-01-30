; vim: set ft=asm:
global _main
extern  _printf

section .data
    format  db    "%u", 10, 0

section .text

fib: ; unrolled for n = 40
    xor eax, eax ; set eax=0
    xor ebx, ebx ; set ebx=0
    inc eax      ; set eax=1
    inc ebx      ; set ebx=1
fibstep:
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

fibdone:
    ret

_main:
    call fib
    sub esp, 12
    mov dword[esp], format
    mov dword[esp + 4], eax
    call    _printf
    add esp, 12

    mov eax, 0         ; return code
    ret

