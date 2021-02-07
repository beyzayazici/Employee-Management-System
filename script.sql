CREATE DATABASE empmansystem;

GRANT ALL PRIVILEGES ON DATABASE empmansystem TO postgres;

\c empmansystem;
CREATE TABLE Location(
    	Id SERIAL PRIMARY KEY,
	LocName text NULL,
	Address text NULL,
	ZipCode text NULL,
	Country text NULL,
	City text NULL
);

CREATE TABLE Department(
	Id SERIAL PRIMARY KEY,
	DepName text NULL,
	LocationId int NOT NULL,
	CONSTRAINT fk_Department
    	FOREIGN KEY(LocationId) 
	REFERENCES Location(Id)
);

CREATE TABLE Title(
	Id SERIAL PRIMARY KEY,
	Name text NULL,
	DepartmentId int NOT NULL,
	CONSTRAINT fk_Title
    	FOREIGN KEY(DepartmentId) 
	REFERENCES Department(Id)
);

CREATE TABLE Employee(
	Id SERIAL UNIQUE PRIMARY KEY,
	Name text NOT NULL,
	Surname text NOT NULL,
	Email text NULL,
	PhoneNumber text NOT NULL,
	StartDate date NOT NULL,
	Salary double precision NOT NULL,
	DepartmentId int NOT NULL,
	TitleId int NOT NULL,
	ManagerId int NOT NULL,
	FOREIGN KEY (DepartmentId) REFERENCES Department (Id),
	FOREIGN KEY (TitleId) REFERENCES Title (Id)
);

CREATE TABLE DepartmentManager(
	Id SERIAL PRIMARY KEY,
	DepartmentId int NULL,
	ManagerId int NULL,
	FOREIGN KEY (DepartmentId) REFERENCES Department (Id),
	FOREIGN KEY (ManagerId) REFERENCES Employee(Id)
);

INSERT INTO Location(LocName,Address,ZipCode,Country,City) VALUES('Merkez Ofis','Deneme sokak deneme mah','34569','Türkiye','İstanbul');
INSERT INTO Location(LocName,Address,ZipCode,Country,City) VALUES('Güneşli Ofis','Deneme sokak 1 deneme mah 1','34570','Türkiye','İstanbul');
INSERT INTO Location(LocName,Address,ZipCode,Country,City) VALUES('Bahçelievler Ofis','Deneme sokak  2 deneme mah 2','34571','Türkiye','İstanbul');


