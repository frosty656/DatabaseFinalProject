USE InvoiceProject;
DROP TABLE IF EXISTS Phone;

CREATE TABLE Phone(
  Phone_ID int(11),
  Phone VARCHAR(255) NOT NULL,
  Type VARCHAR(255),
  FOREIGN KEY  (Phone_ID) REFERENCES Contact(Contact_ID)
) AS
	SELECT DISTINCT Phone
	FROM Contact
	WHERE Phone IS NOT NULL
	ORDER BY Phone;

UPDATE Phone
	INNER JOIN Contact
	ON Contact.Phone = Phone.Phone
	SET Phone.Phone_ID = Contact.Contact_ID, Phone.Type = 'Phone'
	WHERE Contact.Phone IS NOT NULL;



INSERT INTO Phone
SELECT DISTINCT Contact_ID,  null, Fax
FROM Contact
WHERE Fax IS NOT NULL
ORDER BY Fax;

UPDATE Phone
	INNER JOIN Contact
	ON Contact.Fax = Phone.Phone
	SET Phone.Phone_ID = Contact.Contact_ID, Phone.Type = 'Fax'
	WHERE Contact.Fax IS NOT NULL;

ALTER TABLE Contact
	DROP COLUMN Email, DROP Fax;