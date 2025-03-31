--- COPY INTO

CREATE TABLE copy_into_tbl
(
    Dealer_ID VARCHAR(500),
    Model_ID VARCHAR(500),
    Branch_ID VARCHAR(500),
    Date_ID VARCHAR(500),
    Units_Sold BIGINT,
    Revenue BIGINT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
)

SELECT * FROM copy_into_tbl

---Loading data

COPY INTO copy_into_tbl
(
    Dealer_ID 1,
    Model_ID 2,
    Branch_ID 3,
    Date_ID 4,
    Units_Sold 5,
    Revenue 6
)
FROM 'https://projectstorageaccount01.dfs.core.windows.net/projects/landing/CETAS/'
WITH
(
    FILE_TYPE = 'PARQUET',
    CREDENTIAL = (IDENTITY = 'MANAGED IDENTITY')
)




