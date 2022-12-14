#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0 0 0 0' WITH FOUND4 FOUND14 PART1 PART2
DO WHILE LINES('INPUT.TXT') > 0                                             
   LINE = LINEIN('INPUT.TXT')
   SAY 'LENGTH:' LENGTH(LINE)
   DO I = 1 TO (LENGTH(LINE) - 4) WHILE (FOUND = 0 | FOUND14 = 0)
      STR4  = SUBSTR(LINE,I,4)
      STR14 = SUBSTR(LINE,I,14)
      FOUND4 = DIF(STR4, 4)
      IF FOUND4 & PART1 = 0 THEN PART1 =  I + 3
      FOUND14 = DIF(STR14, 14)
      IF FOUND14 & PART2 = 0 THEN PART2 = I + 13
   END
   SAY 'PART1>' PART1
   SAY 'PART2>' PART2
END   

EXIT 0

DIF: PROCEDURE
   PARSE ARG STR, L
   DO I = 1 TO (L - 1)
      IF POS(SUBSTR(STR,I,1),SUBSTR(STR,I+1)) > 0 THEN RETURN 0
   END
RETURN 1