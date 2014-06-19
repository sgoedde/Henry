--Stephanie Goedde
--Database II
--Re-Create Henry's DB
--2-10-13

-- The following checks to see if the TABLE exists
-- before attempting to drop it.
Go 
If Exists (Select name FRom sysobjects WHERE name = N'Inventory' And type = 'U')
Drop Table Inventory
Go 
If exists(SELECT name From sysobjects WHERE name = N'Wrote' and Type = 'U')
DROP TABLE Wrote
Go
If exists(SELECT name From sysobjects WHERE name = N'BRANCH' and Type = 'U')
DROP TABLE BRANCH
Go 
If exists(SELECT name From sysobjects WHERE name = N'AUthor' and Type = 'U')
DROP TABLE Author
Go 
If exists(SELECT name From sysobjects WHERE name = N'Book' and Type = 'U')
DROP TABLE Book
Go
If exists(SELECT name From sysobjects WHERE name = N'Publisher' and Type = 'U')
DROP TABLE Publisher



CREATE TABLE BRANCH
(Branch_Number CHAR(2) NOT NULL,
Branch_Name CHAR(20),
Branch_Location CHAR(20),
Number_Employees Decimal(2),
CONSTRAINT pk_BRANCH_NUMBER PRIMARY KEY (Branch_Number),
);


CREATE TABLE Publisher
(Publisher_Code char(2)Not Null,
Publisher_Name Varchar(20),
Publisher_City Char(20),
Publisher_State Char(2),
Constraint PK_Publisher_Code PRIMARY KEY (Publisher_Code),
);

Create Table Author
(Author_Number Char(2) Not Null,
Author_Last Varchar(15),
Author_First Varchar(10),
Constraint PK_Author_Number PRIMARY KEY (Author_Number),
);

Create Table Book
(Book_Code Char(4) Not Null,
Book_Title Varchar(30),
Publisher_Code Char(2),
Book_Type Char(3),
Book_Price Decimal(4,2),
Paper_Back Char(1),
Constraint PK_Book_Code PRIMARY KEY (Book_Code),
Constraint FK_Publisher_Code FOREIGN KEY (Publisher_Code)
References Publisher(Publisher_Code)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);


Create Table Wrote
(Book_Code Char(4)Not Null,
Author_Number Char(2)Not Null,
Sequence_Number Tinyint,
Constraint PK_Wrote PRIMARY KEY (Book_Code, Author_Number),
Constraint FK_Book_Code FOREIGN KEY (Book_Code)
References Book (Book_Code)
ON DELETE CASCADE
ON UPDATE CASCADE,
Constraint FK_Author_Number Foreign KEY (Author_Number)
References Author(Author_Number)
ON DELETE CASCADE
ON UPDATE CASCADE,
);



Create Table Inventory
(Book_Code Char(4)Not Null,
Branch_Number Char(2)Not Null,
Unit_On_Hand Tinyint,
Constraint PK_Inventory PRIMARY KEY (Book_Code, Branch_Number),
Constraint FR_Book_Code FOREIGN KEY (Book_Code)
References Book(Book_Code)
ON DELETE CASCADE
ON UPDATE CASCADE,
Constraint FR_Branch_Number FOREIGN KEY (Branch_Number)
References Branch (Branch_Number)
ON DELETE CASCADE
ON UPDATE CASCADE,
);



Insert Into Branch Values
('1', 'Henrys Downtown', '16 Riverview', '10')
Insert Into Branch Values
('2', 'Henrys On the Hill', 'Brentwood Mall', '06')
Insert Into Branch Values
('3', 'Henrys Brentwood', 'Brentwood Mall', '15')
Insert Into Branch Values
('4', 'Henrys Eastshore', 'Eastshore Mall', '09');

Insert Into Publisher Values
('AH', 'Arkham House Publ.', 'Cauk City', 'WI')
Insert Into Publisher Values
('AP', 'Areade Publishing', 'New York', 'NY')
Insert Into Publisher Values
('AW', 'Addison Wesley', 'Reading', 'MA')
Insert Into Publisher Values
('BB', 'Bantam Books', 'New York', 'NY')
Insert Into Publisher Values
('BF', 'Best and Furrow', 'Boston', 'MA')
Insert Into Publisher Values
('JT', 'Jeremy P. Tarcher', 'Los Angels', 'LA')
Insert Into Publisher Values
('MP', 'McPherson and Co.', 'Kingston', 'NY')
Insert Into Publisher Values
('PB', 'Pocket Books', 'New York', 'NY')
Insert Into Publisher Values
('RH', 'Random House', 'New York', 'NY')
Insert Into Publisher Values
('RZ', 'Rizolli', 'New York', 'NY')
Insert Into Publisher Values
('SB', 'Schoken Books', 'New York', 'NY')
Insert Into Publisher Values
('SI', 'Signet','New York', 'NY')
Insert Into Publisher Values
('TH', 'Thames and Hudson', 'New York', 'NY')
Insert Into Publisher Values
('WN', 'W.W.Norton and Co.', 'New York', 'NY')
;


