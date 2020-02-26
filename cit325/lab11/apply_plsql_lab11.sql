/*
||  Name:          Joseph Wurz
||  Date:          7 July 2019
||  Purpose:       Complete 325 Chapter 12 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/


@/home/student/Data/cit325/lib/cleanup_oracle.sql
@/home/student/Data/cit325/lib/Oracle12cPLSQLCode/Introduction/create_video_store.sql

SPOOL apply_plsql_lab11.txt

--STEP 1--

/*Add text_file_name to item table*/
ALTER TABLE item
ADD text_file_name   VARCHAR2(40);

/*Create logger table*/
CREATE TABLE logger
( logger_id                NUMBER
, old_item_id              NUMBER
, old_item_barcode         VARCHAR2(20)
, old_item_type            NUMBER
, old_item_title           VARCHAR2(60)
, old_item_subtitle        VARCHAR2(60)
, old_item_rating          VARCHAR2(8)
, old_item_rating_agency   VARCHAR2(4)
, old_item_release_date    DATE
, old_created_by           NUMBER
, old_creation_date        DATE
, old_last_updated_by      NUMBER
, old_last_update_date     DATE
, old_text_file_name       VARCHAR2(40)
, new_item_id              NUMBER
, new_item_barcode         VARCHAR2(20)
, new_item_type            NUMBER
, new_item_title           VARCHAR2(60)
, new_item_subtitle        VARCHAR2(60)
, new_item_rating          VARCHAR2(8)
, new_item_rating_agency   VARCHAR2(4)
, new_item_release_date    DATE
, new_created_by           NUMBER
, new_creation_date        DATE
, new_last_updated_by      NUMBER
, new_last_update_date     DATE
, new_text_file_name       VARCHAR2(40)
, CONSTRAINT logger_pk PRIMARY KEY (logger_id));


/*create logger_s sequence*/
CREATE SEQUENCE logger_s;


DECLARE
   CURSOR get_row IS 
     SELECT * FROM item WHERE item_title = 'Brave Heart';
BEGIN
   FOR i IN get_row LOOP
   
   INSERT INTO logger
   VALUES
   ( logger_s.NEXTVAL
   , i.item_id
   , i.item_barcode
   , i.item_type
   , i.item_title
   , i.item_subtitle
   , i.item_rating
   , i.item_rating_agency
   , i.item_release_date
   , i.created_by
   , i.creation_date
   , i.last_updated_by
   , i.last_update_date
   , i.text_file_name
   , i.item_id
   , i.item_barcode
   , i.item_type
   , i.item_title
   , i.item_subtitle
   , i.item_rating
   , i.item_rating_agency
   , i.item_release_date
   , i.created_by
   , i.creation_date
   , i.last_updated_by
   , i.last_update_date
   , i.text_file_name);
   
   END LOOP;
END;
/

/* Query the logger table. */
COL logger_id       FORMAT 9999 HEADING "Logger|ID #"
COL old_item_id     FORMAT 9999 HEADING "Old|Item|ID #"
COL old_item_title  FORMAT A20  HEADING "Old Item Title"
COL new_item_id     FORMAT 9999 HEADING "New|Item|ID #"
COL new_item_title  FORMAT A30  HEADING "New Item Title"
SELECT l.logger_id
,      l.old_item_id
,      l.old_item_title
,      l.new_item_id
,      l.new_item_title
FROM   logger l;


--STEP 2--

/*create manage_item package*/
CREATE OR REPLACE PACKAGE manage_item IS 

/*Overloaded item_insert procedures*/
PROCEDURE item_insert
( pv_new_item_id            NUMBER
, pv_new_item_barcode       VARCHAR2
, pv_new_item_type          NUMBER
, pv_new_item_title         VARCHAR2
, pv_new_item_subtitle      VARCHAR2
, pv_new_item_rating        VARCHAR2
, pv_new_item_rating_agency VARCHAR2
, pv_new_item_release_date  DATE
, pv_new_created_by         NUMBER
, pv_new_creation_date      DATE
, pv_new_last_updated_by    NUMBER
, pv_new_last_update_date   DATE
, pv_new_text_file_name     VARCHAR2);


