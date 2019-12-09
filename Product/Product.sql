USE InvoiceProject;
DROP TABLE IF EXISTS Contect;

CREATE TABLE Product(
  Invoice_ID int(11),
  PartNumber int(255) NOT NULL,
  ProductName VARCHAR(255) NOT NULL,
  ProductWeight int(255) NOT NULL,
  Quantity double(255, 4),
  Price int(255),
  Taxable VARCHAR(1),
  UnitDimentions VARCHAR(255),
  FOREIGN KEY (Invoice_ID) REFERENCES invoices(InvoiceID)
) AS
	SELECT DISTINCT PartNumber, ProductName, ProductWeight, Quantity,Price, Taxable, UnitDimensions
	FROM invoices
	ORDER BY PartNumber;

UPDATE invoices
	INNER JOIN Product
	ON Product.PartNumber = invoices.PartNumber
	       AND Product.Invoice_ID = invoices.InvoiceID

	SET Product.Invoice_ID = invoices.InvoiceID
	WHERE invoices.InvoiceID IS NOT NULL;



ALTER TABLE invoices
	DROP COLUMN PartNumber,
    DROP  ProductName,
    DROP  ProductWeight,
    DROP  Quantity,
    DROP  Price,
    DROP  Taxable,
    DROP  UnitDimensions;