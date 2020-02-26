-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab12.sql
--  Lab Assignment: Lab #12
--  Program Author: Michael McLaughlin
--  Creation Date:  02-Mar-2018
-- ------------------------------------------------------------------
-- Instructions:
-- ------------------------------------------------------------------
-- The two scripts contain spooling commands, which is why there
-- isn't a spooling command in this script. When you run this file
-- you first connect to the Oracle database with this syntax:
--
--   sqlplus student/student@xe
--
-- Then, you call this script with the following syntax:
--
--   sql> @apply_oracle_lab12.sql
--
-- ------------------------------------------------------------------

-- Run the prior lab script.
@/home/student/Data/cit225/oracle/lab11/apply_oracle_lab11.sql

-- Spool log file.
SPOOL apply_oracle_lab12.txt
--STEP 1



CREATE TABLE calendar 
( calendar_id           NUMBER         
, calendar_name         VARCHAR2(10)   constraint nn_calendar_2 NOT NULL
, calendar_short_name   VARCHAR2(3)    constraint nn_calendar_3 NOT NULL
, start_date            DATE           constraint nn_calendar_4 NOT NULL
, end_date              DATE           constraint nn_calendar_5 NOT NULL
, created_by            NUMBER         constraint nn_calendar_6 NOT NULL
, creation_date         DATE           constraint nn_calendar_7 NOT NULL
, last_updated_by       NUMBER         constraint nn_calendar_8 NOT NULL
, last_update_date      DATE           constraint nn_calendar_9 NOT NULL
, constraint pk_calendar_1 PRIMARY KEY(calendar_id)
, constraint fk_calendar_1 FOREIGN KEY(created_by) references system_user(system_user_id)
, constraint fk_calendar_2 FOREIGN KEY(last_updated_by) references system_user(system_user_id));

CREATE SEQUENCE calendar_s1 START WITH 1;


--STEP 2

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'January', 'JAN', '01-JAN-2009', '31-JAN-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'February', 'FEB', '01-FEB-2009', '28-FEB-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'March', 'MAR', '01-MAR-2009', '31-MAR-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'April', 'APR', '01-APR-2009', '30-MAR-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'May', 'MAY', '01-MAY-2009', '31-MAY-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'June', 'JUN', '01-JUN-2009', '30-JUN-2009', 1, SYSDATE, 1, SYSDATE);
 
 INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'July', 'JUL', '01-JUL-2009', '31-JUL-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'August', 'AUG', '01-AUG-2009', '31-AUG-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'September', 'SEP', '01-SEP-2009', '30-SEP-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'October', 'OCT', '01-OCT-2009', '31-OCT-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'November', 'NOV', '01-NOV-2009', '30-NOV-2009', 1, SYSDATE, 1, SYSDATE);

INSERT INTO calendar VALUES
( calendar_s1.NEXTVAL, 'December', 'DEC', '01-DEC-2009', '31-DEC-2009', 1, SYSDATE, 1, SYSDATE);

-- Query the data insert.
COL calendar_name        FORMAT A10  HEADING "Calendar|Name"
COL calendar_short_name  FORMAT A8  HEADING "Calendar|Short|Name"
COL start_date           FORMAT A9   HEADING "Start|Date"
COL end_date             FORMAT A9   HEADING "End|Date"
SELECT   calendar_name
,        calendar_short_name
,        start_date
,        end_date
FROM     calendar;

--STEP 3

@transaction_upload3.sql



INSERT INTO transaction
    SELECT   transaction_s1.NEXTVAL AS transaction_id
           , transaction_account
           , transaction_type
           , transaction_date
           , transaction_amount
           , rental_id
           , payment_method_type
           , payment_account_number
           , (SELECT   system_user_id
              FROM     system_user
              WHERE    system_user_name = 'SYSADMIN') AS created_by
           , creation_date
           , (SELECT   system_user_id
              FROM     system_user
              WHERE    system_user_name = 'SYSADMIN') AS last_updated_by
           , last_update_date
     FROM transaction_reversal;

 