PROCEDURE item_insert
( pv_old_item_id            NUMBER
, pv_old_item_barcode       VARCHAR2
, pv_old_item_type          NUMBER
, pv_old_item_title         VARCHAR2
, pv_old_item_subtitle      VARCHAR2
, pv_old_item_rating        VARCHAR2
, pv_old_item_rating_agency VARCHAR2
, pv_old_item_release_date  DATE
, pv_old_created_by         NUMBER
, pv_old_creation_date      DATE
, pv_old_last_updated_by    NUMBER
, pv_old_last_update_date   DATE
, pv_old_text_file_name     VARCHAR2
, pv_new_item_id            NUMBER
, pv_new_item_barcode       VARCHAR2
, pv_new_item_type          NUMBER
, pv_new_item_title         VARCHAR2
, pv_new_item_subtitle      VARCHAR2
, pv_new_item_rating        VARCHAR2
, pv_new_item_rating_agency VARCHAR2
, pv_new_item_release_date  VARCHAR2
, pv_new_created_by         NUMBER
, pv_new_creation_date      DATE
, pv_new_last_updated_by    NUMBER
, pv_new_last_update_date   DATE
, pv_new_text_file_name     VARCHAR2);


PROCEDURE item_insert
( pv_old_item_id            NUMBER
, pv_old_item_barcode       VARCHAR2
, pv_old_item_type          NUMBER
, pv_old_item_title         VARCHAR2
, pv_old_item_subtitle      VARCHAR2
, pv_old_item_rating        VARCHAR2
, pv_old_item_rating_agency VARCHAR2
, pv_old_item_release_date  DATE
, pv_old_created_by         NUMBER
, pv_old_creation_date      DATE
, pv_old_last_updated_by    NUMBER
, pv_old_last_update_date   DATE
, pv_old_text_file_name     VARCHAR2);


END manage_item;
/

/*create package body*/
CREATE OR REPLACE PACKAGE BODY manage_item IS

/*insert overloaded item_insert procedure*/
PROCEDURE item_insert
( pv_new_item_id            NUMBER
, pv_new_item_barcode       VARCHAR2
, pv_new_item_type          NUMBER
, pv_new_item_title         VARCHAR2
, pv_new_item_subtitle      VARCHAR2
, pv_new_item_rating        VARCHAR2
, pv_new_item_rating_agency VARCHAR2
, pv_new_item_release_date  DATE
, pv_new_created_by         NUMBER
, pv_new_creation_date      DATE
, pv_new_last_updated_by    NUMBER
, pv_new_last_update_date   DATE
, pv_new_text_file_name     VARCHAR2) IS

    /*set autonomous transaction*/
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 
   manage_item.item_insert(
      pv_old_item_id => null
    , pv_old_item_barcode => null
    , pv_old_item_type => null
    , pv_old_item_title => null
    , pv_old_item_subtitle => null
    , pv_old_item_rating => null
    , pv_old_item_rating_agency => null
    , pv_old_item_release_date => null
    , pv_old_created_by => null
    , pv_old_creation_date => null
    , pv_old_last_updated_by => null
    , pv_old_last_update_date => null
    , pv_old_text_file_name => null
    , pv_new_item_id => pv_new_item_id
    , pv_new_item_barcode => pv_new_item_barcode
    , pv_new_item_type => pv_new_item_type
    , pv_new_item_title => pv_new_item_title
    , pv_new_item_subtitle => pv_new_item_subtitle
    , pv_new_item_rating => pv_new_item_rating
    , pv_new_item_rating_agency => pv_new_item_rating_agency
    , pv_new_item_release_date => pv_new_item_release_date
    , pv_new_created_by => pv_new_created_by
    , pv_new_creation_date => pv_new_creation_date
    , pv_new_last_updated_by => pv_new_last_updated_by
    , pv_new_last_update_date => pv_new_last_update_date
    , pv_new_text_file_name => pv_new_text_file_name);
    
END item_insert;


