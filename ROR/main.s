     
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
 
          AREA    PROGRAM7, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

	;MOV R0,#0X36
	;MOV R1,R0,ROR #3
	;END
		
	MOV R0,#0X36
	MOV R1,#3
	MOV R0,R0,ROR R1
	END
		