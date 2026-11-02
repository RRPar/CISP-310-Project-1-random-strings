;CISP 310 Project 1 Random Strings
;Rishi Parikh
;11/1/2026

INCLUDE Irvine32.inc

.data	; David 11/1/26 -- Redone Rishi's
	MAX_LENGTH EQU 50 	; Max length for the output
	str_memory BYTE MAX_LENGTH+1 DUP(0) 	; Reserves 51 bytes of memory 
	prompt     BYTE "Enter string length (1-50): ", 0	; Ask the user to give a integer for the output length
 	badInput   BYTE "Invalid length, try again.", 0Dh, 0Ah, 0	; String constant for error message
	userLen    DWORD ?
.code
main PROC
	CALL Randomize
	MOV ECX, 20	; Loop the string randomizer 20 times.
	
