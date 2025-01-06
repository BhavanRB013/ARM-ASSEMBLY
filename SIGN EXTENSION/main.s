;;; Directives
          ;PRESERVE8
          ;THUMB       
 
; Vector Table Mapped to Address 0 at Reset
; Linker requires __Vectors to be exported
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     ; stack pointer value when stack is empty
			;The processor uses a full descending stack. 
			;This means the stack pointer holds the address of the last 
			;stacked item in memory. When the processor pushes a new item 
			;onto the stack, it decrements the stack pointer and then 
			;writes the item to the new memory location.

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
; The program
; Linker requires Reset_Handler
 
          AREA    PROGRAM, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

	LDR R0,=SIGN_DAT
	MOV R3,#9
	MOV R2,#0
LOOP LDRSB R1,[R0]
	ADD R2,R2,R1
	ADD R0,R0,#1
	SUBS R3,R3,#1
	BNE LOOP
	LDR R0,=SUM
	STR R2,[R0]
HERE B HERE

SIGN_DAT DCB 13,-10,19,14,-18,-9,12,-19,16

	AREA VARIABLES, DATA, READWRITE
SUM DCD 0
	END