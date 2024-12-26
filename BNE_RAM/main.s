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
 
          AREA    PROGRAM16, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

RAM_ADDR EQU 0X40000000
	
	MOV R0,#0X25
	LDR R1,=0X55555555
	LDR R2,=RAM_ADDR
	
LABEL	STR R1,[R2]
	ADD R2,R2,#4
	SUBS R0,R0,#1
	BNE LABEL
	END