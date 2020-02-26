-- ------------------------------------------------------------------
--  Program Name:   create_oracle_store.sql
--  Lab Assignment: N/A
--  Program Author: Michael McLaughlin
--  Creation Date:  17-Jan-2018
-- ------------------------------------------------------------------
--  Change Log:
-- ------------------------------------------------------------------
--  Change Date    Change Reason
-- -------------  ---------------------------------------------------
--  
-- ------------------------------------------------------------------
-- This creates tables, sequences, indexes, and constraints necessary
-- to begin lesson #3. Demonstrates proper process and syntax.
-- ------------------------------------------------------------------

-- Set SQL*Plus environmnet variables.
SET ECHO ON
SET FEEDBACK ON
SET NULL '<Null>'
SET PAGESIZE 999
SET SERVEROUTPUT ON

-- Open log file.
SPOOL /home/student/Data/cit225/oracle/lab2/my_appy_oracle_lab2.txt

-- ------------------------------------------------------------------
--  Call scripts to create tables.
-- ------------------------------------------------------------------
@@system_user_lab.sql
@@common_lookup_lab.sql
@@member_lab.sql
@@contact_lab.sql
@@address_lab.sql
@@street_address_lab.sql
@@telephone_lab.sql
@@rental_lab.sql
@@item_lab.sql
@@rental_item_lab.sql



COLUMN table_name_base     FORMAT A30 HEADING "Base Tables"
COLUMN sequence_name_base  FORMAT A30 HEADING "Base Sequences"
SELECT   a.table_name_base
,        b.sequence_name_base
FROM    (SELECT   table_name AS table_name_base
         FROM     user_tables
         WHERE    table_name IN ('SYSTEM_USER_lab'
                                ,'COMMON_LOOKUP_lab'
                                ,'MEMBER_lab'
                                ,'CONTACT_lab'
                                ,'ADDRESS_lab'
                                ,'STREET_ADDRESS_lab'
                                ,'TELEPHONE_lab'
                                ,'ITEM_lab'
                                ,'RENTAL_lab'
                                ,'RENTAL_ITEM_lab')) a  INNER JOIN
        (SELECT   sequence_name AS sequence_name_base
         FROM     user_sequences
         WHERE    sequence_name IN ('SYSTEM_USER_lab_S1'
                                   ,'COMMON_LOOKUP_lab_S1'
                                   ,'MEMBER_lab_S1'
                                   ,'CONTACT_lab_S1'
                                   ,'ADDRESS_lab_S1'
                                   ,'STREET_ADDRESS_lab_S1'
                                   ,'TELEPHONE_lab_S1'
                                   ,'ITEM_lab_S1'
                                   ,'RENTAL_lab_S1'
                                   ,'RENTAL_ITEM_lab_S1')) b
ON       a.table_name_base =
           SUBSTR( b.sequence_name_base, 1, REGEXP_INSTR(b.sequence_name_base,'_S1') - 1)
ORDER BY CASE
           WHEN table_name_base LIKE 'SYSTEM_USER%' THEN 0
           WHEN table_name_base LIKE 'COMMON_LOOKUP%' THEN 1
           WHEN table_name_base LIKE 'MEMBER%' THEN 2
           WHEN table_name_base LIKE 'CONTACT%' THEN 3
           WHEN table_name_base LIKE 'ADDRESS%' THEN 4
           WHEN table_name_base LIKE 'STREET_ADDRESS%' THEN 5
           WHEN table_name_base LIKE 'TELEPHONE%' THEN 6
           WHEN table_name_base LIKE 'ITEM%' THEN 7
           WHEN table_name_base LIKE 'RENTAL%' AND NOT table_name_base LIKE 'RENTAL_ITEM%' THEN 8
           WHEN table_name_base LIKE 'RENTAL_ITEM%' THEN 9
         END;




-- Close log file.
SPOOL OFF
