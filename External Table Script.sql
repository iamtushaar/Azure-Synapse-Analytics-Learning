---CREATE EXTERNAL TABLE

CREATE EXTERNAL TABLE revenue_ext_tbl
(
    Dealer_ID VARCHAR(500),
    Model_ID VARCHAR(500),
    Branch_ID VARCHAR(500),
    Date_ID VARCHAR(500),
    Units_Sold VARCHAR(500),
    Revenue VARCHAR(500)
)
WITH
(
    LOCATION = 'SynapsePractice',
    DATA_SOURCE = landing_ext_source,
    FILE_FORMAT = csv_format
)

SELECT * FROM revenue_ext_tbl

