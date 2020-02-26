/*
||  Name:          Joseph Wurz 
||  Date:          5-18-2019
||  Purpose:       Complete 325 Chapter 5 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

-- Open log file.
SET SERVEROUTPUT ON
SET VERIFY OFF
SPOOL apply_plsql_lab4.txt

CREATE OR REPLACE
  TYPE lyric IS OBJECT
  ( day_name   VARCHAR(8)
  , gift_name  VARCHAR2(24));
/

DECLARE
   TYPE days IS TABLE OF VARCHAR(8);
   TYPE gifts IS TABLE OF lyric;
  
   lv_days  DAYS := days ('first', 'second', 'third', 'fourth', 'fifth', 'sixth', 'seventh', 'eighth', 'ninth', 'tenth', 'eleventh', 'twelfth');
   lv_gifts GIFTS := gifts( lyric ('and a ', 'Partridge in a pear tree')
                           ,lyric ('Two', 'Turtle doves') 
                           ,lyric ('Three', 'French hens')
                           ,lyric ('Four', 'Calling birds')
                           ,lyric ('FIVE', 'GOLDEN RINGS!!')
                           ,lyric ('Six', 'Geese a laying')
                           ,lyric ('Seven', 'Swans a swimming')
                           ,lyric ('Eight', 'Maids a milking')
                           ,lyric ('Nine', 'Ladies dancing')
                           ,lyric ('Ten', 'Lords a leaping')
                           ,lyric ('Eleven', 'Pipers piping')
                           ,lyric ('Twelve', 'Drummers drumming'));
BEGIN 
  FOR i IN 1..lv_days.LAST LOOP
    dbms_output.put_line('On the ' || lv_days(i) || ' day of Christmas');
    dbms_output.put_line('my true love sent to me:');
      FOR j IN REVERSE 1..i LOOP
        IF lv_days(i) = 'first' THEN
          dbms_output.put_line('-' || 'A ' || lv_gifts(j).gift_name);
        ELSE
          dbms_output.put_line('-' || lv_gifts(j).day_name || ' ' || lv_gifts(j).gift_name);
        END IF;
      END LOOP;
        dbms_output.put_line(CHR(13));
  END LOOP;
END;
/
-- Close log file.
SPOOL OFF

