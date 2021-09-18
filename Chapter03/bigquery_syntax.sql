
CREATE schema `03_bigquery_syntax`;

############ Creation of an empty table ############
CREATE TABLE
  `03_bigquery_syntax.first_table` ( id_key INT64,
    description STRING );
    
############ Creation of an empty table with replacement of the existing one ############
CREATE OR REPLACE TABLE
  `03_bigquery_syntax.first_table` ( id_key INT64,
    description STRING );
    
############ Insertion of a new record into the table ############
INSERT INTO
  `03_bigquery_syntax.first_table`
VALUES
  ( 1, 'This is my first record inserted into BigQuery' );
  
############ Creation of a BigQuery View ############
CREATE VIEW
  `03_bigquery_syntax.first_view` AS
SELECT
  *
FROM
  `03_bigquery_syntax.first_table`;
  
############ SELECT statement on a BigQuery Table with filters ############
SELECT
  *
FROM
  `03_bigquery_syntax.first_table`
WHERE
  id_key=1;

############ Nested SELECT statements on a BigQuery Table with filters ############
SELECT COUNT(*) FROM (
    SELECT
      *
    FROM
      `03_bigquery_syntax.first_table`
    WHERE
      id_key=1
  );

############ The previous SELECT statement rewritten using WITH Clause ############
 WITH records_with_clause AS (SELECT
      *
    FROM
      `03_bigquery_syntax.first_table`
    WHERE
      id_key=1)   
SELECT COUNT(*) FROM records_with_clause;

############ UPDATE statment that changes the field description  ############
UPDATE
    `03_bigquery_syntax.first_table`
SET
    description= 'This is my updated description'
WHERE 
    id_key=1;

############ DELETE statment that removes one record with id_key=1  ############
DELETE
    `03_bigquery_syntax.first_table`
WHERE 
    id_key=1;
    
############ TRUNCATE statement to empty an entire table  ############
TRUNCATE TABLE `03_bigquery_syntax.first_table`;

############ DROP TABLE to delete the content and the metadata (structure of the table) of the table ############
DROP TABLE `03_bigquery_syntax.first_table`;

############ SELECT on a view where the underline table doesn't exist anymore - This query will return an error ############
############  This query will return an error because the underline table is no more available. I'll not execute it ############
SELECT * FROM  `03_bigquery_syntax.first_view`;

############ DROP VIEW statement to remove the view and restore consistency ############
DROP VIEW  `03_bigquery_syntax.first_view`;
