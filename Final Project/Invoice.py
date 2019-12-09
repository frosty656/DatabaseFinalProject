fileName = input("Enter the name of the file: ")

fullname = fileName + ".sql" 

f= open(fullname,"w+")

newTableName = fileName
keyField = fileName  + "_ID"
columnData = fileName
columnName = fileName

f.write("""USE InvoiceProject;
DROP TABLE IF EXISTS """ + newTableName + """;

CREATE TABLE """ + newTableName + """(
  """ + keyField + """ int(11) NOT NULL auto_increment,
  """ + columnData +  """ VARCHAR(25) NOT NULL,
  PRIMARY KEY  (""" + keyField + """)
) AS
	SELECT DISTINCT """ + columnName +"""
	FROM invoices
	WHERE """ + columnName + """ IS NOT NULL
	ORDER BY """ + columnName + """;

ALTER TABLE invoices
	ADD COLUMN """ + keyField + """ INT(11),
	ADD FOREIGN KEY (""" + keyField + """) REFERENCES """ + newTableName + """(""" + keyField + """);

UPDATE invoices
	INNER JOIN """ + newTableName + """
	ON """ + newTableName + """.""" + columnData + """ = invoices.""" + columnName + """
	SET invoices.""" + keyField + """ = """ + newTableName + """.""" + keyField + """
	WHERE """ + newTableName + """.""" + columnData + """ IS NOT NULL;

#ALTER TABLE invoices
#	DROP COLUMN """ + columnName + """;)""")

f.close()
