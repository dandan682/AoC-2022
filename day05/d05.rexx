#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0' WITH COUNT P. STACK. RES
DO WHILE LINES('INPUT.TXT') > 0                                             
   LINE = LINEIN('INPUT.TXT')
   SELECT
   WHEN POS('[',LINE) > 0 THEN DO 
      PARSE VAR LINE 2 P.1 3 6 P.2 7 10 P.3 11 14 P.4 15 18 P.5 19 22 P.6 23 ,
                    26 P.7 27 30 P.8 31 34 P.9 35
      DO I = 1 TO 9
         IF P.I = '' THEN NOP
         ELSE CALL IQUEUE(I)
      END
   END
   WHEN POS(' 1   2   3   4   5   6   7   8   9 ', LINE) > 0 ,
    | LINE = '' THEN NOP
   OTHERWISE
      PARSE VAR LINE . N . S . T 
      CALL IMOVE(N S T)
   END 
END   

DO I = 1 TO 9
   RES = RES || WORD(STACK.I,1)
END
SAY RES
EXIT 0

IQUEUE: PROCEDURE EXPOSE P. STACK.
   PARSE ARG I
   STACK.I = STACK.I P.I
RETURN

IMOVE: PROCEDURE EXPOSE P. STACK.
   PARSE ARG N S T
   SAY
   SAY MOVE N FROM S TO T
   DO I = 1 TO 9
      SAY '+'I  STACK.I
   END
   STR = SUBWORD(STACK.S,1,N)
   STACK.T = STR STACK.T
   STACK.S = DELWORD(STACK.S,1,N)
   DO I = 1 TO 9
      SAY '-'I STACK.I
   END
RETURN