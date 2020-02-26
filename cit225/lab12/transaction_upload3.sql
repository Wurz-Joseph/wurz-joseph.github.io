CREATE TABLE transaction_reversal
( transaction_id           NUMBER
, transaction_account      VARCHAR2(15)
, transaction_type         NUMBER
, transaction_date         DATE
, transaction_amount       NUMBER
, rental_id                NUMBER
, payment_method_type      NUMBER
, payment_account_number   VARCHAR2(19)
, created_by               NUMBER
, creation_date            DATE
, last_updated_by          NUMBER
, last_update_date         DATE
)

ORGANIZATION EXTERNAL
  ( TYPE oracle_loader
  DEFAULT DIRECTORY UPLOAD
  ACCESS PARAMETERS
  ( RECORDS DELIMITED BY NEWLINE CHARACTERSET US7ASCII
   BADFILE     'UPLOAD':'transaction_upload3.bad'
   DISCARDFILE 'UPLOAD':'transaction_upload3.dis'
   LOGFILE     'UPLOAD':'transaction_upload3.log'
   FIELDS TERMINATED BY ','
   OPTIONALLY ENCLOSED BY "'"
   MISSING FIELD VALUES ARE NULL )
 LOCATION ('transaction_upload3.csv'))
REJECT LIMIT UNLIMITED;
