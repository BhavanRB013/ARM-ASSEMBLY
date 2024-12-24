     
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
 
          AREA    PROGRAM8, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

	;LDR R0,=0X00000072
	MOV R0,#0X72
HERE
	MOV R0,R0,ROR #31
	B HERE
	END