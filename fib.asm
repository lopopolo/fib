; vim: set ft=asm:
global _main
extern  _printf

section .data
    format  db    "%u", 10, 0

section .text

fib:
    mov ecx, 40
    xor eax, eax ; set eax=0
    xor ebx, ebx ; set ebx=0
    inc eax      ; set eax=1
    inc ebx      ; set ebx=1
fibstep:
    mov     edx, eax                ; save the current number
    mov     eax, ebx                ; next number is now current
    add     ebx, edx                ; get the new next number
    dec     ecx
    jnz fibstep


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

