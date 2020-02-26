/*
||  Name:          apply_prep_lab6.sql
||  Date:          11 Nov 2016
||  Purpose:       Complete 325 Chapter 7 lab.
||  Dependencies:  Run the Oracle Database 12c PL/SQL Programming setup programs.
*/

/* Set environment variables. */
SET ECHO ON
SET FEEDBACK ON
SET PAGESIZE 49999
SET SERVEROUTPUT ON SIZE UNLIMITED

/* Run the library files. */
@/home/student/Data/cit325/oracle/lib/cleanup_oracle.sql
@/home/student/Data/cit325/oracle/lib/Oracle12cPLSQLCode/Introduction/create_video_store.sql

-- Open log file.
SPOOL apply_plsql_lab6.txt

-- ... insert your solution here ...

-- Close log file.
SPOOL OFF
