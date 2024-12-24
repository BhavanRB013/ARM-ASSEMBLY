     
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
 
          AREA    PROGRAM6, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

TIMES EQU 0X5
	LDR R1,=0X07
	MOV R2,#TIMES
	MOV R3,R1,LSL R2
	END
		