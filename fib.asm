; vim: set ft=asm:
global _main
extern  _printf

section .data
    format  db    "%u", 10, 0

section .text



fibdone:
    ret

_main:
    mov ecx, 40
    mov eax, 1                      ; set eax=1
    mov ebx, 1                      ; set ebx=1

    mov     edx, eax                ; save the current number
    mov     eax, ebx                ; next number is now current
    add     ebx, edx                ; get the new next number
    dec     ecx
    jnz     $-7

    sub     esp, 12
    mov     dword[esp], format
    mov     dword[esp + 4], eax
    call    _printf
    add     esp, 12

    xor     eax, eax                ; return code
    ret