/*update overloaded item_insert procedure*/
PROCEDURE item_insert
( pv_old_item_id            NUMBER
, pv_old_item_barcode       VARCHAR2
, pv_old_item_type          NUMBER
, pv_old_item_title         VARCHAR2
, pv_old_item_subtitle      VARCHAR2
, pv_old_item_rating        VARCHAR2
, pv_old_item_rating_agency VARCHAR2
, pv_old_item_release_date  DATE
, pv_old_created_by         NUMBER
, pv_old_creation_date      DATE
, pv_old_last_updated_by    NUMBER
, pv_old_last_update_date   DATE
, pv_old_text_file_name     VARCHAR2
, pv_new_item_id            NUMBER
, pv_new_item_barcode       VARCHAR2
, pv_new_item_type          NUMBER
, pv_new_item_title         VARCHAR2
, pv_new_item_subtitle      VARCHAR2
, pv_new_item_rating        VARCHAR2
, pv_new_item_rating_agency VARCHAR2
, pv_new_item_release_date  VARCHAR2
, pv_new_created_by         NUMBER
, pv_new_creation_date      DATE
, pv_new_last_updated_by    NUMBER
, pv_new_last_update_date   DATE
, pv_new_text_file_name     VARCHAR2) IS

     /*local copy of logger_s sequence*/
     lv_logger_id   NUMBER;
     
     /*set autonomous transaction*/
     PRAGMA AUTONOMOUS_TRANSACTION;
     
BEGIN
   /*set sequence value*/
   lv_logger_id := logger_s.NEXTVAL;
   
   /*set savepoint before insert*/
   SAVEPOINT update_stmt;

   INSERT INTO logger
   VALUES
   ( lv_logger_id
   , pv_old_item_id
   , pv_old_item_barcode
   , pv_old_item_type
   , pv_old_item_title
   , pv_old_item_subtitle
   , pv_old_item_rating
   , pv_old_item_rating_agency
   , pv_old_item_release_date
   , pv_old_created_by
   , pv_old_creation_date
   , pv_old_last_updated_by
   , pv_old_last_update_date
   , pv_old_text_file_name
   , pv_new_item_id
   , pv_new_item_barcode
   , pv_new_item_type
   , pv_new_item_title
   , pv_new_item_subtitle
   , pv_new_item_rating
   , pv_new_item_rating_agency
   , pv_new_item_release_date
   , pv_new_created_by
   , pv_new_creation_date
   , pv_new_last_updated_by
   , pv_new_last_update_date
   , pv_new_text_file_name);
   
   COMMIT;
EXCEPTION
   WHEN OTHERS THEN
      ROLLBACK TO update_stmt;
END item_insert;

   
   
/*delete overloaded item insert procedure*/
PROCEDURE item_insert
( pv_old_item_id            NUMBER
, pv_old_item_barcode       VARCHAR2
, pv_old_item_type          NUMBER
, pv_old_item_title         VARCHAR2
, pv_old_item_subtitle      VARCHAR2
, pv_old_item_rating        VARCHAR2
, pv_old_item_rating_agency VARCHAR2
, pv_old_item_release_date  DATE
, pv_old_created_by         NUMBER
, pv_old_creation_date      DATE
, pv_old_last_updated_by    NUMBER
, pv_old_last_update_date   DATE
, pv_old_text_file_name     VARCHAR2) IS



     /*set autonomous transaction*/
     PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN 
   manage_item.item_insert(
       pv_old_item_id => pv_old_item_id
     , pv_old_item_barcode => pv_old_item_barcode
     , pv_old_item_type => pv_old_item_type
     , pv_old_item_title => pv_old_item_title
     , pv_old_item_subtitle => pv_old_item_subtitle
     , pv_old_item_rating => pv_old_item_rating
     , pv_old_item_rating_agency => pv_old_item_rating_agency
     , pv_old_item_release_date => pv_old_item_release_date
     , pv_old_created_by => pv_old_created_by
     , pv_old_creation_date => pv_old_creation_date
     , pv_old_last_updated_by => pv_old_last_updated_by
     , pv_old_last_update_date => pv_old_last_update_date
     , pv_old_text_file_name => pv_old_text_file_name
     , pv_new_item_id => null
     , pv_new_item_barcode => null
     , pv_new_item_type => null
     , pv_new_item_title => null
     , pv_new_item_subtitle => null
     , pv_new_item_rating => null
     , pv_new_item_rating_agency => null
     , pv_new_item_release_date => null
     , pv_new_created_by => null
     , pv_new_creation_date => null
     , pv_new_last_updated_by => null
     , pv_new_last_update_date => null
     , pv_new_text_file_name => null);
     
     
  EXCEPTION
    WHEN OTHERS THEN
      RETURN;
  END item_insert;
END manage_item;
/


DECLARE
  /* Dynamic cursor. */
  CURSOR get_row IS
    SELECT * FROM item WHERE item_title = 'King Arthur';
