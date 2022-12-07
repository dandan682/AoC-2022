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