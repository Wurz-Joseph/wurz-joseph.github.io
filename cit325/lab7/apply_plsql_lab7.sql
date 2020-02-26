/*
||  Name:          Joseph Wurz
||  Date:          6/8/2019
||  Purpose:       Complete 325 Chapter 8 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

@/home/student/Data/cit325/lib/cleanup_oracle.sql
@/home/student/Data/cit325/lib/Oracle12cPLSQLCode/Introduction/create_video_store.sql

SET SERVEROUTPUT ON SIZE UNLIMITED
SET VERIFY OFF


-- Open log file.
SPOOL apply_plsql_lab7.txt

--STEP 0
SELECT system_user_id
,      system_user_name
FROM   system_user
WHERE  system_user_name = 'DBA';

UPDATE system_user
SET    system_user_name = 'DBA'
WHERE  system_user_name LIKE 'DBA%';

DECLARE
  /* Create a local counter variable. */
  lv_counter  NUMBER := 2;

  /* Create a collection of two-character strings. */
  TYPE numbers IS TABLE OF NUMBER;

  /* Create a variable of the roman_numbers collection. */
  lv_numbers  NUMBERS := numbers(1,2,3,4);

BEGIN
  /* Update the system_user names to make them unique. */
  FOR i IN 1..lv_numbers.COUNT LOOP
    /* Update the system_user table. */
    UPDATE system_user
    SET    system_user_name = system_user_name || ' ' || lv_numbers(i)
    WHERE  system_user_id = lv_counter;

    /* Increment the counter. */
    lv_counter := lv_counter + 1;
  END LOOP;
END;
/

SELECT system_user_id
,      system_user_name
FROM   system_user
WHERE  system_user_name LIKE 'DBA%';

BEGIN
  FOR i IN (SELECT uo.object_type
            ,      uo.object_name
            FROM   user_objects uo
            WHERE  uo.object_name = 'INSERT_CONTACT') LOOP
    EXECUTE IMMEDIATE 'DROP ' || i.object_type || ' ' || i.object_name;
  END LOOP;
END;
/

--STEP 1
CREATE OR REPLACE PROCEDURE insert_contact
( PV_FIRST_NAME          VARCHAR2
, PV_MIDDLE_NAME         VARCHAR2
, PV_LAST_NAME           VARCHAR2
, PV_CONTACT_TYPE        VARCHAR2
, PV_ACCOUNT_NUMBER      VARCHAR2
, PV_MEMBER_TYPE         VARCHAR2
, PV_CREDIT_CARD_NUMBER  VARCHAR2
, PV_CREDIT_CARD_TYPE    VARCHAR2
, PV_CITY                VARCHAR2
, PV_STATE_PROVINCE      VARCHAR2
, PV_POSTAL_CODE         VARCHAR2
, PV_ADDRESS_TYPE        VARCHAR2
, PV_COUNTRY_CODE        VARCHAR2
, PV_AREA_CODE           VARCHAR2
, PV_TELEPHONE_NUMBER    VARCHAR2
, PV_TELEPHONE_TYPE      VARCHAR2
, PV_USER_NAME           VARCHAR2) IS

  /*Declare a precompiler instruction.*/

---STEP 2--  
  PRAGMA AUTONOMOUS_TRANSACTION;
---------  
  /*Date Constant*/
  lv_creation_date      DATE := SYSDATE;
  
  /*Declare a who-audit ID variable*/
  lv_created_by         NUMBER;
  
  /* Declare type variables*/
  lv_member_type         NUMBER;
  lv_credit_card_type    NUMBER;
  lv_contact_type        NUMBER;
  lv_address_type        NUMBER;
  lv_telephone_type      NUMBER;
 
  
  /*Declare a local cursor. */ 
  Cursor get_lookup_type
  ( cv_table_name       VARCHAR2
  , cv_column_name      VARCHAR2
  , cv_type_name        VARCHAR2 ) IS
  SELECT common_lookup_id
  FROM   common_lookup
  WHERE  common_lookup_table = cv_table_name
  AND    common_lookup_column = cv_column_name
  AND    common_lookup_type = cv_type_name;
  
  
