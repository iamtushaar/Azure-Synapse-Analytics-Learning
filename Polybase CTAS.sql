--- EXTERNAL TABLE IN DEDICATED
CREATE EXTERNAL TABLE revenue_parquet_ext_tbl
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
    LOCATION = '/CETAS',
    DATA_SOURCE = landing_ext_source_abfss,
    FILE_FORMAT = parquet_format
)

---POLYBASE

CREATE TABLE poly_tbl
WITH(
    DISTRIBUTION = ROUND_ROBIN
)
AS
SELECT * FROM revenue_parquet_ext_tbl;

SELECT * from poly_tbl;