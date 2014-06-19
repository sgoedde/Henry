--Stephanie Goedde
--Database II
--Query Assign 4
--3-14-13

print 'qry1'
begin transaction
select * from inventory where branch_number = '1';
update inventory set units_on_hand = '5' where branch_number = '1';
select * from inventory where branch_number = '1';
rollback;

print 'qry2'
begin transaction
select * from book where publisher_code = 'BB'
update book set book_price = book_price/1.03 where publisher_code = 'BB'
select * from book where publisher_code = 'BB'
rollback;

print 'qry3'
begin transaction
select * from wrote inner join (book inner join inventory on book.book_code = inventory.book_code) 
on wrote.book_code = book.book_code 
insert into book values
('9700', 'Using Microsoft Access 2010', 'BF', 'CS', '39.97', 'Y')
insert into inventory values
('9700', '1', '4')
insert into wrote values
('9700', '07', '2')
select * from wrote inner join (book inner join inventory on book.book_code = inventory.book_code) 
on wrote.book_code = book.book_code
rollback;

print 'qry4'
begin transaction
select * from author where author_last = 'Wray' and author_first = 'Robert'
delete from author where author_last = 'Wray' and author_first = 'Robert'
select * from author where author_last = 'Wray' and author_first = 'Robert'
rollback;

print 'qry5'
Create Table Fiction
(Book_Code Char(4) Not Null,
 Book_Title Varchar(30),
 Book_Price Decimal(4,2),
 Constraint PK_Fiction_Book_Code PRIMARY KEY (Book_Code),
);

insert into Fiction values('0189', 'Kane and Abel', '5.55')
insert into Fiction values('2766', 'Prodigal Daughter', '5.45')
insert into Fiction values('3743', 'First Among Equals', '3.95')
insert into Fiction values('8720', 'Castle', '12.15')
insert into Fiction values('9611', 'Amerika', '10.95')
;

print 'qry6'
Select * from Fiction;
update Fiction set Book_Price = Book_Price*1.12;
select * from Fiction;

print 'qry7'
select * from fiction;
update Fiction set Book_Price = null where Book_Title = 'Amerika';
select * from Fiction;

print 'qry8'
select * from Fiction;
alter table fiction add best_seller char(1) not null default 'N';
select * from Fiction;

print 'qry9'
select * from Fiction;
update Fiction set best_seller = 'Y' where Book_Title = 'Amerika';
select * from fiction;

print 'qry10'
exec spDescribe Fiction;
alter table fiction alter column book_title varchar(50);
exec spDescribe Fiction;

print 'qry11'
alter table fiction alter column best_seller char(1) not null;
exec spDescribe Fiction;

print 'qry12'
alter table fiction alter column best_seller char(1) null;
exec spDescribe Fiction;

print 'qry13'
select * from Fiction;
delete from Fiction where best_seller = 'Y';
select * from Fiction;

print 'qry14'
drop table fiction;
select * from Fiction;