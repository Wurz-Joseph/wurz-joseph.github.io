
CREATE TABLE transaction_upload
( account_number          VARCHAR2(10)
, first_name              VARCHAR2(20)
, middle_name             VARCHAR2(20)
, last_name               VARCHAR2(20)
, check_out_date          DATE
, return_date             DATE
, rental_item_type        VARCHAR2(12)
, transaction_type        VARCHAR2(30)
, transaction_amount      NUMBER
, transaction_date        DATE
, item_id                 NUMBER
, payment_method_type     VARCHAR2(14)
, payment_account_number  VARCHAR2(19))

    ORGANIZATION EXTERNAL
  ( TYPE oracle_loader
  DEFAULT DIRECTORY upload
  ACCESS PARAMETERS
  ( RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
   BADFILE     'UPLOAD':'transaction_upload.bad'
   DISCARDFILE 'UPLOAD':'transaction_upload.dis'
   LOGFILE     'UPLOAD':'transaction_upload.log'
   FIELDS TERMINATED BY ','
   OPTIONALLY ENCLOSED BY "'"
   MISSING FIELD VALUES ARE NULL )
 LOCATION ('transaction_upload.csv'))
REJECT LIMIT UNLIMITED;







