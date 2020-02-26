/*
||  Name:          Joseph Wurz
||  Date:          4 May 2019
||  Purpose:       Complete 325 Chapter 3 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

-- Open log file.

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
   lv_raw_input VARCHAR2(1000);
   lv_input VARCHAR2(10);
BEGIN
   lv_raw_input := '&1';
   lv_input := SUBSTR(lv_raw_input, 1 , 10);
   IF lv_raw_input IS NULL THEN
      dbms_output.put_line('Hello World!');
   ELSIF LENGTH(lv_raw_input) < 11 THEN
      dbms_output.put_line('Hello ' || lv_raw_input || '!');
   ELSE 
      dbms_output.put_line('Hello ' || lv_input || '!');
  END IF;
END;
/
QUIT;

