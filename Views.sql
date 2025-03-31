--- VIEWS

CREATE VIEW revenue_view
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

SELECT * from revenue_view;