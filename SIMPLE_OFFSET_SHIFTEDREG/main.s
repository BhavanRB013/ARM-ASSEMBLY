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
 
          AREA    PROGRAM18, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

POINTER RN R1
ARRAY1 RN R2
	
	LDR ARRAY1,=MYDATA
	LDRB R4,[ARRAY1]
	MOV POINTER,#1
	LDRB R5,[ARRAY1,POINTER]
	MOV POINTER,#2
	LDRB R6,[ARRAY1,POINTER]
HERE B HERE
MYDATA DCB 0X45,0X24,0X18,0X63
	END
		