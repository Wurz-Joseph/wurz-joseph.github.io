/*
||  Name:          Joseph Wurz
||  Date:          14 June 2019
||  Purpose:       Complete 325 Chapter 9 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

-- Open log file.

@/home/student/Data/cit325/lab7/apply_plsql_lab7.sql

SET SERVEROUTPUT ON SIZE UNLIMITED
SET VERIFY OFF

SPOOL apply_plsql_lab8.txt

CREATE OR REPLACE PACKAGE contact_package IS

PROCEDURE insert_contact
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
, PV_USER_NAME           VARCHAR2);

PROCEDURE insert_contact
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
, PV_USER_ID             NUMBER  := NULL);

END contact_package;
/

DELETE FROM system_user
WHERE system_user_name IN ('BONDSB','CURRYW','ANONYMOUS');

/*Insert row for Barry Bonds*/
INSERT INTO system_user
VALUES
( 6
, 'BONDSB'
, 1
,(SELECT common_lookup_id
  FROM   common_lookup
  WHERE  common_lookup_table = 'SYSTEM_USER'
  AND    common_lookup_column= 'SYSTEM_USER_TYPE'
  AND    common_lookup_type = 'DBA')
, 'Bonds'
, 'Barry'
, 'L'
, 1
, SYSDATE
, 1
, SYSDATE);

/*Insert row for Wardell Curry*/
INSERT INTO system_user
VALUES
( 7
, 'CURRYW'
, 1
,(SELECT common_lookup_id
  FROM   common_lookup
  WHERE  common_lookup_table = 'SYSTEM_USER'
  AND    common_lookup_column= 'SYSTEM_USER_TYPE'
  AND    common_lookup_type = 'DBA')
, 'Curry'
, 'Wardell'
, 'S'
, 1
, SYSDATE
, 1
, SYSDATE);

/*Insert row for Anonymous*/
INSERT INTO system_user
VALUES
( -1
, 'ANONYMOUS'
, 1
,(SELECT common_lookup_id
  FROM   common_lookup
  WHERE  common_lookup_table = 'SYSTEM_USER'
  AND    common_lookup_column= 'SYSTEM_USER_TYPE'
  AND    common_lookup_type = 'DBA')
, NULL
, NULL
, NULL
, 1
, SYSDATE
, 1
, SYSDATE);

--------------------
/*VERIFY INSERTS*/
--------------------
COL system_user_id  FORMAT 9999  HEADING "System|User ID"
COL system_user_name FORMAT A12  HEADING "System|User Name"
COL first_name       FORMAT A10  HEADING "First|Name"
COL middle_initial   FORMAT A2   HEADING "MI"
COL last_name        FORMAT A10  HeADING "Last|Name"
SELECT system_user_id
,      system_user_name
,      first_name
,      middle_initial
,      last_name
FROM   system_user
WHERE  last_name IN ('Bonds','Curry')
OR     system_user_name = 'ANONYMOUS';



CREATE OR REPLACE PACKAGE BODY contact_package IS
   
  PROCEDURE insert_contact
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
  
    /*DATE constant*/
    lv_creation_date       DATE := SYSDATE;
    
    /*Declare a who-audit ID variable*/
    lv_created_by          NUMBER;

      /* Declare type variables*/
    lv_member_id           NUMBER;
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
    
    /*Declare a local cursor to verify a member*/
    CURSOR get_member
    ( cv_account_number  VARCHAR2 ) IS
     SELECT m.member_id
     FROM   member m
     WHERE  m.account_number = cv_account_number;
     
  
  
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
   
   /*Open get_member cursor.*/
   OPEN get_member(pv_account_number);
   FETCH get_member INTO lv_member_id;
   
   /*Insert a row when one doesn't exist*/
   IF get_member%NOTFOUND THEN
   
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
   
   END IF;

   
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
       ROLLBACK TO start_point;
   END insert_contact;

  PROCEDURE insert_contact
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
  , PV_USER_ID             NUMBER  := NULL) IS

  /*DATE constant*/
    lv_creation_date       DATE := SYSDATE;
    
    /*Declare a who-audit ID variable*/
    lv_created_by          NUMBER := NVL(PV_USER_ID,-1);

      /* Declare type variables*/
    lv_member_id           NUMBER;
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
  
   /*Declare a local cursor to verify a member*/
    CURSOR get_member
    ( cv_account_number  VARCHAR2 ) IS
     SELECT m.member_id
     FROM   member m
     WHERE  m.account_number = cv_account_number;
     
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
 
    /*Set save point*/
   SAVEPOINT start_point;
   
   /*Open get_member cursor.*/
    OPEN get_member(pv_account_number);
    FETCH get_member INTO lv_member_id;
    
    IF get_member%NOTFOUND THEN
   
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
   
   END IF;
   /*close get_member cursor*/
   CLOSE get_member;
   
   
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
       ROLLBACK TO start_point;
   END insert_contact;

END contact_package;
/
LIST
SHOW ERRORS


SPOOL apply_plsql_lab8.txt

BEGIN
  contact_package.insert_contact(
    pv_first_name => 'Charlie'
  , pv_middle_name => null
  , pv_last_name => 'Brown'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000011'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME'
  , pv_user_name => 'DBA 3' );
END;
/

BEGIN
  contact_package.insert_contact(
    pv_first_name => 'Pepermint'
  , pv_middle_name => null
  , pv_last_name => 'Patty'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000011'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME'
  , pv_user_id => null );
END;
/

