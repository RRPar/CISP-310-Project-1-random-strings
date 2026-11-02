INCLUDE Irvine32.inc

.data
    MAX_L EQU 50
    strBuffer BYTE MAX_L DUP(0)

.code
main PROC
    CALL Randomize
    MOV ECX, 20                    ; Loop 20 times

TestLoop:
    PUSH ECX
    MOV EAX, 15                    ; Length L
    MOV EDI, OFFSET strBuffer      
    CALL GenerateRandomString
    
    MOV EDX, OFFSET strBuffer
    CALL WriteString
    CALL Crlf
    
    POP ECX
    LOOP TestLoop
    EXIT
main ENDP

GenerateRandomString PROC
    PUSHAD                         ; Save all general-purpose registers at once
    MOV ECX, EAX                   ; ECX = L

GenLoop:
    MOV EAX, 26
    CALL RandomRange               ; Get random 0-25
    ADD EAX, 'A'                   ; Convert to ASCII letter
    MOV [EDI], AL                  ; Store in byte array
    INC EDI                        
    LOOP GenLoop

    MOV BYTE PTR [EDI], 0          ; Null-terminate
    POPAD                          ; Restore all registers at once
    RET
GenerateRandomString ENDP

END main