COLUMN "Debit Transactions"  FORMAT A20
COLUMN "Credit Transactions" FORMAT A20
COLUMN "All Transactions"    FORMAT A20
 
-- Check current contents of the model.
SELECT 'SELECT record counts' AS "Statement" FROM dual;
SELECT   LPAD(TO_CHAR(c1.transaction_count,'99,999'),19,' ') AS "Debit Transactions"
,        LPAD(TO_CHAR(c2.transaction_count,'99,999'),19,' ') AS "Credit Transactions"
,        LPAD(TO_CHAR(c3.transaction_count,'99,999'),19,' ') AS "All Transactions"
FROM    (SELECT COUNT(*) AS transaction_count FROM transaction WHERE transaction_account = '111-111-111-111') c1 CROSS JOIN
        (SELECT COUNT(*) AS transaction_count FROM transaction WHERE transaction_account = '222-222-222-222') c2 CROSS JOIN
        (SELECT COUNT(*) AS transaction_count FROM transaction) c3;

--STEP 4
SET LINESIZE 200


SELECT  il.transaction_account AS TRANSACTION
,       il.JANUARY
,       il.FEBRUARY
,       il.MARCH
,       il.FQ1
,       il.APRIL
,       il.MAY
,       il.JUNE
,       il.FQ2
,       il.JULY
,       il.AUGUST
,       il.SEPTEMBER
,       il.FQ3
,       il.OCTOBER
,       il.NOVEMBER
,       il.DECEMBER
,       il.FQ4
,       il.YTD
FROM(
SELECT   CASE
           WHEN t.transaction_account = '111-111-111-111' THEN 'Debit'
           WHEN t.transaction_account = '222-222-222-222' THEN 'Credit'
         END AS "TRANSACTION_ACCOUNT"
,        CASE
           WHEN t.transaction_account = '111-111-111-111' THEN 1
           WHEN t.transaction_account = '222-222-222-222' THEN 2
         END AS "SORTKEY"
,        LPAD(TO_CHAR
        (SUM(CASE
               WHEN EXTRACT(MONTH FROM transaction_date) = 1 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END          
             END),'99,999.00'),10,' ') AS "JANUARY"
,        LPAD(TO_CHAR
        (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 2 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "FEBRUARY"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 3 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "MARCH"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) IN(1,2,3) AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "FQ1"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 4 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "APRIL"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 5 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "MAY"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 6 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "JUNE"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) IN(4,5,6) AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "FQ2"             
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 7 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "JULY"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 8 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "AUGUST"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 9 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "SEPTEMBER"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) IN(7,8,9) AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "FQ3"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 10 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "OCTOBER"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 11 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "NOVEMBER"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) = 12 AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "DECEMBER"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(MONTH FROM transaction_date) IN(10,11,12) AND
                    EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "FQ4"
,         LPAD(TO_CHAR
         (SUM(CASE
              WHEN EXTRACT(YEAR FROM transaction_date) = 2009 THEN
                 CASE
                   WHEN cl.common_lookup_type = 'DEBIT'
                   THEN t.transaction_amount
                   ELSE t.transaction_amount * -1
                 END
             END),'99,999.00'),10,' ') AS "YTD"
            
             
FROM     transaction t INNER JOIN common_lookup cl
ON       t.transaction_type = cl.common_lookup_id 
WHERE    cl.common_lookup_table = 'TRANSACTION'
AND      cl.common_lookup_column = 'TRANSACTION_TYPE'

GROUP BY CASE
           WHEN t.transaction_account = '111-111-111-111' THEN 'Debit'
           WHEN t.transaction_account = '222-222-222-222' THEN 'Credit'
         END 
,        CASE
           WHEN t.transaction_account = '111-111-111-111' THEN 1
           WHEN t.transaction_account = '222-222-222-222' THEN 2
         END

ORDER BY SORTKEY) il;

SPOOL OFF
