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

---CREATE EXTERNAL DATA SOURCE
CREATE EXTERNAL DATA SOURCE landing_ext_source_abfss
WITH
(
    LOCATION = 'abfss://projects@projectstorageaccount01.dfs.core.windows.net/landing/',
    CREDENTIAL = tushcred
)

---CREATE EXTERNAL FILE FORMAT
CREATE EXTERNAL FILE FORMAT parquet_format  
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);


