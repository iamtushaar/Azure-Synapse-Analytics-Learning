--ROUND ROBIN 

CREATE TABLE round_tbl
(
    id INT,
    name VARCHAR(50),
    salary INT
)
WITH
(
    DISTRIBUTION = ROUND_ROBIN
)

INSERT INTO round_tbl (id, name, salary)  
VALUES  
(1, 'Tushar', 100000)

SELECT * from round_tbl;

--REPLICATE

CREATE SCHEMA gold;

CREATE TABLE gold.dim_product
(
    Product_ID INT,
    Product_Name VARCHAR(500)
)
WITH
(
    DISTRIBUTION = REPLICATE
);


--HASH
CREATE TABLE gold.fact_tbl
(
   dim_prod_key INT,
   cost INT,
   revenue INT
)
WITH
(
    DISTRIBUTION = HASH(dim_prod_key)
);
