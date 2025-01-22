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

	LDR R0,=OUR_DATA
	MOV R5,#13
	MOV R3,#9
BEGIN
	LDRSB R1,[R0]
	CMN R1,R5
	BEQ FOUND
	ADD R0,R0,#1
	SUBS R3,R3,#1
	BNE BEGIN
NOT B NOT
FOUND B FOUND

OUR_DATA DCB 13,-10,-13,14,-18,-9,12,-19,16
	END