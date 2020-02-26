-- ------------------------------------------------------------------
--  Program Name:   apply_oracle_lab3.sql
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
--   sql> @apply_oracle_lab3.sql
--
-- ------------------------------------------------------------------

-- Run the prior lab script.
@/home/student/Data/cit225/oracle/lib1/utility/cleanup_oracle.sql
@/home/student/Data/cit225/oracle/lib1/create/create_oracle_store2.sql
@/home/student/Data/cit225/oracle/lib1/preseed/preseed_oracle_store.sql
@/home/student/Data/cit225/oracle/lab2/my_apply_oracle_lab2.sql

 
-- ... insert calls to other code script files here ...
 
SPOOL /home/student/Data/cit225/oracle/lab3/apply_oracle_lab3.txt
 
-- ... insert lab 3 commands here ...
alter table "STUDENT"."SYSTEM_USER_LAB" disable  constraint "FK_SYSTEM_USER_LAB_3";
alter table "STUDENT"."SYSTEM_USER_LAB" disable  constraint "FK_SYSTEM_USER_LAB_4";

alter table "STUDENT"."SYSTEM_USER_LAB" drop constraint "NN_SYSTEM_USER_LAB_2";
alter table "STUDENT"."SYSTEM_USER_LAB" drop constraint "NN_SYSTEM_USER_LAB_3";

