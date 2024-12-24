     
 
          AREA    RESET, DATA, READONLY
          EXPORT  __Vectors
 
__Vectors 
	  DCD  0x20001000     

          DCD  Reset_Handler  ; reset vector
  
          ALIGN
 
 
          AREA    PROGRAM9, CODE, READONLY
 
   	  ENTRY
   	  EXPORT Reset_Handler
 
 
Reset_Handler

	MOV R0,#0X26
HERE
	MOVS R0,R0,RRX
	B HERE
	END