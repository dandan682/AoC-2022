#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0 0 0 0' WITH FOUND FOUND14 PART1 PART2
DO WHILE LINES('INPUT.TXT') > 0                                             
   LINE = LINEIN('INPUT.TXT')
   SAY 'LENGTH:' LENGTH(LINE)
   STR = SUBSTR(LINE,1,4)
   FOUND = DIF(STR 4)
   DO I = 2 TO (LENGTH(LINE) - 4) WHILE (FOUND = 0 | FOUND14 = 0)
      STR = SUBSTR(LINE,I,4)
      STR2 = SUBSTR(LINE,I,14)
      FOUND = DIF(STR 4)
      IF FOUND & PART1 = 0 THEN DO
         /* SAY SUBSTR(LINE,I,4) I I + 3 */
         part1 =  I + 3
      END
      FOUND14 = DIF(STR2 14)
      IF FOUND14 & PART2 = 0 THEN DO
         /* SAY SUBSTR(LINE,I,14) I I + 13 */
         part2 = I + 13
      END      
   END
   SAY 'PART1>' PART1
   SAY 'PART2>' PART2
   IF FOUND THEN NOP
   ELSE  SAY 'NOT FOUND'
END   

EXIT 0

DIF: PROCEDURE
   PARSE ARG STR L
 /*  SAY STR */
   DO I = 1 TO (L - 1)
      IF POS(SUBSTR(STR,I,1),SUBSTR(STR,I+1)) > 0 THEN RETURN 0
   END
RETURN 1