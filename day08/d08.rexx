#! /usr/local/bin/regina
/* REXX */
PARSE VALUE '' WITH CDN. DIRECTORIES REPEATED CD



DO WHILE LINES('INPUT.TXT') > 0                                             
   LINE = LINEIN('INPUT.TXT')
   PARSE VAR LINE W1 W2 W3 W4
   SELECT
      WHEN W1 = '$' THEN DO 
         IF W2 = 'cd' THEN 
            SELECT
               WHEN W3 = '..' THEN DO
                  SAY 'COMMAND:' LINE
                  CD1 = DELWORD(CD,WORDS(CD),1)
                  CD = TRANSLATE(CD1,'-',' ')
               END
               OTHERWISE /* CD DIRECTORY */
                  NAME = STRIP(W3)
                  PARENT = CD
                  CD1 = STRIP(PARENT NAME)
                  CD = TRANSLATE(CD1,'-',' ')
                  SAY 'COMMAND:' LINE
                  IF WORDPOS(CD, DIRECTORIES) > 0 THEN DO
                     REPETIDO = parent'/'cd
                     say 'REPETIDO' REPETIDO
                     REPEATED = STRIP(REPEATED REPETIDO) 
                  END
                  DIRECTORIES = STRIP(DIRECTORIES CD)
            END
         ELSE SAY 'COMMAND:' LINE CD
      END
      WHEN DATATYPE(W1,N) THEN DO /* FILE */
         PARSE VALUE W1 W2 WITH FSIZE FNAME
         SAY 'FILE:' LEFT(FNAME,15) 'SIZE:' FSIZE
         CDN.CD.FILES = STRIP(CDN.CD.FILES FNAME) 
         IF CDN.CD.SIZE = '' THEN CDN.CD.SIZE = FSIZE
         ELSE CDN.CD.SIZE += FSIZE
         /* SAY 'SIZE OF DIRECTORY' UPPER(CD)':' CDN.CD.SIZE */
      END
      WHEN W1 = 'dir' THEN DO
         SAY 'DIRECTORY:' W2
         CDN.CD.DIRECTORY = STRIP(CDN.CD.DIRECTORY W2)
         IF CDN.CD.SIZE = '' THEN CDN.CD.SIZE = 0
         /* IF WORDPOS(CD, DIRECTORIES) = 0 THEN 
            DIRECTORIES = STRIP(DIRECTORIES CD) */
      END
   END
END   
SAY 'RESULTS'
/* SAY 'DIRECTORIES:' DIRECTORIES
DO I = WORDS(DIRECTORIES) TO 1 BY -1
   CD = WORD(DIRECTORIES, I)
   SAY CD CDN.DIR.SIZE
END
*/
PART1 = 0
DO I = WORDS(DIRECTORIES) TO 1 BY -1
   CD = WORD(DIRECTORIES, I)
   SAY '('I')' CD 
   SAY '   DIRECTORIES:' CDN.CD.DIRECTORY
   SAY '   FILES:' CDN.CD.FILES
   TSIZE = CDN.CD.SIZE
   DO J = 1 TO WORDS(CDN.CD.DIRECTORY)
      DIR = WORD(CDN.CD.DIRECTORY, J) 
      SAY '   ' LEFT(DIR,8) '*'CDN.DIR.SIZE
      TSIZE += CDN.DIR.SIZE
   END
   CDN.CD.SIZE = TSIZE
   IF CDN.CD.SIZE <= 100000 THEN PART1 += CDN.CD.SIZE
   SAY '   SIZE:' TSIZE 
END

SAY 'DIRECTORIES:' WORDS(DIRECTORIES) DIRECTORIES
SAY
SAY 'REPETIDOS:' REPEATED
SAY 'PART1>' PART1

EXIT 0