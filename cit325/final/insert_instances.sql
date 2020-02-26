SPOOL insert_instances.txt


DECLARE
BEGIN

INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, man_t( oid => 1
       , name => 'Boromir'
       , genus => 'Men' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, man_t( oid => 2
       , name => 'Faramir'
       , genus => 'Men' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, hobbit_t( oid => 3
          , name => 'Bilbo'
          , genus => 'Hobbits' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, hobbit_t( oid => 4
          , name => 'Frodo'
          , genus => 'Hobbits' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, hobbit_t( oid => 5
          , name => 'Merry'
          , genus => 'Hobbits' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, hobbit_t( oid => 6
          , name => 'Pippin'
          , genus => 'Hobbits' ));
        
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, hobbit_t( oid => 7
          , name => 'Samwise'
          , genus => 'Hobbits' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, dwarf_t( oid => 8
         , name => 'Gimli'
         , genus => 'Dwarves' ));
         
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, noldor_t( oid => 9
          , name => 'Feanor'
          , genus => 'Elves' 
          , elfkind => 'Noldor' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, silvan_t( oid => 10
          , name => 'Tauriel'
          , genus => 'Elves' 
          , elfkind => 'Silvan' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, teleri_t( oid => 11
          , name => 'Earwin'
          , genus => 'Elves' 
          , elfkind => 'Teleri' ));       
       
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, teleri_t( oid => 12
          , name => 'Celeborn'
          , genus => 'Elves' 
          , elfkind => 'Teleri' ));
         
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, sindar_t( oid => 13
          , name => 'Thranduil'
          , genus => 'Elves'
          , elfkind => 'Sindar' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, sindar_t( oid => 14
          , name => 'Legolas'
          , genus => 'Elves' 
          , elfkind => 'Sindar' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, orc_t( oid => 15
       , name => 'Azog the Defiler'
       , genus => 'Orcs' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, orc_t( oid => 16
       , name => 'Bolg'
       , genus => 'Orcs' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, maia_t( 17
        , name => 'Gandalf the Grey'
        , genus => 'Maiar' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, maia_t( oid => 18
        , name => 'Radagast the Brown'
        , genus => 'Maiar' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, maia_t( oid => 19
        , name => 'Saruman the White'
        , genus => 'Maiar' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, goblin_t( oid => 20
          , name => 'The Great Goblin'
          , genus => 'Goblins' ));
       
INSERT INTO tolkien
VALUES 
( tolkien_s.NEXTVAL
, man_t( oid => 21
       , name => 'Aragorn'
       , genus => 'Men' )); 
       
COMMIT;
       
END;
/

SPOOL OFF

QUIT;