INSERT INTO "STUDENT"."SYSTEM_USER_LAB" (SYSTEM_USER_LAB_ID, SYSTEM_USER_NAME, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1', 'SYSADMIN', '1', SYSDATE,'1', SYSDATE);

alter table "STUDENT"."COMMON_LOOKUP_LAB" disable  constraint "FK_CLOOKUP_1";
alter table "STUDENT"."COMMON_LOOKUP_LAB" disable  constraint "FK_CLOOKUP_2";

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1', 'SYSTEM_USER_LAB', 'SYSTEM_ADMIN', 'System Administrator', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('2', 'SYSTEM_USER_LAB', 'DBA', 'Database Administrator', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('3', 'SYSTEM_USER_LAB', 'SYSTEM_GROUP', 'Database Administrator', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('4', 'SYSTEM_USER_LAB', 'COST_CENTER', 'Database Administrator', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('5', 'SYSTEM_USER_LAB', 'INDIVIDUAL', 'Database Administrator', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1001', 'CONTACT_LAB', 'EMPLOYEE', 'Employee', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1002', 'CONTACT_LAB', 'CUSTOMER', 'Customer', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1003', 'MEMBER_LAB', 'INDIVIDUAL', 'Individual Membership', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1004', 'MEMBER_LAB', 'GROUP', 'Group Membership', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1005', 'MEMBER_LAB', 'DISCOVER_CARD', 'Discover Card', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1006', 'MEMBER_LAB', 'MASTER_CARD', 'Master Card', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1007', 'MEMBER_LAB', 'VISA_CARD', 'Visa Card', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1008', 'MULTIPLE', 'HOME', 'Home', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1009', 'MULTIPLE', 'WORK', 'Work', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1010', 'ITEM_LAB', 'DVD_FULL_SCREEN', 'DVD: Full Screen', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1011', 'ITEM_LAB', 'DVD_WIDE_SCREEN', 'DVD: Wide Screen', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1012', 'ITEM_LAB', 'NINTENDO_GAMECUBE', 'Nintendo Gamecube', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1013', 'ITEM_LAB', 'PLAYSTATION2', 'Playstation 2', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1014', 'ITEM_LAB', 'XBOX', 'XBox', '1', SYSDATE, '1', SYSDATE);

INSERT INTO "STUDENT"."COMMON_LOOKUP_LAB" (COMMON_LOOKUP_LAB_ID, COMMON_LOOKUP_CONTEXT, COMMON_LOOKUP_TYPE, COMMON_LOOKUP_MEANING, CREATED_BY, CREATION_DATE, LAST_UPDATED_BY, LAST_UPDATE_DATE) 
VALUES ('1015', 'ITEM_LAB', 'BLU-RAY', 'Blu-Ray', '1', SYSDATE, '1', SYSDATE);

COL common_lookup_id       FORMAT  9999
COL common_lookup_context  FORMAT A22
COL common_lookup_type     FORMAT A18
SELECT   common_lookup_lab_id
,        common_lookup_context
,        common_lookup_type
FROM     common_lookup_lab;

SELECT common_lookup_lab_id 
FROM COMMON_LOOKUP_LAB 
WHERE common_lookup_context = 'SYSTEM_USER_LAB' 
AND common_lookup_type = 'SYSTEM_GROUP';

SELECT common_lookup_context
FROM COMMON_LOOKUP_LAB
WHERE common_lookup_context = 'SYSTEM_USER_LAB' 
AND common_lookup_type = 'SYSTEM_ADMIN';

UPDATE system_user_lab
SET    system_user_group_id = 
         (SELECT   common_lookup_lab_id
          FROM     common_lookup_lab
          WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
          AND      common_lookup_type = 'SYSTEM_ADMIN')
WHERE  system_user_lab_id = 1;

UPDATE system_user_lab
SET    system_user_type = 
         (SELECT   common_lookup_lab_id
          FROM     common_lookup_lab
          WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
          AND      common_lookup_type = 'SYSTEM_GROUP')
WHERE  system_user_lab_id = 1;

alter table "STUDENT"."COMMON_LOOKUP_LAB" enable  constraint "FK_CLOOKUP_1";
alter table "STUDENT"."COMMON_LOOKUP_LAB" enable  constraint "FK_CLOOKUP_2";

alter table "STUDENT"."SYSTEM_USER_LAB" enable  constraint "FK_SYSTEM_USER_LAB_3";
alter table "STUDENT"."SYSTEM_USER_LAB" enable  constraint "FK_SYSTEM_USER_LAB_4";

ALTER TABLE system_user_lab
  MODIFY (system_user_group_id  NUMBER  CONSTRAINT nn_system_user_lab_2 NOT NULL);

ALTER TABLE system_user_lab
  MODIFY (system_user_type      NUMBER  CONSTRAINT nn_system_user_lab_3 NOT NULL);
  
  
  
INSERT INTO system_user_lab
( system_user_lab_id
, system_user_name
, system_user_group_id
, system_user_type
, first_name
, middle_name
, last_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( system_user_lab_s1.NEXTVAL                        
,'DBA1'                                           
,(SELECT   common_lookup_lab_id
  FROM     common_lookup_lab
  WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
  AND      common_lookup_type = 'DBA')                      
,(SELECT   common_lookup_lab_id
  FROM     common_lookup_lab
  WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
  AND      common_lookup_type = 'SYSTEM_GROUP')  
,'Phineas'
,'Taylor'
,'Barnum'
,(SELECT   system_user_lab_id
  FROM     system_user_lab
  WHERE    system_user_name = 'SYSADMIN')        
, SYSDATE                                         
,(SELECT   system_user_lab_id
  FROM     system_user_lab
  WHERE    system_user_name = 'SYSADMIN')         
, SYSDATE                                         
);  
  



INSERT INTO system_user_lab
( system_user_lab_id
, system_user_name
, system_user_group_id
, system_user_type
, first_name
, last_name
, created_by
, creation_date
, last_updated_by
, last_update_date)
VALUES
( system_user_lab_s1.NEXTVAL                          -- system_user_id
,'DBA2'                                           -- system_user_name
,(SELECT   common_lookup_lab_id
  FROM     common_lookup_lab
  WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
  AND      common_lookup_type = 'DBA')            -- system_user_group_id            
,(SELECT   common_lookup_lab_id
  FROM     common_lookup_lab
  WHERE    common_lookup_context = 'SYSTEM_USER_LAB'
  AND      common_lookup_type = 'SYSTEM_GROUP')   -- system_user_type
,'Phileas'
,'Fogg'
,(SELECT   system_user_lab_id
  FROM     system_user_lab
  WHERE    system_user_name = 'SYSADMIN')         -- created_by
, SYSDATE                                         -- creation_date
,(SELECT   system_user_lab_id
  FROM     system_user_lab
  WHERE    system_user_name = 'SYSADMIN')         -- last_updated_by
, SYSDATE                                         -- last_update_date
);


SET NULL '<Null>'
COL system_user_id        FORMAT  9999
COL system_user_group_id  FORMAT  9999
COL system_user_type      FORMAT  9999
COL system_user_name      FORMAT  A10
COL full_user_name        FORMAT  A30
SELECT   system_user_lab_id
,        system_user_group_id
,        system_user_type
,        system_user_name
,        CASE
           WHEN last_name IS NOT NULL THEN
             last_name || ', ' || first_name || ' ' || middle_name
         END AS full_user_name
FROM     system_user_lab;
  
SPOOL OFF
