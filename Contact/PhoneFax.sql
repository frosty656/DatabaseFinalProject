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
	DROP Phone, DROP Fax;


DROP TABLE IF EXISTS Type;

CREATE TABLE Type(
  Type_ID int(11) NOT NULL auto_increment,
  Type VARCHAR(25) NOT NULL,
  PRIMARY KEY  (Type_ID)
) AS
	SELECT DISTINCT Type
	FROM Phone
	WHERE Type IS NOT NULL
	ORDER BY Type;

ALTER TABLE Phone
	ADD COLUMN Type_ID INT(11),
	ADD FOREIGN KEY (Type_ID) REFERENCES Type(Type_ID);

UPDATE Phone
	INNER JOIN Type
	ON Type.Type = Phone.Type
	SET Phone.Type_ID = Type.Type_ID
	WHERE Type.Type IS NOT NULL;

ALTER TABLE Phone
	DROP COLUMN Type;