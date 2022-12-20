#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0' WITH COUNT P. 
DO WHILE LINES('INPUT.TXT') > 0                                             
   LINE = LINEIN('INPUT.TXT')
   IF POS('[',LINE) > 0 THEN DO 
      PARSE VAR LINE 2 P.1 3 6 P.2 7 10 P.3 11 14 P.4 15 18 P.5 19 22 P.6 23 ,
                    26 P.7 27 30 P.8 31 34 P.9 35

      DO I = 1 TO 9
         IF P.I /= '' THEN DO
            QUEUE P.I
         END
      END
      
   END
   IF POS(' 1   2   3   4   5   6   7   8   9 ', LINE) > 0 THEN LEAVE 
END   

PUSH: PROCEDURE
PARSE ARG STACK_N

RETURN

EXIT 0