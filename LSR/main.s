     
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
 
          AREA    PROGRAM5, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

TIMES EQU 0X4
	
	LDR R1,=0X777
	MOV R2,#TIMES
	MOV R3,R1,LSR R2
	
	END
		