BEGIN
  contact_package.insert_contact(
    pv_first_name => 'Sally'
  , pv_middle_name => null
  , pv_last_name => 'Brown'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000011'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME'
  , pv_user_id => 6 );
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
WHERE  c.last_name IN ('Brown','Patty');

SPOOL OFF

--STEP 3


CREATE OR REPLACE PACKAGE contact_package IS

FUNCTION insert_contact  
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
, PV_USER_NAME           VARCHAR2) RETURN NUMBER;

FUNCTION insert_contact 
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
, PV_USER_ID             NUMBER := null ) RETURN NUMBER;

END contact_package;
/

CREATE OR REPLACE PACKAGE BODY contact_package IS
   
  FUNCTION insert_contact  
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
  
    /*DATE constant*/
    lv_creation_date       DATE := SYSDATE;
    
    /*Declare a who-audit ID variable*/
    lv_created_by          NUMBER;

      /* Declare type variables*/
    lv_member_id           NUMBER;
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
    
    /*Declare a local cursor to verify a member*/
    CURSOR get_member
    ( cv_account_number  VARCHAR2 ) IS
     SELECT m.member_id
     FROM   member m
     WHERE  m.account_number = cv_account_number;
     
  
  
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
   
   /*Open get_member cursor.*/
   OPEN get_member(pv_account_number);
   FETCH get_member INTO lv_member_id;
   
   /*Insert a row when one doesn't exist*/
   IF get_member%NOTFOUND THEN
   
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
   
   END IF;

   
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
   
   RETURN 0;
   COMMIT;
   
   
   EXCEPTION 
     WHEN OTHERS THEN
       RETURN 1;
       ROLLBACK TO start_point;
   END insert_contact;

  FUNCTION insert_contact 
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
  , PV_USER_ID             NUMBER := null) RETURN NUMBER IS

  /*DATE constant*/
    lv_creation_date       DATE := SYSDATE;
    
    /*Declare a who-audit ID variable*/
    lv_created_by          NUMBER := NVL(PV_USER_ID,-1);

      /* Declare type variables*/
    lv_member_id           NUMBER;
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
  
   /*Declare a local cursor to verify a member*/
    CURSOR get_member
    ( cv_account_number  VARCHAR2 ) IS
     SELECT m.member_id
     FROM   member m
     WHERE  m.account_number = cv_account_number;
     
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
 
    /*Set save point*/
   SAVEPOINT start_point;
   
   /*Open get_member cursor.*/
    OPEN get_member(pv_account_number);
    FETCH get_member INTO lv_member_id;
    
    IF get_member%NOTFOUND THEN
   
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
   
   END IF;
   /*close get_member cursor*/
   CLOSE get_member;
   
   
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
   
   RETURN 0;
   
   COMMIT;
   
   
   EXCEPTION 
     WHEN OTHERS THEN
       RETURN 1;
       ROLLBACK TO start_point;
   END insert_contact;

END contact_package;
/
LIST
SHOW ERRORS

SPOOL apply_plsql_lab8.txt append;

BEGIN
  IF contact_package.insert_contact(
    pv_first_name => 'Shirley'
  , pv_middle_name => null
  , pv_last_name => 'Partridge'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000012'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '8888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME'
  , pv_user_name => 'DBA 3' ) = 1 THEN
  
  DBMS_OUTPUT.PUT_LINE('Insert successfull');
  END IF;
END;
/

BEGIN
  IF contact_package.insert_contact(
    pv_first_name => 'Keith'
  , pv_middle_name => null
  , pv_last_name => 'Partridge'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000012'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '8888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME'
  , pv_user_id => 6 ) = 1 THEN
  
  DBMS_OUTPUT.PUT_LINE('Insert successfull');
  END IF;
END;
/

BEGIN
  IF contact_package.insert_contact(
    pv_first_name => 'Laurie'
  , pv_middle_name => null
  , pv_last_name => 'Partridge'
  , pv_contact_type => 'CUSTOMER'
  , pv_account_number => 'SLC-000012'
  , pv_member_type => 'GROUP'
  , pv_credit_card_number => '8888-6666-8888-4444'
  , pv_credit_card_type => 'VISA_CARD'
  , pv_city => 'Lehi'
  , pv_state_province => 'Utah'
  , pv_postal_code => '84043'
  , pv_address_type => 'HOME'
  , pv_country_code => '001'
  , pv_area_code => '207'
  , pv_telephone_number => '877-4321'
  , pv_telephone_type => 'HOME' 
  , pv_user_id => -1 ) = 1 THEN 
  
   DBMS_OUTPUT.PUT_LINE('Insert successfull');
   END IF;
END;
/


COL full_name      FORMAT A18   HEADING "Full Name"
COL created_by     FORMAT 9999  HEADING "System|User ID"
COL account_number FORMAT A12   HEADING "Account|Number"
COL address        FORMAT A16   HEADING "Address"
COL telephone      FORMAT A16   HEADING "Telephone"
SELECT c.first_name
||     CASE
         WHEN c.middle_name IS NOT NULL THEN ' '||c.middle_name||' ' ELSE ' '
       END
||     c.last_name AS full_name
,      c.created_by
,      m.account_number
,      a.city || ', ' || a.state_province AS address
,      '(' || t.area_code || ') ' || t.telephone_number AS telephone
FROM   member m INNER JOIN contact c
ON     m.member_id = c.member_id INNER JOIN address a
ON     c.contact_id = a.contact_id INNER JOIN telephone t
ON     c.contact_id = t.contact_id
AND    a.address_id = t.address_id
WHERE  c.last_name = 'Partridge';

SPOOL OFF
