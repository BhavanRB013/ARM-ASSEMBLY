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
	
	MOV POINTER,#0
	LDR R4,[ARRAY1,POINTER,LSL #2]
	
	MOV POINTER,#1
	LDRB R5,[ARRAY1,POINTER,LSL #2]
	
	MOV POINTER,#2
	LDR R6,[ARRAY1,POINTER,LSL #2]

HERE
	B HERE
MYDATA DCD 0X45,0X2489ACF5,0X2489AC23
	END