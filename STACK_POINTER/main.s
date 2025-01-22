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
 
          AREA    MYCODE, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler
;;;;;;;;;;User Code Starts from the next line;;;;;;;;;;;;

Stack_Top EQU 0x20001000

	LDR R13,=Stack_Top
	LDR R0,=0X125
	LDR R1,=0X144
	MOV R2, #0X56
	BL MY_SUB
	ADD R3,R0,R1
	ADD R3,R3,R2
HERE 
	B HERE
	
MY_SUB
	STR R0,[R13]
	SUB R13,R13,#4
	
	STR R1,[R13]
	SUB R13,R13,#4
	
	STR R2,[R13]
	SUB R13,R13,#4
	
	MOV R0,#0
	MOV R1,#0
	MOV R2,#0
	
	ADD R13,R13,#4
	LDR R2,[R13]
	
	ADD R13,R13,#4
	LDR R1,[R13]
	
	ADD R13,R13,#4
	LDR R0,[R13]
	
	BX LR
	
	END