BEGIN
  /* Read the dynamic cursor. */
  FOR i IN get_row LOOP
    manage_item.item_insert(
      pv_new_item_id => i.item_id
    , pv_new_item_barcode => i.item_barcode
    , pv_new_item_type => i.item_type
    , pv_new_item_title => i.item_title || '-Inserted'
    , pv_new_item_subtitle => i.item_subtitle
    , pv_new_item_rating => i.item_rating
    , pv_new_item_rating_agency => i.item_rating_agency
    , pv_new_item_release_date => i.item_release_date
    , pv_new_created_by => i.created_by
    , pv_new_creation_date => i.creation_date
    , pv_new_last_updated_by => i.last_updated_by
    , pv_new_last_update_date => i.last_update_date
    , pv_new_text_file_name => i.text_file_name );

  END LOOP;
END;
/   



DECLARE
  /* Dynamic cursor. */
  CURSOR get_row IS
    SELECT * FROM item WHERE item_title = 'King Arthur';
BEGIN
  /* Read the dynamic cursor. */
  FOR i IN get_row LOOP
     manage_item.item_insert(
        pv_old_item_id => i.item_id
      , pv_old_item_barcode => i.item_barcode
      , pv_old_item_type => i.item_type
      , pv_old_item_title => i.item_title
      , pv_old_item_subtitle => i.item_subtitle
      , pv_old_item_rating => i.item_rating
      , pv_old_item_rating_agency => i.item_rating_agency
      , pv_old_item_release_date => i.item_release_date
      , pv_old_created_by => i.created_by
      , pv_old_creation_date => i.creation_date
      , pv_old_last_updated_by => i.last_updated_by
      , pv_old_last_update_date => i.last_update_date
      , pv_old_text_file_name => i.text_file_name
      , pv_new_item_id => i.item_id
      , pv_new_item_barcode => i.item_barcode
      , pv_new_item_type => i.item_type
      , pv_new_item_title => i.item_title || '-Changed'
      , pv_new_item_subtitle => i.item_subtitle
      , pv_new_item_rating => i.item_rating
      , pv_new_item_rating_agency => i.item_rating_agency
      , pv_new_item_release_date => i.item_release_date
      , pv_new_created_by => i.created_by
      , pv_new_creation_date => i.creation_date
      , pv_new_last_updated_by => i.last_updated_by
      , pv_new_last_update_date => i.last_update_date
      , pv_new_text_file_name => i.text_file_name );

   
  END LOOP;
END;
/


DECLARE
  /* Dynamic cursor. */
  CURSOR get_row IS
    SELECT * FROM item WHERE item_title = 'King Arthur';
BEGIN
  /* Read the dynamic cursor. */
  FOR i IN get_row LOOP
     manage_item.item_insert(
        pv_old_item_id => i.item_id
      , pv_old_item_barcode => i.item_barcode
      , pv_old_item_type => i.item_type
      , pv_old_item_title => i.item_title || '-Deleted'
      , pv_old_item_subtitle => i.item_subtitle
      , pv_old_item_rating => i.item_rating
      , pv_old_item_rating_agency => i.item_rating_agency
      , pv_old_item_release_date => i.item_release_date
      , pv_old_created_by => i.created_by
      , pv_old_creation_date => i.creation_date
      , pv_old_last_updated_by => i.last_updated_by
      , pv_old_last_update_date => i.last_update_date
      , pv_old_text_file_name => i.text_file_name );


  END LOOP;
END;
/

/* Query the logger table. */
COL logger_id       FORMAT 9999 HEADING "Logger|ID #"
COL old_item_id     FORMAT 9999 HEADING "Old|Item|ID #"
COL old_item_title  FORMAT A20  HEADING "Old Item Title"
COL new_item_id     FORMAT 9999 HEADING "New|Item|ID #"
COL new_item_title  FORMAT A30  HEADING "New Item Title"
SELECT l.logger_id
,      l.old_item_id
,      l.old_item_title
,      l.new_item_id
,      l.new_item_title
FROM   logger l;





--STEP 3--