INSERT INTO Department (DepName,LocationId) VALUES ('İnsan Kaynakları',(SELECT Id FROM Location WHERE LocName LIKE '%Merkez%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Hukuk',(SELECT Id FROM Location WHERE LocName LIKE '%Merkez%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Bilgi Teknolojileri',(SELECT Id FROM Location WHERE LocName LIKE '%Merkez%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Genel Müdürlük',(SELECT Id FROM Location WHERE LocName LIKE '%Merkez%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Satınalma',(SELECT Id FROM Location WHERE LocName LIKE '%Güneşli%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Yardım Masası',(SELECT Id FROM Location WHERE LocName LIKE '%Güneşli%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('Operasyon',(SELECT Id FROM Location WHERE LocName LIKE '%Bahçelievler%'));;
INSERT INTO Department (DepName,LocationId) VALUES ('İdari İşler',(SELECT Id FROM Location WHERE LocName LIKE '%Bahçelievler%'));;


INSERT INTO Title (Name,DepartmentId) VALUES ('İnsan Kaynakları Uzman Yardımcısı', (SELECT Id FROM Department WHERE DepName LIKE '%Kaynak%'));;
INSERT INTO Title (Name,DepartmentId) VALUES ('İnsan Kaynakları Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Kaynak%'));;
INSERT INTO Title (Name,DepartmentId) VALUES ('İnsan Kaynakları Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Kaynak%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Hukuk Asistanı', (SELECT Id FROM Department WHERE DepName LIKE '%Hukuk%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Hukuk Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Hukuk%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Hukuk Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Hukuk%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Yazılım Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Yazılım Danışmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Yazılım Mühendisi', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('İş Analisti', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Sistem Analisti', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Yazılım Mimarı', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Yazılım Müdürü', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Sistem Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Network Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Sistem ve Network Müdürü', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Bilgi Teknoloji Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Bilgi%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Satınalma Uzman Yardımcısı', (SELECT Id FROM Department WHERE DepName LIKE '%Satınalma%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Satınalma Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Satınalma%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Satınalma Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Satınalma%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Yardım Masası Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Yardım%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Yardım Masası Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Yardım%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Operasyon Uzman Yardımcısı', (SELECT Id FROM Department WHERE DepName LIKE '%Operasyon%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Operasyon Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%Operasyon%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Operasyon Müdür Yardımcısı', (SELECT Id FROM Department WHERE DepName LIKE '%Operasyon%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Operasyon Müdürü', (SELECT Id FROM Department WHERE DepName LIKE '%Operasyon%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Operasyon Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%Operasyon%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('İdari İşler Uzmanı', (SELECT Id FROM Department WHERE DepName LIKE '%dari%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('İdari İşler Direktörü', (SELECT Id FROM Department WHERE DepName LIKE '%dari%'));

INSERT INTO Title (Name,DepartmentId) VALUES ('Genel Müdür Yardımcısı', (SELECT Id FROM Department WHERE DepName LIKE '%Genel Müdürlük%'));
INSERT INTO Title (Name,DepartmentId) VALUES ('Genel Müdür', (SELECT Id FROM Department WHERE DepName LIKE '%Genel Müdürlük%'));

ALTER TABLE Employee ALTER COLUMN ManagerId DROP NOT NULL;

INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Can','Kesin','Can.Kesin@vista.com','5991111111','2005-03-10',85000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Genel Müdürlük%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Genel Müdür'),NULL);

INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ayşe','Sevim','Ayse.Sevim@vista.com','5991111112','2001-06-12',63000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Genel Müdürlük%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Genel Müdür Yardımcı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Rıdvan','Türkmen','Ridvan.Turkmen@vista.com','5991111113','2003-04-15',25000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Kaynaklar%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Kaynakları Direktö%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ece','Güngör','Ece.Gungor@vista.com','5991111114','2018-01-02',24000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Hukuk%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Hukuk Direk%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Gaye','İkiz','Gaye.İkiz@vista.com','5991111115','2010-09-15',42000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Direktörü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Haluk','Bilginer','Haluk.Bilginer@vista.com','5991111116','2006-11-13',13500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Yardım%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yardım Masası Direktörü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Özlem','Öztürk','ozlem.ozturk@vista.com','5991111117','2012-11-30',12000,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Direktörü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Hilal','Akay','Hilal.Akay@vista.com','5991111118','2007-12-24',20000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Direktö%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Mine','Oğuz','Mine.Oguz@vista.com','5991111119','2014-02-21',45000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Bilgi Teknoloji Direktörü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Mustafa','Karataş','Mustafa.Karatas@vista.com','5991111120','2014-02-21',25000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Mimarı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Bilgi Teknoloji Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Gülcan','Özcan','Gulcan.ozcan@vista.com','5991111121','2012-11-30',25000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Müdürü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Bilgi Teknoloji Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Giray','Mesut','Giray.Mesut@vista.com','5991111122','2005-07-11',20500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Sistem ve Network Müdürü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Bilgi Teknoloji Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Nilay','Çiçek','Nilay.cicek@vista.com','5991111123','2011-01-09',26000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Müdürü%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ebru','Çelik','Ebru.celik@vista.com','5991111124','2014-10-14',18000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Müdür Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdürü%'));

INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ali','Turan','Ali.Turan@vista.com','5991111125','2020-04-01',6200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Kaynaklar%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Kaynakları Uzman Yard%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ahmet','Büyük','Ahmet.Buyuk@vista.com','5991111126','2016-03-18',8600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Can','Türk','Can.Turk@vista.com','5991111127','2014-02-21',8300,(SELECT  Id FROM Department WHERE DepName LIKE N'%Kaynaklar%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Kaynakları Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Aziz','Keskin','Aziz.Keskin@vista.com','5991111128','2011-01-09',8400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Adnan','Gültekin','Adnan.Gultekin@vista.com','5991111129','2014-08-26',9800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Danışmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Talat','Şanlı','Talat.sanli@vista.com','5991111130','2012-11-30',9500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Kaynaklar%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Kaynakları Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Kamuran','Kece','Kamuran.Kece@vista.com','5991111131','2010-09-08',10500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Danışmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Turgut','Uyar','Turgut.Uyar@vista.com','5991111132','2005-03-09',15200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Mühendisi%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Sibel','Can','Sibel.Can@vista.com','5991111133','2001-08-19',8400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Sistem Analisti%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Mesut','Can','Mesut.Can@vista.com','5991111134','2010-09-15',10500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Sistem Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Sistem ve Network Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Emre','Yıldız','Remzi.Yildiz@vista.com','5991111135','2010-09-10',11000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Network Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Sistem ve Network Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Didem','Oğuz','Didem.Oguz@vista.com','5991111136','2006-11-13',13500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Danışmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Mustafa','Yüksel','Mustafa.Yuksel@vista.com','5991111137','2007-12-24',8250,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Sistem Analisti%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Betül','Şeker','Betul.seker@vista.com','5991111138','2014-10-14',14280,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Danışmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Nihan','Tokgöz','Nihan.Tokgoz@vista.com','5991111139','2020-04-01',6350,(SELECT  Id FROM Department WHERE DepName LIKE N'%Kaynaklar%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Kaynakları Uzman Yard%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Seçil','Arslan','Secil.Arslan@vista.com','5991111140','2016-03-18',8100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Oğuz','Karan','Oguz.Karan@vista.com','5991111141','2011-01-09',7250,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%ş Analisti%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Aydan','Köroğlu','Aydan.Koroglu@vista.com','5991111142','2010-09-08',16400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yazılım Danışmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Aytaç','Çakır','Aytac.cakir@vista.com','5991111143','2005-03-09',7500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Bilgi%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Sistem Analisti%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yazılım Müdürü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Asya','Melek','Asya.Melek@vista.com','5991111144','2001-08-19',5500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Uzman Yardım%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Necati','Bilmez','Necati.Bilmez@vista.com','5991111145','2003-04-15',5400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Yardım%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yardım Masası Uzman%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yardım Masası Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Serkan','Tezgel','Serkan.Tezgel@vista.com','5991111146','2007-12-24',5800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Yardım%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Yardım Masası Uzman%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yardım Masası Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Vesile','Caymaz','Vesile.Caymaz@vista.com','5991111147','2014-10-14',5500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Semih','Konuşkan','Semih.Konuskan@vista.com','5991111148','2020-04-01',5800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Hülya','Çetin','Hulya.cetin@vista.com','5991111149','2018-01-02',5800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Uzman Yardım%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Uras','Seçkin','Uras.Seckin@vista.com','5991111150','2016-03-18',6200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Volkan','Canlı','Volkan.Canli@vista.com','5991111151','2014-02-21',6100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Özlem','Köz','ozlem.Koz@vista.com','5991111152','2011-01-09',7000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Servet','Köksal','Servet.Koksal@vista.com','5991111153','2014-08-26',6000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Uzman Yardım%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ertan','Semercioğlu','Ertan.Semercioglu@vista.com','5991111154','2012-11-30',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('İdris','Hasancebi','İdris.Hasancebi@vista.com','5991111155','2010-09-08',7250,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Alp','Nurcan','Alp.Nurcan@vista.com','5991111156','2005-03-09',7150,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Çelik','Delen','celik.Delen@vista.com','5991111157','2001-08-19',7600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Derin','Hangül','Derin.Hangul@vista.com','5991111158','2003-04-15',7500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Gözde','Özdal','Gozde.ozdal@vista.com','5991111159','2010-09-15',7400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Erkan','Çetinoğlu','Erkan.cetinoglu@vista.com','5991111160','2006-11-13',5300,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Sevde','Bozdoğan','Sevde.Bozdogan@vista.com','5991111161','2007-12-24',5900,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Vildan','Atasever','Vildan.Atasever@vista.com','5991111162','2014-10-14',7400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cansu','Öztürk','Cansu.ozturk@vista.com','5991111163','2020-04-01',6000,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Andaç','Dönmez','Andac.Donmez@vista.com','5991111164','2018-01-02',4500,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Hilal','Kaya','Hilal.Kaya@vista.com','5991111165','2016-03-18',4700,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Melis','Gündüz','Melis.Gunduz@vista.com','5991111166','2014-02-21',4300,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Fatih','Demir','Fatih.Demir@vista.com','5991111167','2014-08-26',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Satınalma%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Satınalma Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Furkan','Çınar','Furkan.cinar@vista.com','5991111168','2010-09-08',4700,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cenk','Pekyaman','Cenk.Pekyaman@vista.com','5991111169','2005-03-09',5100,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Yeşim','Ayten','Yesim.Ayten@vista.com','5991111170','2001-08-19',4800,(SELECT  Id FROM Department WHERE DepName LIKE N'%dari%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%dari İşler Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Nur','Tarlakazan','Nur.Tarlakazan@vista.com','5991111171','2003-04-15',5400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cihan','Babataş','Cihan.Babatas@vista.com','5991111172','2010-09-15',5800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('İrem','Dağlıoğlu','İrem.Daglioglu@vista.com','5991111173','2006-11-13',5700,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Özlem','Altınay','ozlem.Altinay@vista.com','5991111174','2020-04-01',7300,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Teoman','Sevinç','Teoman.Sevinc@vista.com','5991111175','2018-01-02',7450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Hande','Şen','Hande.sen@vista.com','5991111176','2016-03-18',6900,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Selime','Işık','Selime.Isik@vista.com','5991111177','2014-02-21',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Murat','Buluç','Murat.Buluc@vista.com','5991111178','2011-01-09',7200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Sertaç','Sertaç','Sertac.Sertac@vista.com','5991111179','2014-08-26',5500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cemil','İpekçi','Cemil.İpekci@vista.com','5991111180','2012-11-30',5600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Kaan','Malkoç','Kaan.Malkoc@vista.com','5991111181','2010-09-08',6200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Uğur','Mert','Ugur.Mert@vista.com','5991111182','2005-03-09',6100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Gizem','Çolak','Gizem.colak@vista.com','5991111183','2001-08-19',6300,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Burak','Güler','Burak.Guler@vista.com','5991111184','2003-04-15',6800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Derya','Toygar','Derya.Toygar@vista.com','5991111185','2010-09-15',6600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Gamze','Tuna','Gamze.Tuna@vista.com','5991111186','2006-11-13',6400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Erol','Sağlam','Erol.Saglam@vista.com','5991111187','2007-12-24',7500,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Yusuf','Keskiner','Yusuf.Keskiner@vista.com','5991111188','2014-10-14',7200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Şule','Atalar','sule.Atalar@vista.com','5991111189','2020-04-01',7150,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Enes','Sartekin','Enes.Sartekin@vista.com','5991111190','2018-01-02',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Perihan','Güloğlu','Perihan.Guloglu@vista.com','5991111191','2016-03-18',7450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Necdet','Polat','Necdet.Polat@vista.com','5991111192','2014-02-21',7200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Öznur','Öger','oznur.oger@vista.com','5991111193','2011-01-09',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Engin','Çelimli','Engin.celimli@vista.com','5991111194','2014-08-26',7450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Alptuğ','Sencer','Alptug.Sencer@vista.com','5991111195','2012-11-30',6900,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Zuhal','Kuru','Zuhal.Kuru@vista.com','5991111196','2010-09-08',5900,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Zeynep','Taher','Zeynep.Taher@vista.com','5991111197','2005-03-09',6200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Servet','Yıldırım','Servet.Yildirim@vista.com','5991111198','2001-08-19',6100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Emin','Serhat','Emin.Serhat@vista.com','5991111199','2003-04-15',5800,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cemil','Onan','Cemil.Onan@vista.com','5991111200','2010-09-15',7600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Erdem','Kahveci','Erdem.Kahveci@vista.com','5991111201','2006-11-13',7200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Sami','Narmanlı','Sami.Narmanli@vista.com','5991111202','2007-12-24',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Anıl','Doğu','Anil.Dogu@vista.com','5991111203','2014-10-14',7450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Ufuk','Yıldırım','Ufuk.Yildirim@vista.com','5991111204','2020-04-01',7200,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Fethiye','Yılmaz','Fethiye.Yilmaz@vista.com','5991111205','2018-01-02',7100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Büşra','Yaslı','Busra.Yasli@vista.com','5991111206','2016-03-18',7450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzmanı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Cihan','Yaman','Cihan.Yaman@vista.com','5991111207','2014-02-21',5400,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Mehmet','Bilir','Mehmet.Bilir@vista.com','5991111208','2011-01-09',5700,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Hamza','Arzuman','Hamza.Arzuman@vista.com','5991111209','2014-08-26',5600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Aksel','Çelik','Aksel.celik@vista.com','5991111210','2012-11-30',5100,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Nurcan','Yıldız','Nurcan.Yildiz@vista.com','5991111211','2010-09-08',5600,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Yıldız','Kenter','Yildiz.Kenter@vista.com','5991111212','2005-03-09',5450,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));
INSERT INTO Employee(Name,Surname,Email,PhoneNumber,StartDate,Salary,DepartmentId,TitleId,ManagerId)VALUES('Burçak','Sezen','Burcak.Sezen@vista.com','5991111213','2001-08-19',5350,(SELECT  Id FROM Department WHERE DepName LIKE N'%Operasyon%' FETCH FIRST 1 ROW only),(SELECT Id FROM Title WHERE Name LIKE N'%Operasyon Uzman Yardımcısı%'),(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Müdür Yardımcısı%'));


INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Genel Müdür'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Genel Müdür'));

INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Kaynakları Direktö%'));


INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Hukuk Direk%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Hukuk Direk%'));


INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Operasyon Direktörü%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Operasyon Direktörü%'));


INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Yardım Masası Direktörü%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Yardım Masası Direktörü%'));

INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%dari İşler Direktörü%'));


INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Satınalma Direktö%'));



INSERT INTO DepartmentManager(DepartmentId,ManagerId)VALUES((SELECT d.Id FROM Department d
inner join Title t on t.DepartmentId=d.Id
WHERE t.Name LIKE N'%Bilgi Teknoloji Direktörü%'),
(SELECT e.Id FROM Employee e
inner join Department d on d.Id=e.DepartmentId
inner join Title t on t.DepartmentId=d.Id and e.TitleId=t.Id
WHERE t.Name LIKE N'%Bilgi Teknoloji Direktörü%'));


