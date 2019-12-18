USE InvoiceProject;

ALTER TABLE Products
    ADD COLUMN xDimension int(255) NOT NULL,
    ADD COLUMN yDimension int(255) NOT NULL,
    ADD COLUMN zDimension int(255) NOT NULL;


UPDATE Products
    SET Products.xDimension = substring_index(UnitDimensions, 'x',1),
        Products.yDimension = substring_index(substring_index(UnitDimensions, 'x', 2), 'x', -1),
        Products.zDimension =  substring_index(UnitDimensions, 'x', -1);


ALTER TABLE Products
    DROP COLUMN UnitDimensions;