CREATE OR REPLACE TRIGGER item_trig
   BEFORE INSERT OR UPDATE OF item_title ON item
   FOR EACH ROW
   WHEN (REGEXP_LIKE(new.item_title,':'))
   DECLARE 
      /*Declare exception*/
      e EXCEPTION;
      PRAGMA EXCEPTION_INIT(e,-20001);
   BEGIN 
     IF INSERTING THEN
        manage_item.item_insert(
           pv_new_item_id => :new.item_id
         , pv_new_item_barcode => :new.item_barcode
         , pv_new_item_type => :new.item_type
         , pv_new_item_title => :new.item_title
         , pv_new_item_subtitle => :new.item_subtitle
         , pv_new_item_rating => :new.item_rating
         , pv_new_item_rating_agency => :new.item_rating_agency
         , pv_new_item_release_date => :new.item_release_date
         , pv_new_created_by => :new.created_by
         , pv_new_creation_date => :new.creation_date
         , pv_new_last_updated_by => :new.last_updated_by
         , pv_new_last_update_date => :new.last_update_date
         , pv_new_text_file_name => :new.text_file_name );
         
 IF REGEXP_INSTR(:new.item_title,':') > 0 AND
     REGEXP_INSTR(:new.item_title,':') = LENGTH(:new.item_title) THEN
    /* Shave off the colon. */
    :new.item_title  := SUBSTR(:new.item_title, 1, REGEXP_INSTR(:new.item_title,':') - 1);
  ELSIF REGEXP_INSTR(:new.item_title,':') > 0 THEN
    /* Split the string into two parts. */
     :new.item_subtitle := LTRIM(
        SUBSTR(:new.item_title
       ,REGEXP_INSTR(:new.item_title,':') + 1
       , LENGTH(:new.item_title)));
     :new.item_title := SUBSTR(:new.item_title, 1, REGEXP_INSTR(:new.item_title,':') - 1);
    
   
  END IF;


  ELSIF UPDATING THEN
     manage_item.item_insert(
     pv_old_item_id => :old.item_id
     , pv_old_item_barcode => :old.item_barcode
     , pv_old_item_type => :old.item_type
     , pv_old_item_title => :old.item_title
     , pv_old_item_subtitle => :old.item_subtitle
     , pv_old_item_rating => :old.item_rating
     , pv_old_item_rating_agency => :old.item_rating_agency
     , pv_old_item_release_date => :old.item_release_date
     , pv_old_created_by => :old.created_by
     , pv_old_creation_date => :old.creation_date
     , pv_old_last_updated_by => :old.last_updated_by
     , pv_old_last_update_date => :old.last_update_date
     , pv_old_text_file_name => :old.text_file_name
     , pv_new_item_id => :new.item_id
     , pv_new_item_barcode => :new.item_barcode
     , pv_new_item_type => :new.item_type
     , pv_new_item_title => :new.item_title
     , pv_new_item_subtitle => :new.item_subtitle
     , pv_new_item_rating => :new.item_rating
     , pv_new_item_rating_agency => :new.item_rating_agency
     , pv_new_item_release_date => :new.item_release_date
     , pv_new_created_by => :new.created_by
     , pv_new_creation_date => :new.creation_date
     , pv_new_last_updated_by => :new.last_updated_by
     , pv_new_last_update_date => :new.last_update_date
     , pv_new_text_file_name => :new.text_file_name);
   

    RAISE_APPLICATION_ERROR(-20001, 'No colons allowed in item titles.');
  END IF;
END item_trig;
/




  

CREATE OR REPLACE TRIGGER item_delete_trig
  BEFORE DELETE ON item
  FOR EACH ROW 
  DECLARE
  e EXCEPTION;
      PRAGMA EXCEPTION_INIT(e,-20001);
  BEGIN
     IF DELETING THEN
     manage_item.item_insert(
       pv_old_item_id => :old.item_id
     , pv_old_item_barcode => :old.item_barcode
     , pv_old_item_type => :old.item_type
     , pv_old_item_title => :old.item_title
     , pv_old_item_subtitle => :old.item_subtitle
     , pv_old_item_rating => :old.item_rating
     , pv_old_item_rating_agency => :old.item_rating_agency
     , pv_old_item_release_date => :old.item_release_date
     , pv_old_created_by => :old.created_by
     , pv_old_creation_date => :old.creation_date
     , pv_old_last_updated_by => :old.last_updated_by
     , pv_old_last_update_date => :old.last_update_date
     , pv_old_text_file_name => :old.text_file_name);
     END IF;
END item_delete_trig;
/

ALTER TABLE item DROP CONSTRAINT fk_item_1;
ALTER TABLE item 
  ADD CONSTRAINT fk_item_1 FOREIGN KEY (item_type) 
   REFERENCES common_lookup(common_lookup_id)
  ON DELETE CASCADE;

