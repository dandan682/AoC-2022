#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0 0 0 0' WITH SUM_CALORIES MAX1 MAX2 MAX3                         
DO WHILE LINES(INPUT.TXT) > 0                                             
   CALORIES = LINEIN(INPUT.TXT)                                                 
   IF CALORIES = "" THEN CALL SET_MAX 
   ELSE SUM_CALORIES += CALORIES
END
CALL SET_MAX
SAY "TOTAL CALORIES OF THE FIRST 3 ELVS WITH MAX CALORIES:" MAX1 + MAX2 + MAX3
EXIT 0

SET_MAX:
   SELECT 
      WHEN SUM_CALORIES > MAX1 THEN 
         PARSE VALUE SUM_CALORIES MAX1 MAX2 WITH MAX1 MAX2 MAX3
      WHEN SUM_CALORIES > MAX2 THEN 
         PARSE VALUE SUM_CALORIES MAX2 WITH MAX2 MAX3
      WHEN SUM_CALORIES > MAX3 THEN MAX3 = SUM_CALORIES
      OTHERWISE NOP
    END
    SUM_CALORIES = 0
RETURN      
      
      /**
ELF_COUNT += 1
ELF_CAL.ELF_COUNT = RIGHT(SUM_CAL,8,0)      
ELF_CAL.0 = ELF_COUNT

ADDRESS SYSTEM "sort" WITH INPUT STEM ELF_CAL. OUTPUT STEM ELF_CAL.
SAY
CAL_TOT = 0 
DO I = ELF_COUNT TO ELF_COUNT-2 BY -1
  SAY 'ELF #' I 'CALORIAS:' ELF_CAL.I 
  CAL_TOT += ELF_CAL.I
END
SAY CAL_TOT
**/

/*
MAX_CAL = 0                                                 
MAX_ELF = 0 
SUM_CAL = 0                                                 
ELF_COUNT = 0       
ELF_CAL. = 0   

DO WHILE LINES("./d01.txt") > 0                                             
   CAL = LINEIN("./d01.txt")                                                 
   IF CAL = "" THEN DO                                      
      ELF_COUNT = ELF_COUNT + 1                             
      ELF.ELF_COUNT = SUM_CAL                               
      SAY "CALORIES OF ELF#" ELF_COUNT " = " ELF.ELF_COUNT  
      IF SUM_CAL > MAX_CAL THEN DO                          
         MAX_CAL = SUM_CAL                                  
         MAX_ELF = ELF_COUNT                                
      END                                                   
      SUM_CAL = 0                                           
   END                                                      
   ELSE DO                                                  
      SUM_CAL = SUM_CAL + CAL                     
   END                         
END                      
                         
SAY "MAX CALORIES IS" MAX_CAL "FROM ELF#" MAX_ELF 

*/
EXIT 0                                               