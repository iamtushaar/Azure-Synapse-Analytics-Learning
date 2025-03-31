--- CETAS
CREATE EXTERNAL TABLE revenue_cetas
WITH
(
    LOCATION = 'CETAS',
    DATA_SOURCE = landing_ext_source,
    FILE_FORMAT = parquet_format
)
AS
SELECT * 
FROM
OPENROWSET(
    BULK 'SynapsePractice',
    DATA_SOURCE = 'landing_ext_source',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) as query1;