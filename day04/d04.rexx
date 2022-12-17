#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '0 0 0' WITH COUNT COUNT2 COUNT3
DO WHILE LINES('INPUT.TXT') > 0                                             
   ITEMS = LINEIN('INPUT.TXT')
   PARSE VAR ITEMS V1 '-' V2 ',' V3 '-' V4 
   IF (V1 <= V3) & (V2 >= V4) ,
    | (V3 <= V1) & (V4 >= V2) THEN DO
      COUNT += 1
   END
   IF (V1 <= V4) & (V2 >= V3) THEN DO
      COUNT2 += 1
   END
END   
SAY 'COUNT PAIRS RANGE-FULLY:' COUNT
SAY 'COUNT PAIRS OVERLAPPING:' COUNT2

EXIT 0