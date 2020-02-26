/*
||  Name:          Joseph Wurz
||  Date:          10 Nov 2019
||  Purpose:       Complete 325 Chapter 4 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

-- Open log file.
--SPOOL apply_plsql_lab3.txt

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
  TYPE list IS TABLE OF VARCHAR2(100);
  TYPE three_type IS RECORD 
  (  xnum    NUMBER
   , xdate   DATE
   , xstring VARCHAR2(30));
  lv_three_type  three_type; 
  lv_input1      VARCHAR2(100);
  lv_input2      VARCHAR2(100);
  lv_input3      VARCHAR2(100);
  lv_strings     LIST;
BEGIN
  lv_input1  := '&1';
  lv_input2  := '&2';
  lv_input3  := '&3';
  lv_strings := list( lv_input1, lv_input2, lv_input3 );
  
  /* Loop through list of values to find only the numbers. */
  FOR i IN 1..lv_strings.COUNT LOOP
    IF REGEXP_LIKE(lv_strings(i),'^[[:digit:]]*$') THEN
       lv_three_type.xnum := lv_strings(i);
    ELSIF REGEXP_LIKE(lv_strings(i),'^[[:alnum:]]*$') THEN
       lv_three_type.xstring := lv_strings(i);
    ELSIF verify_date (lv_strings(i)) IS NOT NULL THEN
       lv_three_type.xdate := lv_strings(i);
    END IF;
  END LOOP;
  dbms_output.put_line('Record ['|| lv_three_type.xnum ||'] ['|| lv_three_type.xstring || '] [' || lv_three_type.xdate || ']');
END;
/
QUIT;
-- Close log file.
--SPOOL OFF
