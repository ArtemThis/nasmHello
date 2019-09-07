section .data  ;section  .data contains initialized constant variables
    msg db 'Hello, bros!', 0xa, 0xd
    len equ $ - msg
    
section .text  ;section .text contains code
global _start  ;Do you know about main functions? Here it goes
    
_start:
    mov eax, 4  ;number of syscall  sys_write
    mov ebx, 1  ;file descriptor    std_out
    mov ecx, msg    ;string to write
    mov edx, len    ;length of string
    
    int 0x80  ;interrupt is necessary for code above to work
    
    ;code for exit goes down
    mov eax, 1  ;syscall    sys_exit
    mov ebx, 0  ;err code null means all nice
    
    int 0x80
