USE InvoiceProject;

ALTER TABLE invoices
	ADD PRIMARY KEY (InvoiceID);

ALTER TABLE invoices
    DROP InvoiceTotal,
    DROP TaxAmount,
    DROP SubTotal;