BEGIN
 /*Get the member_type ID value.*/
   FOR i IN get_lookup_type('MEMBER','MEMBER_TYPE',pv_member_type) LOOP
      lv_member_type := i.common_lookup_id;
   END LOOP;
   
   
   /*Get the credit_card_type ID value.*/
   FOR i IN get_lookup_type('MEMBER','CREDIT_CARD_TYPE',pv_credit_card_type) LOOP
      lv_credit_card_type := i.common_lookup_id;
   END LOOP;
   
   
   /*Get the contact_type ID value.*/
   FOR i IN get_lookup_type('CONTACT','CONTACT_TYPE',pv_contact_type) LOOP
      lv_contact_type := i.common_lookup_id;
   END LOOP;
   
   
      /*Get the address_type ID value.*/
   FOR i IN get_lookup_type('ADDRESS','ADDRESS_TYPE',pv_address_type) LOOP
      lv_address_type := i.common_lookup_id;
   END LOOP;
   
   
      /*Get the telephone_type ID value.*/
   FOR i IN get_lookup_type('TELEPHONE','TELEPHONE_TYPE',pv_telephone_type) LOOP
      lv_telephone_type := i.common_lookup_id;
   END LOOP;
   
   /*Get the system user id value */
   SELECT system_user_id
   INTO lv_created_by
   FROM system_user
   WHERE system_user_name = pv_user_name;
   
   /*Set save point*/
   SAVEPOINT start_point;
   
   /*Insert into member table.*/
   INSERT INTO member
   ( member_id
   , member_type
   , account_number
   , credit_card_number
   , credit_card_type
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date )
   VALUES
   ( member_s1.NEXTVAL
   , lv_member_type
   , pv_account_number
   , pv_credit_card_number
   , lv_credit_card_type
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   /*Insert into contact table.*/
   INSERT INTO contact
   ( contact_id
   , member_id
   , contact_type
   , first_name
   , middle_name
   , last_name
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( contact_s1.NEXTVAL
   , member_s1.CURRVAL
   , lv_contact_type
   , pv_first_name
   , pv_middle_name
   , pv_last_name
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   
   /*Insert into address table.*/
   INSERT INTO address
   ( address_id
   , contact_id
   , address_type
   , city
   , state_province
   , postal_code
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( address_s1.NEXTVAL
   , contact_s1.CURRVAL
   , lv_address_type
   , pv_city
   , pv_state_province
   , pv_postal_code
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   /*Insert into telephone table.*/
   INSERT INTO telephone
   ( telephone_id
   , contact_id
   , address_id
   , telephone_type
   , country_code
   , area_code
   , telephone_number
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( telephone_s1.NEXTVAL                              
   , contact_s1.CURRVAL                                
   , address_s1.CURRVAL                                
   , lv_telephone_type
   , pv_country_code                                   
   , pv_area_code                                      
   , pv_telephone_number                               
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   
   COMMIT;
EXCEPTION 
  WHEN OTHERS THEN
    ROLLBACK TO starting_point;
END;
/
  
BEGIN 
insert_contact
( 'Charles'
,'Francis'
,'Xavier'
,'CUSTOMER'
,'SLC-000008'
,'INDIVIDUAL'
,'7777-6666-5555-4444'
,'DISCOVER_CARD'
,'Milbridge'
,'Maine'
,'04658'
,'HOME'
,'001'
,'207'
,'111-1234'
,'HOME'
,'DBA 2');
END;
/



COL full_name      FORMAT A24
COL account_number FORMAT A10 HEADING "ACCOUNT|NUMBER"
COL address        FORMAT A22
COL telephone      FORMAT A14

SELECT c.first_name
||     CASE
         WHEN c.middle_name IS NOT NULL THEN ' '||c.middle_name||' ' ELSE ' '
       END
||     c.last_name AS full_name
,      m.account_number
,      a.city || ', ' || a.state_province AS address
,      '(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM   member m INNER JOIN contact c
ON     m.member_id = c.member_id INNER JOIN address a
ON     c.contact_id = a.contact_id INNER JOIN telephone t
ON     c.contact_id = t.contact_id
AND    a.address_id = t.address_id
WHERE  c.last_name = 'Xavier';



BEGIN 
insert_contact
('Maura'
,'Jane'
,'Haggerty'
,'CUSTOMER'
,'SLC-000009'
,'INDIVIDUAL'
,'8888-7777-6666-5555'
,'MASTER_CARD'
,'Bangor'
,'Maine'
,'04401'
,'HOME'
,'001'
,'207'
,'111-1234'
,'HOME'
,'DBA 2');
END;
/

COL full_name      FORMAT A24
COL account_number FORMAT A10 HEADING "ACCOUNT|NUMBER"
COL address        FORMAT A22
COL telephone      FORMAT A14

SELECT c.first_name
||     CASE
         WHEN c.middle_name IS NOT NULL THEN ' '||c.middle_name||' ' ELSE ' '
       END
||     c.last_name AS full_name
,      m.account_number
,      a.city || ', ' || a.state_province AS address
,      '(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM   member m INNER JOIN contact c
ON     m.member_id = c.member_id INNER JOIN address a
ON     c.contact_id = a.contact_id INNER JOIN telephone t
ON     c.contact_id = t.contact_id
AND    a.address_id = t.address_id
WHERE  c.last_name = 'Haggerty';


--STEP 3

DROP PROCEDURE insert_contact;

CREATE OR REPLACE FUNCTION insert_contact
( PV_FIRST_NAME          VARCHAR2
, PV_MIDDLE_NAME         VARCHAR2
, PV_LAST_NAME           VARCHAR2
, PV_CONTACT_TYPE        VARCHAR2
, PV_ACCOUNT_NUMBER      VARCHAR2
, PV_MEMBER_TYPE         VARCHAR2
, PV_CREDIT_CARD_NUMBER  VARCHAR2
, PV_CREDIT_CARD_TYPE    VARCHAR2
, PV_CITY                VARCHAR2
, PV_STATE_PROVINCE      VARCHAR2
, PV_POSTAL_CODE         VARCHAR2
, PV_ADDRESS_TYPE        VARCHAR2
, PV_COUNTRY_CODE        VARCHAR2
, PV_AREA_CODE           VARCHAR2
, PV_TELEPHONE_NUMBER    VARCHAR2
, PV_TELEPHONE_TYPE      VARCHAR2
, PV_USER_NAME           VARCHAR2) RETURN NUMBER IS


  /*Date Constant*/
  lv_creation_date      DATE := SYSDATE;
  
  /*Declare a who-audit ID variable*/
  lv_created_by         NUMBER;
  
  /* Declare type variables*/
  lv_member_type         NUMBER;
  lv_credit_card_type    NUMBER;
  lv_contact_type        NUMBER;
  lv_address_type        NUMBER;
  lv_telephone_type      NUMBER;
  
  /*Declare a return type. */
  lv_return_value        NUMBER:= 0;
  
  /*Declare a local cursor. */ 
  Cursor get_lookup_type
  ( cv_table_name       VARCHAR2
  , cv_column_name      VARCHAR2
  , cv_type_name        VARCHAR2 ) IS
  SELECT common_lookup_id
  FROM   common_lookup
  WHERE  common_lookup_table = cv_table_name
  AND    common_lookup_column = cv_column_name
  AND    common_lookup_type = cv_type_name;
  
  /*Declare a precompiler instruction.*/
  PRAGMA AUTONOMOUS_TRANSACTION;
  
BEGIN
 /*Get the member_type ID value.*/
   FOR i IN get_lookup_type('MEMBER','MEMBER_TYPE',pv_member_type) LOOP
      lv_member_type := i.common_lookup_id;
   END LOOP;
   
   
   /*Get the credit_card_type ID value.*/
   FOR i IN get_lookup_type('MEMBER','CREDIT_CARD_TYPE',pv_credit_card_type) LOOP
      lv_credit_card_type := i.common_lookup_id;
   END LOOP;
   
   
   /*Get the contact_type ID value.*/
   FOR i IN get_lookup_type('CONTACT','CONTACT_TYPE',pv_contact_type) LOOP
      lv_contact_type := i.common_lookup_id;
   END LOOP;
   
   
      /*Get the address_type ID value.*/
   FOR i IN get_lookup_type('ADDRESS','ADDRESS_TYPE',pv_address_type) LOOP
      lv_address_type := i.common_lookup_id;
   END LOOP;
   
   
      /*Get the telephone_type ID value.*/
   FOR i IN get_lookup_type('TELEPHONE','TELEPHONE_TYPE',pv_telephone_type) LOOP
      lv_telephone_type := i.common_lookup_id;
   END LOOP;
   
   /*Get the system user id value */
   SELECT system_user_id
   INTO lv_created_by
   FROM system_user
   WHERE system_user_name = pv_user_name;
   
   /*Set save point*/
   SAVEPOINT start_point;
   
   /*Insert into member table.*/
   INSERT INTO member
   ( member_id
   , member_type
   , account_number
   , credit_card_number
   , credit_card_type
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date )
   VALUES
   ( member_s1.NEXTVAL
   , lv_member_type
   , pv_account_number
   , pv_credit_card_number
   , lv_credit_card_type
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   /*Insert into contact table.*/
   INSERT INTO contact
   ( contact_id
   , member_id
   , contact_type
   , first_name
   , middle_name
   , last_name
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( contact_s1.NEXTVAL
   , member_s1.CURRVAL
   , lv_contact_type
   , pv_first_name
   , pv_middle_name
   , pv_last_name
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   
   /*Insert into address table.*/
   INSERT INTO address
   ( address_id
   , contact_id
   , address_type
   , city
   , state_province
   , postal_code
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( address_s1.NEXTVAL
   , contact_s1.CURRVAL
   , lv_address_type
   , pv_city
   , pv_state_province
   , pv_postal_code
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
   
   /*Insert into telephone table.*/
   INSERT INTO telephone
   ( telephone_id
   , contact_id
   , address_id
   , telephone_type
   , country_code
   , area_code
   , telephone_number
   , created_by
   , creation_date
   , last_updated_by
   , last_update_date)
   VALUES
   ( telephone_s1.NEXTVAL                              
   , contact_s1.CURRVAL                                
   , address_s1.CURRVAL                                
   , lv_telephone_type
   , pv_country_code                                   
   , pv_area_code                                      
   , pv_telephone_number                               
   , lv_created_by
   , lv_creation_date
   , lv_created_by
   , lv_creation_date );
  
  COMMIT; 
   
  RETURN lv_return_value;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK TO start_point;
    lv_return_value := 1;
    RETURN lv_return_value;
END insert_contact;
/

LIST
SHOW ERRORS

BEGIN
  /*Call function*/
  IF insert_contact
    ('Hariet'
    ,'Mary'
    ,'McDonnell'
    ,'CUSTOMER'
    ,'SLC-000010'
    ,'INDIVIDUAL'
    ,'9999-8888-7777-6666'
    ,'VISA_CARD'
    ,'Orono'
    ,'Maine'
    ,'04469'
    ,'HOME'
    ,'001'
    ,'207'
    ,'111-1234'
    ,'HOME'
    ,'DBA 2'
    ) = 0 THEN
      dbms_output.put_line('Success!');
    ELSE
      dbms_output.put_line('Failure');
    END IF;
END;
/
   
--STEP 4

CREATE OR REPLACE TYPE contact_obj IS OBJECT
( first_name      VARCHAR2(20)
, middle_name     VARCHAR2(20)
, last_name       VARCHAR2(20));
/
CREATE OR REPLACE TYPE contact_tab IS TABLE OF contact_obj;
/
CREATE OR REPLACE FUNCTION get_contact RETURN contact_tab IS
  lv_contact_tab CONTACT_TAB := contact_tab();
  
  
  CURSOR c IS
   SELECT c.first_name
   ,      c.middle_name
   ,      c.last_name
   FROM contact c;
   
BEGIN
  For i IN c LOOP
    lv_contact_tab.EXTEND;
    lv_contact_tab(lv_contact_tab.COUNT) := contact_obj(i.first_name, i.middle_name, i.last_name);
  END LOOP;
  RETURN lv_contact_tab;
  
EXCEPTION 
  WHEN OTHERS THEN
    ROLLBACK TO start_point;
END get_contact;
/


 
SET PAGESIZE 999
COL full_name FORMAT A24
SELECT first_name || CASE
                       WHEN middle_name IS NOT NULL
                       THEN ' ' || middle_name || ' '
                       ELSE ' '
                     END || last_name AS full_name
FROM   TABLE(get_contact);



-- Close log file.
SPOOL OFF
