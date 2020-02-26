--Joseph Wurz

--Open log file
SPOOL /home/student/Data/cit225/oracle/lab1/apply_oracle_lab1.txt



@@/home/student/Data/cit225/oracle/lib1/utility/cleanup_oracle.sql
@@/home/student/Data/cit225/oracle/lib1/create/create_oracle_store2.sql
@@/home/student/Data/cit225/oracle/lib1/preseed/preseed_oracle_store.sql

--close log file
SPOOL OFF
