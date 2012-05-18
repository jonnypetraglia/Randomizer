; create executable this way:
; nasm -f elf64 -g -F stabs echo.asm
; gcc -o echo echo.o
;    
 
        
extern  printf
 
section .data
 
format: db '%s', 10, 0
 
section .text
 
    global  main
 
main:
    mov     rcx, rdi                ; argc
    mov     r8, 0                   ; offset
 
repeat:
    mov     rdx, qword [rsi+r8]     ; argv
 
    push    rcx                     ; save registers that printf wastes
    push    rdx
    push    rsi
    push    r8
 
    mov    rdi, format         ; first parameter for printf
    mov    rsi, rdx            ; second parameter for printf
    mov    rax, 0              ; no floating point register used
    call   printf              ; call to printf
 
    pop    r8                  ; restore registers
    pop    rsi
    pop    rdx                     
    pop    rcx
 
    add    r8, 8               ; point to next argument
    dec    rcx                 ; count down
    jnz    repeat              ; if not done counting keep going
 
    mov    rax, 1              ; stop the program
    mov    rbx, 0
    int    80h