Insert Into Author Values
('01','Archer', 'Jeffrey')
Insert Into Author Values
('02', 'Christie', 'Agatha')
Insert Into Author Values
('03', 'Calrk', 'Arthur C.')
Insert Into Author Values
('04', 'Francis', 'Dick')
Insert Into Author Values
('05', 'Cussler', 'Clive')
Insert Into Author Values
('06', 'King', 'Stephen')
Insert Into Author Values
('07', 'Pratt', 'Philip')
Insert Into Author Values
('08', 'Adamski', 'Joseph')
Insert Into Author Values
('10', 'Harmon', 'Willis')
Insert Into Author Values
('11', 'Rheingold', 'Howard')
Insert Into Author Values
('12', 'Owen', 'Barbara')
Insert Into Author Values
('13', 'Williams', 'Peter')
Insert Into Author Values
('14', 'Kafka', 'Frank')
Insert Into Author (Author_Number, Author_Last)
 Values('15', 'Novalis')
Insert Into Author Values
('16', 'LoveCraft', 'HP')
Insert Into Author Values
('17', 'Paz', 'Octavio')
Insert Into Author Values
('18', 'Camus', 'Albert')
Insert Into Author Values
('19', 'Casteleman', 'Riva')
Insert Into Author Values
('20', 'Zinbardo', 'Philip')
Insert Into Author Values
('21', 'Gimferrer', 'Pere')
Insert Into Author Values 
('22', 'SouthWorth', 'Rod')
Insert Into Author Values
('23', 'Wray', 'Robert');


Insert Into book Values
('0180', 'Shyness', 'BB', 'PSY','7.65', 'Y')
Insert Into book Values
('0189', 'Kane and Abel', 'PB','FIC', '5.55', 'Y')
Insert Into book Values
('0200', 'Stranger', 'BB', 'HOR', '8.75', 'N')
Insert Into book Values
('0378', 'Dunwich Horror and Others', 'PB', 'HOR', '19.75', 'N')
Insert Into book Values
('079X', 'Somokescreen', 'PB', 'MYS', '4.55', 'Y')
Insert Into book Values
('0808', 'Knockdown', 'PB', 'MYS', '4.75', 'Y')
Insert Into book Values
('1351','Cujo', 'SI', 'HOR', '6.65', 'Y')
Insert Into book Values
('1382', 'Marcel Duchamp', 'PB', 'ART', '11.25', 'Y')
Insert Into book Values
('138X', 'Death On the Nile', 'BB', 'MYS','3.95', 'Y')
Insert Into book Values
('2226', 'Ghost from the Grand Banks', 'BB', 'SFI', '19.95', 'N')
Insert Into book Values
('2281', 'Prints of the 2oth century', 'PB', 'ART', '13.25', 'Y')
Insert Into book Values
('2766', 'Prodigal Daughter', 'PB', 'FIC', '5.45', 'Y')
Insert Into book Values
('2908', 'Hymns to the Night', 'BB','POE', '6.75', 'Y')
Insert Into book Values
('3350', 'Higher Creativity', 'PB', 'PSY', '9.75', 'Y')
Insert Into book Values
('3743', 'First Among Equals', 'PB', 'FIC', '3.95', 'Y')
Insert Into book Values
('3906', 'Vortex', 'BB', 'SUS', '5.45', 'Y')
Insert Into book Values
('5163', 'Organ', 'SI', 'MUS', '16.95', 'Y')
Insert Into book Values
('5790', 'Database Systems', 'BF', 'CS', '54.95', 'N')
Insert Into book Values
('6128', 'Evil Unde the Sun', 'PB', 'MYS', '4.45', 'Y')
Insert Into book Values
('6328', 'Vixen 07', 'BB', 'SUS','5.55','Y')
Insert Into book Values
('669X', 'A Guide to SQL', 'BF', 'CS', '20.50', 'Y')
Insert Into book Values
('6908', 'DOS Essentials', 'BF', 'CS', '20.50', 'Y')
Insert Into book Values
('7405', 'Night Probe', 'BB', 'SUS', '5.65', 'Y')
Insert Into book Values
('7443', 'Carrie', 'SI', 'HOR', '6.75', 'Y')
Insert Into book Values
('7559', 'Risk', 'PB', 'MYS', '3.95', 'Y')
Insert Into book Values
('7947', 'dBASE Programming', 'BF', 'CS', '39.90', 'Y')
Insert Into book Values
('8092', 'Magritte', 'SI', 'ART', '21.95', 'N')
Insert Into book Values
('8720', 'Castle', 'BB', 'FIC', '12.15', 'Y')
Insert Into book Values
('9611', 'Amerika', 'BB', 'FIC', '10.95', 'Y');


