; CISP 310 - Project 1: Random Strings
; MASM + Irvine32 (x86, 32-bit)

INCLUDE Irvine32.inc

.data
    STR_COUNT = 20              ; how many strings to generate
    STR_LEN   = 10              ; length of each string
    buffer    BYTE STR_LEN DUP(?), 0

.code
main PROC
    call Randomize              ; seed the RNG once

    mov  ecx, STR_COUNT
NextString:
    push ecx
    call MakeString
    mov  edx, OFFSET buffer
    call WriteString
    call Crlf
    pop  ecx
    loop NextString

    exit
main ENDP

;-------------------------------------------------------
; MakeString: fills buffer with STR_LEN random capital letters (A-Z)
; Receives: nothing   Returns: buffer filled
;-------------------------------------------------------
MakeString PROC
    mov  ecx, STR_LEN
    mov  esi, OFFSET buffer
L1:
    mov  eax, 26
    call RandomRange            ; EAX = 0..25
    add  eax, 'A'
    mov  [esi], al
    inc  esi
    loop L1
    ret
MakeString ENDP

END main
