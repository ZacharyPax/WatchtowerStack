section .data
    watchtower db 'Watchtower: ', 0
    tcp_message db 'Protocol: TCP', 0
    udp_message db 'Protocol: UDP', 0
    icmp_message db 'Protocol: ICMP', 0
    unknown_message db 'Protocol: UNKNOWN', 0
    ip_header db 0x45, 0x00, 0x00, 0x3C, 0x1C, 0x46, 0x40, 0x00, 0x40, 0x06, 0xB1, 0xE6, 0xC0, 0xA8, 0x00, 0x68, 0xC0, 0xA8, 0x00, 0x01
    ip_header_extended db 0x45, 0x00, 0x00, 0x3C, 0x1C, 0x46, 0x40, 0x00, 0x40, 0x11, 0xB1, 0xE6, 0xC0, 0xA8, 0x00, 0x68, 0xC0, 0xA8, 0x00, 0x02
    additional_info db 'Extended IP header inspection', 0

section .bss
    buffer resb 128

section .text
    global _start

_start:
    lea rsi, [watchtower]
    call print_message

    lea rsi, [ip_header]
    movzx eax, byte [rsi + 9]
    cmp al, 0x06
    je handle_tcp
    cmp al, 0x11
    je handle_udp
    cmp al, 0x01
    je handle_icmp
    jmp handle_unknown

handle_tcp:
    lea rsi, [tcp_message]
    call print_message
    call tcp_specific_function
    jmp end_program

handle_udp:
    lea rsi, [udp_message]
    call print_message
    call udp_specific_function
    jmp end_program

handle_icmp:
    lea rsi, [icmp_message]
    call print_message
    call icmp_specific_function
    jmp end_program

handle_unknown:
    lea rsi, [unknown_message]
    call print_message
    call unknown_specific_function
    jmp end_program

tcp_specific_function:
    lea rsi, [watchtower_tcp]
    call print_message
    ret

udp_specific_function:
    lea rsi, [watchtower_udp]
    call print_message
    ret

icmp_specific_function:
    lea rsi, [watchtower_icmp]
    call print_message
    ret

unknown_specific_function:
    lea rsi, [watchtower_unknown]
    call print_message
    ret

print_message:
    mov rdx, 128
    mov rdi, 1
    mov rax, 1
    syscall
    ret

end_program:
    mov eax, 60
    mov edi, 0
    syscall

section .data
    watchtower_tcp db 'Watchtower: TCP packet detected', 0
    watchtower_udp db 'Watchtower: UDP packet detected', 0
    watchtower_icmp db 'Watchtower: ICMP packet detected', 0
    watchtower_unknown db 'Watchtower: Unknown protocol', 0

section .text
    global _start_extended

_start_extended:
    lea rsi, [additional_info]
    call print_message

    lea rsi, [ip_header_extended]
    movzx eax, byte [rsi + 9]
    cmp al, 0x06
    je handle_tcp_extended
    cmp al, 0x11
    je handle_udp_extended
    cmp al, 0x01
    je handle_icmp_extended
    jmp handle_unknown_extended

handle_tcp_extended:
    lea rsi, [watchtower_tcp]
    call print_message
    call extended_tcp_specific_function
    jmp end_program_extended

handle_udp_extended:
    lea rsi, [watchtower_udp]
    call print_message
    call extended_udp_specific_function
    jmp end_program_extended

handle_icmp_extended:
    lea rsi, [watchtower_icmp]
    call print_message
    call extended_icmp_specific_function
    jmp end_program_extended

handle_unknown_extended:
    lea rsi, [watchtower_unknown]
    call print_message
    call extended_unknown_specific_function
    jmp end_program_extended

extended_tcp_specific_function:
    lea rsi, [watchtower_extended_tcp]
    call print_message
    ret

extended_udp_specific_function:
    lea rsi, [watchtower_extended_udp]
    call print_message
    ret

extended_icmp_specific_function:
    lea rsi, [watchtower_extended_icmp]
    call print_message
    ret

extended_unknown_specific_function:
    lea rsi, [watchtower_extended_unknown]
    call print_message
    ret

end_program_extended:
    mov eax, 60
    mov edi, 0
    syscall

section .data
    watchtower_extended_tcp db 'Watchtower: Extended TCP packet detected', 0
    watchtower_extended_udp db 'Watchtower: Extended UDP packet detected', 0
    watchtower_extended_icmp db 'Watchtower: Extended ICMP packet detected', 0
    watchtower_extended_unknown db 'Watchtower: Extended Unknown protocol', 0