Insert Into Wrote Values
('0180', '20', '1')
Insert Into Wrote Values
('0189', '01', '1')
Insert Into Wrote Values
('0200', '18', '1')
Insert Into Wrote Values
('0378', '16', '1')
Insert Into Wrote Values
('079X', '04', '1')
Insert Into Wrote Values
('0808', '04', '1')
Insert Into Wrote Values
('1351','06', '1')
Insert Into Wrote Values
('1382', '17', '1')
Insert Into Wrote Values
('138X', '02', '1')
Insert Into Wrote Values
('2226', '03', '1')
Insert Into Wrote Values
('2281', '19', '1')
Insert Into Wrote Values
('2766', '01', '1')
Insert Into Wrote Values
('2908', '15', '1')
Insert Into Wrote Values
('3350', '10', '1')
Insert Into Wrote Values
('3350', '11', '2')
Insert Into Wrote Values
('3743', '01', '1')
Insert Into Wrote Values
('3906', '05', '1')
Insert Into Wrote Values
('5163', '12', '2' )
Insert Into Wrote Values
('5163', '13', '1' )
Insert Into Wrote Values
('5790', '07', '1')
Insert Into Wrote Values
('5790', '08', '2')
Insert Into Wrote Values
('6128', '02', '1')
Insert Into Wrote Values
('6328', '05', '1')
Insert Into Wrote Values
('669X', '07', '1')
Insert Into Wrote Values
('6908', '22', '1')
Insert Into Wrote Values
('7405', '05', '1')
Insert Into Wrote Values
('7443', '06', '1')
Insert Into Wrote Values
('7559', '04', '1')
Insert Into Wrote Values
('7947', '07', '1')
Insert Into Wrote Values
('7947', '23', '2')
Insert Into Wrote Values
('8092', '21', '1')
Insert Into Wrote Values
('8720', '14', '1')
Insert Into Wrote Values
('9611', '14', '1');


Insert Into Inventory Values
('0180', '1', '2')
Insert Into Inventory Values
('0189', '2', '2')
Insert Into Inventory Values
('0200', '1', '1')
Insert Into Inventory Values
('0200', '2', '3')
Insert Into Inventory Values
('079X', '2', '1')
Insert Into Inventory Values
('079X', '3', '2')
Insert Into Inventory Values
('079X', '4', '3')
Insert Into Inventory Values
('1351','1', '1')
Insert Into Inventory Values
('1351','2', '4')
Insert Into Inventory Values
('1351','3', '2')
Insert Into Inventory Values
('138X', '2', '3')
Insert Into Inventory Values
('2226', '1', '3')
Insert Into Inventory Values
('2226', '3', '2')
Insert Into Inventory Values
('2226', '4', '1')
Insert Into Inventory Values
('2281', '4', '3')
Insert Into Inventory Values
('2766', '3', '2')
Insert Into Inventory Values
('2908', '1', '3')
Insert Into Inventory Values
('2908', '4', '1')
Insert Into Inventory Values
('3350', '1', '2')
Insert Into Inventory Values
('3906', '2', '1')
Insert Into Inventory Values
('3906', '3', '2')
Insert Into Inventory Values
('5163', '1', '1' )
Insert Into Inventory Values
('5790', '4', '2')
Insert Into Inventory Values
('6128', '2', '4')
Insert Into Inventory Values
('6128', '3', '3')
Insert Into Inventory Values
('6328', '2', '2')
Insert Into Inventory Values
('669X', '1', '1')
Insert Into Inventory Values
('6908', '2', '2')
Insert Into Inventory Values
('7405', '3', '2')
Insert Into Inventory Values
('7559', '2', '2')
Insert Into Inventory Values
('7947', '2', '2')
Insert Into Inventory Values
('8092', '1', '3')
Insert Into Inventory Values
('8720', '1', '3')
Insert Into Inventory Values
('9611', '1', '2');
 


