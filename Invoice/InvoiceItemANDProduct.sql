USE InvoiceProject;
DROP TABLE IF EXISTS InvoiceItems;

CREATE TABLE InvoiceItems(
  Invoice_ID int(11),
  PartNumber int(255) NOT NULL,
  ProductName VARCHAR(255) NOT NULL,
  ProductWeight int(255) NOT NULL,
  Quantity double(255, 4),
  Price int(255),
  Taxable VARCHAR(1),
  UnitDimensions VARCHAR(255),
  FOREIGN KEY (Invoice_ID) REFERENCES invoices(InvoiceID)
) AS
	SELECT DISTINCT PartNumber, ProductName, ProductWeight, Quantity,Price, Taxable, UnitDimensions
	FROM invoices
	ORDER BY PartNumber;

UPDATE invoices
	INNER JOIN InvoiceItems
	ON InvoiceItems.PartNumber = invoices.PartNumber

	SET InvoiceItems.Invoice_ID = invoices.InvoiceID
	WHERE invoices.InvoiceID IS NOT NULL;



ALTER TABLE invoices
    DROP COLUMN PartNumber,
    DROP ProductName,
    DROP ProductWeight,
    DROP Quantity,
    DROP Price,
    DROP Taxable,
    DROP UnitDimensions;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products(
  PartNumber int(255) NOT NULL,
  ProductName VARCHAR(255) NOT NULL,
  ProductWeight int(255) NOT NULL,
  Taxable VARCHAR(1),
  UnitDimensions VARCHAR(255),
  PRIMARY KEY (PartNumber)
) AS
	SELECT DISTINCT PartNumber, ProductName, ProductWeight, Taxable, UnitDimensions
	FROM InvoiceItems
	ORDER BY PartNumber;

ALTER TABLE InvoiceItems
	ADD COLUMN Product_ID INT(11),
	ADD FOREIGN KEY (Product_ID) REFERENCES Products(PartNumber);


ALTER TABLE InvoiceItems
	DROP  PartNumber,
    DROP  ProductName,
    DROP  ProductWeight,
    DROP  Taxable,
    DROP  UnitDimensions;
