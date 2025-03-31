---CREATE A MASTER KEY
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'SynapseMasterKey@1'

---CREATE SCOPED CREDENTIAL
CREATE DATABASE SCOPED CREDENTIAL tushcred
WITH
IDENTITY = 'MANAGED IDENTITY'

---CREATE EXTERNAL DATA SOURCE
CREATE EXTERNAL DATA SOURCE landing_ext_source
WITH
(
    LOCATION = 'https://projectstorageaccount01.dfs.core.windows.net/projects/landing/',
    CREDENTIAL = tushcred
)

---CREATE EXTERNAL FILE FORMAT
CREATE EXTERNAL FILE FORMAT csv_format  
WITH (  
    FORMAT_TYPE = DELIMITEDTEXT,  
    FORMAT_OPTIONS (
                        FIELD_TERMINATOR = ',', 
                        STRING_DELIMITER = '"', 
                        FIRST_ROW = 2
                    )
);

---CREATE EXTERNAL FILE FORMAT
CREATE EXTERNAL FILE FORMAT parquet_format  
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

---OPENROWSET FUNCTION
SELECT * 
FROM
OPENROWSET(
    BULK 'SynapsePractice',
    DATA_SOURCE = 'landing_ext_source',
    FORMAT = 'CSV',
    PARSER_VERSION = '2.0',
    HEADER_ROW = TRUE
) as query1