COL item_id        FORMAT 9999 HEADING "Item|ID #"
COL item_title     FORMAT A20  HEADING "Item Title"
COL item_subtitle  FORMAT A20  HEADING "Item Subtitle"
COL item_type      FORMAT 9999 HEADING "Item|Type"
COL item_rating    FORMAT A6   HEADING "Item|Rating"
SELECT i.item_id
,      i.item_title
,      i.item_subtitle
,      i.item_type
,      i.item_rating
FROM   item i
WHERE  i.item_title = 'Star Wars';

DELETE FROM common_lookup
WHERE common_lookup_table = 'ITEM'
AND common_lookup_column = 'ITEM_TYPE' 
AND common_lookup_type = 'BLU-RAY';

COL item_id        FORMAT 9999 HEADING "Item|ID #"
COL item_title     FORMAT A20  HEADING "Item Title"
COL item_subtitle  FORMAT A20  HEADING "Item Subtitle"
COL item_type      FORMAT 9999 HEADING "Item|Type"
COL item_rating    FORMAT A6   HEADING "Item|Rating"
SELECT i.item_id
,      i.item_title
,      i.item_subtitle
,      i.item_type
,      i.item_rating
FROM   item i
WHERE  i.item_title = 'Star Wars';


ALTER TABLE item DROP CONSTRAINT fk_item_1;
ALTER TABLE item 
  ADD CONSTRAINT fk_item_1 FOREIGN KEY (item_type) 
   REFERENCES common_lookup(common_lookup_id)
  ON DELETE CASCADE;
  
  
INSERT INTO common_lookup
VALUES
( common_lookup_s1.NEXTVAL
, 'ITEM'
, 'ITEM_TYPE'
, 'BLU-RAY'
,  NULL
, 'Blu-ray'
,  3
,  SYSDATE
,  3
,  SYSDATE);

COL common_lookup_table   FORMAT A14 HEADING "Common Lookup|Table"
COL common_lookup_column  FORMAT A14 HEADING "Common Lookup|Column"
COL common_lookup_type    FORMAT A14 HEADING "Common Lookup|Type"
SELECT common_lookup_table
,      common_lookup_column
,      common_lookup_type
FROM   common_lookup
WHERE  common_lookup_table = 'ITEM'
AND    common_lookup_column = 'ITEM_TYPE'
AND    common_lookup_type = 'BLU-RAY';

ALTER TABLE item DROP CONSTRAINT nn_item_4;
INSERT INTO item
(  item_id
 , item_barcode
 , item_type
 , item_title
 , item_subtitle
 , item_rating
 , item_rating_agency
 , item_release_date
 , created_by
 , creation_date
 , last_updated_by
 , last_update_date)
VALUES
(  item_s1.NEXTVAL
, 'B01IHVPA8'
, (SELECT common_lookup_id FROM common_lookup WHERE common_lookup_table = 'ITEM' AND common_lookup_column = 'ITEM_TYPE' AND common_lookup_type = 'BLU-RAY')
, 'BOURNE'
,  NULL
, 'PG-13'
, 'MPAA'
,  '06-DEC-2016'
,  3
,  SYSDATE
,  3
,  SYSDATE);
    
INSERT INTO item
(  item_id
 , item_barcode
 , item_type
 , item_title
 , item_subtitle
 , item_rating
 , item_rating_agency
 , item_release_date
 , created_by
 , creation_date
 , last_updated_by
 , last_update_date)
VALUES
(  item_s1.NEXTVAL
, 'B01AT251XY'
, (SELECT common_lookup_id FROM common_lookup WHERE common_lookup_table = 'ITEM' AND common_lookup_column = 'ITEM_TYPE' AND common_lookup_type = 'BLU-RAY')
, 'BOURNE LEGACY:'
,  NULL
, 'PG-13'
, 'MPAA'
,  '05-APR-2016'
,  3
,  SYSDATE
,  3
,  SYSDATE);

INSERT INTO item
(  item_id
 , item_barcode
 , item_type
 , item_title
 , item_subtitle
 , item_rating
 , item_rating_agency
 , item_release_date
 , created_by
 , creation_date
 , last_updated_by
 , last_update_date)
