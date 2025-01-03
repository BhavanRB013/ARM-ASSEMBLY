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
 
          AREA    PROGRAM24, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

PORT_ADDR EQU 0X40000000
	LDR R1,=PORT_ADDR
AGAIN MOV R0,#0X55
	STRB R0,[R1]
	BL DELAY
	MOV R0,#0XAA
	STRB R0,[R1]
	BL DELAY
	BAL AGAIN
	
DELAY
	MOV R3,#100
L1 LDR R4,=250000
L2 SUBS R4,R4,#1
	BNE L2
	SUBS R3,R3,#1
	BNE L1
	MOV PC,LR
	
	END
		