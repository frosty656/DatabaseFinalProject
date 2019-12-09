USE InvoiceProject;
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