VALUES
(  item_s1.NEXTVAL
, 'B018FK66TU'
, (SELECT common_lookup_id FROM common_lookup WHERE common_lookup_table = 'ITEM' AND common_lookup_column = 'ITEM_TYPE' AND common_lookup_type = 'BLU-RAY')
, 'Star Wars: The Force Awakens'
,  NULL
, 'PG-13'
, 'MPAA'
,  '05-APR-2016'
,  3
,  SYSDATE
,  3
,  SYSDATE);

COL item_id        FORMAT 9999 HEADING "Item|ID #"
COL item_title     FORMAT A20  HEADING "Item Title"
COL item_subtitle  FORMAT A20  HEADING "Item Subtitle"
COL item_rating    FORMAT A6   HEADING "Item|Rating"
COL item_type      FORMAT A18   HEADING "Item|Type"
SELECT i.item_id
,      i.item_title
,      i.item_subtitle
,      i.item_rating
,      cl.common_lookup_meaning AS item_type
FROM   item i INNER JOIN common_lookup cl
ON     i.item_type = cl.common_lookup_id
WHERE  cl.common_lookup_type = 'BLU-RAY';



/* Query the logger table. */
COL logger_id       FORMAT 9999 HEADING "Logger|ID #"
COL old_item_id     FORMAT 9999 HEADING "Old|Item|ID #"
COL old_item_title  FORMAT A20  HEADING "Old Item Title"
COL new_item_id     FORMAT 9999 HEADING "New|Item|ID #"
COL new_item_title  FORMAT A30  HEADING "New Item Title"
SELECT l.logger_id
,      l.old_item_id
,      l.old_item_title
,      l.new_item_id
,      l.new_item_title
FROM   logger l;


UPDATE item 
SET item_title = 'Star Wars: The Force Awakens' WHERE item_barcode = 'B018FK66TU';


COL item_id        FORMAT 9999 HEADING "Item|ID #"
COL item_title     FORMAT A20  HEADING "Item Title"
COL item_subtitle  FORMAT A20  HEADING "Item Subtitle"
COL item_rating    FORMAT A6   HEADING "Item|Rating"
COL item_type      FORMAT A18   HEADING "Item|Type"
SELECT i.item_id
,      i.item_title
,      i.item_subtitle
,      i.item_rating
,      cl.common_lookup_meaning AS item_type
FROM   item i INNER JOIN common_lookup cl
ON     i.item_type = cl.common_lookup_id
WHERE  cl.common_lookup_type = 'BLU-RAY';


COL logger_id       FORMAT 9999 HEADING "Logger|ID #"
COL old_item_id     FORMAT 9999 HEADING "Old|Item|ID #"
COL old_item_title  FORMAT A20  HEADING "Old Item Title"
COL new_item_id     FORMAT 9999 HEADING "New|Item|ID #"
COL new_item_title  FORMAT A30  HEADING "New Item Title"
SELECT l.logger_id
,      l.old_item_id
,      l.old_item_title
,      l.new_item_id
,      l.new_item_title
FROM   logger l;

DELETE FROM item
WHERE item_title = 'Star Wars' 
AND item_subtitle = 'The Force Awakens'
AND item_barcode = 'B018FK66TU';


COL item_id        FORMAT 9999 HEADING "Item|ID #"
COL item_title     FORMAT A20  HEADING "Item Title"
COL item_subtitle  FORMAT A20  HEADING "Item Subtitle"
COL item_rating    FORMAT A6   HEADING "Item|Rating"
COL item_type      FORMAT A18   HEADING "Item|Type"
SELECT i.item_id
,      i.item_title
,      i.item_subtitle
,      i.item_rating
,      cl.common_lookup_meaning AS item_type
FROM   item i INNER JOIN common_lookup cl
ON     i.item_type = cl.common_lookup_id
WHERE  cl.common_lookup_type = 'BLU-RAY';


COL logger_id       FORMAT 9999 HEADING "Logger|ID #"
COL old_item_id     FORMAT 9999 HEADING "Old|Item|ID #"
COL old_item_title  FORMAT A20  HEADING "Old Item Title"
COL new_item_id     FORMAT 9999 HEADING "New|Item|ID #"
COL new_item_title  FORMAT A30  HEADING "New Item Title"
SELECT l.logger_id
,      l.old_item_id
,      l.old_item_title
,      l.new_item_id
,      l.new_item_title
FROM   logger l;

-- Close log file.
SPOOL OFF
