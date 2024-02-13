-- show databases;
create database Book_Publishing_Company;
-- drop database Book_Publishing_Company;
use Book_Publishing_Company;

-- show tables;
-- SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'Book_Publishing_Company';


create table Book(
Book_isbn varchar(50) not null,
Title varchar(100) not null,
Year_ int ,
Month_ int,
Date_ int,
Edition varchar(50),
Format_ varchar(20),
Genre varchar(20),
No_of_pages int not null,
Price float not null,
Author varchar(50) not null,
Distributor_id varchar(50),
Contract_id varchar(50)
);

create table Author(
Author_id varchar(50) not null,
First_name varchar(100),
Last_name varchar(100),
Contact_no varchar(15),
Nationality varchar(20)

);

create table Editor(
Editor_id varchar(50) not null,
Name_ varchar(100) not null,
Contact_no varchar(15)
);

create table Publisher(
Publisher_id varchar(50) not null,
Name_ varchar(100) not null,
Contact_no varchar(15),
Book_isbn varchar(50)
);


create table Print_specialist(
Print_specialist_id varchar(50) not null,
Name_ varchar(100) not null,
Contact_no varchar(15)
);

create table Book_Language(
Book_isbn varchar(50) not null,
Language_ varchar(50) not null
);

create table Creative_Artist(
Creative_Artist_id varchar(50) not null,
Name_ varchar(100) not null,
Contact_no varchar(15)
);


create table BookStore_inventory(
Order_id varchar(50) not null,
Book_isbn varchar(50) not null,
Quantity_in_stock int
);

create table Contract(
Contract_id varchar(50) not null,
Contract_date date,
Royalty_percentage varchar(20),
Author_id varchar(50) not null,
Contract_terms int,
Book_isbn varchar(50) 
);


create table Marketing_campaign(
Platform varchar(50),
End_date varchar(50),
Campaign_period int,
Description_ varchar(50),
Campaign_name varchar(50) not null,
Start_date date,
Book_isbn varchar(50) not null
);
 
 create table Order_(
 Order_id varchar(50) not null,
 Date_ date,
 Quantity int not null,
 Total_amount int,
 Product varchar(50) 
 );


create table Customer(
 Customer_id varchar(50) not null,
 Name_ varchar(100) not null,
 Contact_no varchar(15),
 Order_id varchar(50)
 );
 
 create table Retailer(
 Retailer_id varchar(50) not null,
 Store_id varchar(50) ,
 Retailer_name varchar(100) not null,
 Contact_no varchar(15)
 );
 
 create table Distributor(
 Distributor_id varchar(50) not null,
 Location varchar(50),
 Contact_no varchar(15)
 );
 
 create table Book_Store(
 Store_id varchar(50) not null,
 Store_name varchar(50) not null,
 Location varchar(50),
 Contact_no varchar(15)
 );


create table Author_contracts (
Author_id varchar(50),
Contract_id varchar(50) 
); 

create table Book_review (
Book_isbn varchar(50),
Editor_id varchar(50) 
); 

create table Print (
Book_isbn varchar(50) ,
Print_specialist_id varchar(50) 
); 

create table Create_ (
Book_isbn varchar(50) ,
Creative_Artist_id varchar(50) 
); 

create table Book_distribution(
Book_isbn varchar(50) ,
Distributor_id varchar(50) 
); 

create table Supply(
Store_id varchar(50) ,
Distributor_id varchar(50) 
);

create table Sales(
Retailer_id varchar(50) ,
Customer_id varchar(50) 
);

create table Make_order(
Retailer_id varchar(50),
Order_id varchar(50)
);

create table Target(
Book_isbn varchar(50) ,
Platform varchar(50),
Customer_id varchar(50)
);

create table Book_order(
Book_isbn varchar(50) ,
Order_id varchar(50)
);

create table Book_author(
Book_isbn varchar(50) ,
author_id varchar(50)
);

alter table book
add constraint pk_book primary key( Book_isbn);

alter table editor
add constraint pk_editor primary key( Editor_id);

alter table author
add constraint pk_author primary key( Author_id);

alter table publisher
add constraint pk_publisher primary key( Publisher_id);

alter table Print_specialist
add constraint pk_Print_specialist primary key( Print_specialist_id);

alter table  Book_Language
add constraint pk_Book_Language primary key( Book_isbn,Language_);

alter table Creative_Artist
add constraint pk_Creative_Artist primary key( Creative_Artist_id);

alter table  Contract
add constraint pk_Contract_id primary key( Contract_id);

alter table  Customer
add constraint pk_Customer primary key( Customer_id);

alter table  Order_
add constraint pk_Order primary key( Order_id );

alter table  Retailer
add constraint pk_Retailer primary key( Retailer_id );

alter table  Distributor
add constraint pk_Distributor primary key( Distributor_id );

alter table  Marketing_campaign
add constraint pk_Marketing_campaign primary key( Book_isbn, Platform);

alter table  Target
add constraint pk_Target primary key( Book_isbn, Customer_id, Platform);

alter table  Make_order
add constraint pk_Make_order primary key( Order_id, Retailer_id);

alter table Sales
add constraint pk_Sales primary key( Customer_id, Retailer_id);

alter table Supply
add constraint pk_Supply primary key( Store_id , Distributor_id);

alter table Book_distribution
add constraint pk_Book_distribution primary key( Book_isbn , Distributor_id);

alter table Create_
add constraint pk_Book_Create_ primary key( Book_isbn , Creative_Artist_id);

alter table Print
add constraint pk_Book_Print primary key( Book_isbn , Print_specialist_id);

alter table Book_review
add constraint pk_Book_review primary key( Book_isbn , Editor_id);

alter table Author_contracts
add constraint pk_Author_contracts primary key( Author_id  , Contract_id );

alter table Book_order
add constraint pk_Book_order primary key( Book_isbn , Order_id );

alter table Book_author
add constraint pk_Book_author primary key( Book_isbn , author_id );

alter table  Book_Store
add constraint pk_Store primary key( Store_id );




-- Inserting data into the book table
insert into Book (Book_isbn, Title, Year_, Month_, Date_, Edition, Format_, Genre, No_of_pages, Price, Author, Distributor_id, Contract_id)
values
('978-0451166890', 'To Kill a Mockingbird', 1960, 7, 11, 'First', 'Paperback', 'Fiction', 324, 9.99, 'Harper', 'D001', 'C001'),
('978-0061120084', '1984', 1949, 6, 8, 'Revised', 'Hardcover', 'Science Fiction', 328, 12.99, 'George', 'D002', 'C002'),
('978-0141983042', 'The Great Gatsby', 1925, 4, 10, 'First', 'Paperback', 'Fiction', 180, 8.49, 'Scott', 'D003', 'C003'),
('978-0451524935', 'Moby-Dick', 1851, 10, 18, 'Classic', 'Hardcover', 'Adventure', 576, 14.95, 'Herman ', 'D004', 'C004'),
('978-0064407663', 'The Catcher in the Rye', 1951, 7, 16, 'Anniversary', 'Paperback', 'Fiction', 224, 10.99, 'Salinger', 'D005', 'C005'),
('978-0066620992', 'The Da Vinci Code', 2003, 3, 18, 'Special', 'Hardcover', 'Mystery', 454, 16.99, 'Brown', 'D006', 'C006'),
('978-0446675536', 'The Alchemist', 1988, 9, 1, '25th Anniversary', 'Paperback', 'Fiction', 208, 11.99, 'Coelho', 'D007', 'C007'),
('978-1400032716', 'The Kite Runner', 2003, 6, 2, 'First', 'Paperback', 'Drama', 371, 13.49, 'Khaled ', 'D008', 'C008');

select * from book;

UPDATE Book
SET Price = 10.99
WHERE Book_isbn = '978-0451166890';

UPDATE Book
SET Format_ = 'Paperback', Edition = 'Revised'
WHERE Book_isbn = '978-0451524935';

DELETE FROM book
WHERE Author = 'George';



insert into Author (Author_id, First_name, Last_name, Contact_no, Nationality)
values
('A001', 'Harper ' ,'Scott', '555-123-4567', 'American'),
('A002', 'George ', 'Marry','555-234-5678', 'British'),
('A003', 'Scott' ,'Fitzgerald', '555-345-6789', 'American'),
('A004', 'Herman',' Melville', '555-456-7890', 'American'),
('A005', ' Salinger','John', '555-567-8901', 'American'),
('A006', 'Dan','Brown', '555-678-9012', 'American'),
('A007', 'Paulo',' Coelho', '555-789-0123', 'Brazilian'),
('A008', 'Khaled',' Hosseini', '555-890-1234', 'Afghan');

select * from author;

UPDATE Author
SET Contact_no = '555-111-2222'
WHERE Author_id = 'A001';

UPDATE Author
SET Nationality = 'French'
WHERE Author_id = 'A003';

DELETE FROM Author
WHERE Contact_no IS NULL;


-- Inserting data into the Editor table
insert into Editor (Editor_id, Name_, Contact_no)
values
('E001', 'John Smith', '555-123-4567'),
('E002', 'Jane Doe', '555-234-5678'),
('E003', 'Robert Johnson', '555-345-6789'),
('E004', 'Emily Wilson', '555-456-7890'),
('E005', 'David Brown', '555-567-8901'),
('E006', 'Jennifer Lee', '555-678-9012'),
('E007', 'Michael Taylor', '555-789-0123'),
('E008', 'Susan Anderson', '555-890-1234');

select * from editor;

UPDATE Editor
SET Contact_no = '555-111-2222'
WHERE Editor_id = 'E001';

UPDATE Editor
SET Name_ = 'Robert'
WHERE Editor_id = 'E003';

DELETE FROM editor
WHERE Contact_no IS NULL;


-- Inserting data into the Publisher table
insert into Publisher (Publisher_id, Name_, Contact_no, Book_isbn)
values
('P001', 'Random House', '555-123-4567', '978-0451166890'),
('P002', 'Penguin Books', '555-234-5678', '978-0061120084'),
('P003', 'HarperCollins', '555-345-6789', '978-0141983042'),
('P004', 'Herman Melville Publications', '555-456-7890', '978-0451524935'),
('P005', 'Little, Brown and Company', '555-567-8901', '978-0064407663'),
('P006', 'Doubleday', '555-678-9012', '978-0066620992'),
('P007', 'HarperOne', '555-789-0123', '978-0446675536'),
('P008', 'Riverhead Books', '555-890-1234', '978-1400032716');

select * from publisher;

UPDATE Publisher
SET Contact_no = '555-111-2222'
WHERE Publisher_id = 'P001';

UPDATE Publisher
SET Name_ = 'HarperCollins Publishing'
WHERE Publisher_id = 'P003';

DELETE FROM publisher
WHERE Book_isbn IS NULL;


-- Inserting data into the Print_specialist table
insert into Print_specialist (Print_specialist_id, Name_, Contact_no)
values
('PS001', 'John', '555-123-4567'),
('PS002', 'Sarah', '555-234-5678'),
('PS003', 'Robert', '555-345-6789'),
('PS004', 'Emily', '555-456-7890'),
('PS005', 'David', '555-567-8901'),
('PS006', 'Jennifer', '555-678-9012'),
('PS007', 'Michael', '555-789-0123'),
('PS008', 'Susan', '555-890-1234');

select * from Print_specialist ;

UPDATE Print_specialist
SET Contact_no = '555-111-2222'
WHERE Print_specialist_id = 'PS001';

UPDATE Print_specialist
SET Name_ = 'Robert '
WHERE Print_specialist_id = 'PS003';

DELETE FROM print_specialist
WHERE Name_ LIKE 'Smith%';


-- Inserting data into the Book_Language table
insert into Book_Language (Book_isbn, Language_)
values
('978-0451166890', 'English'),
('978-0061120084', 'English'),
('978-0141983042', 'English'),
('978-0451524935', 'English'),
('978-0064407663', 'English'),
('978-0066620992', 'English'),
('978-0446675536', 'English'),
('978-1400032716', 'English');

select * from book_language ;

UPDATE Book_Language
SET Language_ = 'Spanish'
WHERE Book_isbn = '978-0451166890';

UPDATE Book_Language
SET Language_ = 'French'
WHERE Book_isbn = '978-0061120084';

DELETE FROM book_language
WHERE Book_isbn = 'ISBN123' AND Language_ = 'French';

-- Inserting data into the Creative_Artist table
insert into Creative_Artist (Creative_Artist_id, Name_, Contact_no)
values
('CA001', 'Alice Artistry', '555-123-4567'),
('CA002', 'Bob Creative', '555-234-5678'),
('CA003', 'Caroline Painter', '555-345-6789'),
('CA004', 'David Illustrator', '555-456-7890'),
('CA005', 'Eva Designer', '555-567-8901'),
('CA006', 'Frank Sculptor', '555-678-9012'),
('CA007', 'Grace Graphic', '555-789-0123'),
('CA008', 'Henry Visual', '555-890-1234');

select * from Creative_Artist  ;

UPDATE Creative_Artist
SET Name_ = 'Caroline Painterly'
WHERE Creative_Artist_id = 'CA003';

UPDATE Creative_Artist
SET Contact_no = '555-111-2222'
WHERE Creative_Artist_id = 'CA001';

DELETE FROM creative_artist
WHERE Contact_no IS NULL;

-- Inserting data into the BookStore_inventory table
insert into BookStore_inventory (Order_id, Book_isbn, Quantity_in_stock)
values
('O001', '978-0451166890', 50),
('O002', '978-0061120084', 75),
('O003', '978-0141983042', 60),
('O004', '978-0451524935', 45),
('O005', '978-0064407663', 65),
('O006', '978-0066620992', 80),
('O007', '978-0446675536', 55),
('O008', '978-1400032716', 70);

select * from BookStore_inventory ;

UPDATE BookStore_inventory
SET Quantity_in_stock = 55
WHERE Book_isbn = '978-0451166890';

UPDATE BookStore_inventory
SET Order_id = 'O009'
WHERE Book_isbn = '978-0061120084';

DELETE FROM bookstore_inventory
WHERE Quantity_in_stock < 10;


-- Inserting data into the Contract table
insert into Contract (Contract_id, Contract_date, Royalty_percentage, Author_id, Contract_terms, Book_isbn)
values
('C001', '2023-01-15', '15%', 'A001', 5, '978-0451166890'),
('C002', '2023-02-20', '12%', 'A002', 4, '978-0061120084'),
('C003', '2023-03-25', '14%', 'A003', 3, '978-0141983042'),
('C004', '2023-04-10', '13%', 'A004', 4, '978-0451524935'),
('C005', '2023-05-05', '10%', 'A005', 5, '978-0064407663'),
('C006', '2023-06-12', '16%', 'A006', 3, '978-0066620992'),
('C007', '2023-07-17', '11%', 'A007', 5, '978-0446675536'),
('C008', '2023-08-22', '12%', 'A008', 4, '978-1400032716');

select * from contract;

UPDATE Contract
SET Royalty_percentage = '17%'
WHERE Contract_id = 'C001';

UPDATE Contract
SET Contract_terms = 5
WHERE Contract_id = 'C003';

DELETE FROM contract
WHERE Royalty_percentage < '10%';



-- Inserting data into the Marketing_campaign table
insert into Marketing_campaign (Platform, End_date, Campaign_period, Description_, Campaign_name, Start_date, Book_isbn)
values
('Social Media', '2023-02-28', 30, 'Book Launch Promotion', 'Campaign 1', '2023-01-29', '978-0451166890'),
('Email Marketing', '2023-03-15', 45, 'Spring Sale Promotion', 'Campaign 2', '2023-01-30', '978-0061120084'),
('Online Ads', '2023-04-10', 40, 'Summer Reading Special', 'Campaign 3', '2023-02-28', '978-0141983042'),
('Bookstore Displays', '2023-05-31', 60, 'Author Signing Event', 'Campaign 4', '2023-03-01', '978-0451524935'),
('Social Media', '2023-06-30', 30, 'Bestseller Spotlight', 'Campaign 5', '2023-04-30', '978-0064407663'),
('Email Marketing', '2023-07-15', 45, 'Back to School Sale', 'Campaign 6', '2023-05-01', '978-0066620992'),
('Online Ads', '2023-08-10', 35, 'Summer Fiction Reads', 'Campaign 7', '2023-06-30', '978-0446675536'),
('Bookstore Displays', '2023-09-30', 60, 'New Release Showcase', 'Campaign 8', '2023-07-01', '978-1400032716');

select * from Marketing_campaign ;

UPDATE Marketing_campaign
SET Description_ = 'Book Launch and Author Meetup Promotion'
WHERE Campaign_name = 'Campaign 1';

UPDATE Marketing_campaign
SET End_date = '2023-04-15'
WHERE Campaign_name = 'Campaign 3';

DELETE FROM marketing_campaign
WHERE Book_isbn = 'ISBN123' AND Platform = 'Social Media';



insert into Order_ (Order_id, Date_, Quantity, Total_amount, Product)
values
('O001', '2023-01-15', 5, 100, 'Book - To Kill a Mockingbird'),
('O002', '2023-02-20', 8, 150, 'Book - 1984'),
('O003', '2023-03-25', 10, 120, 'Book - The Great Gatsby'),
('O004', '2023-04-10', 3, 50, 'Book - Moby-Dick'),
('O005', '2023-05-05', 6, 90, 'Book - The Catcher in the Rye'),
('O006', '2023-06-12', 12, 180, 'Book - The Da Vinci Code'),
('O007', '2023-07-17', 7, 110, 'Book - The Alchemist'),
('O008', '2023-08-22', 9, 135, 'Book - The Kite Runner');

select * from order_;

UPDATE Order_
SET Total_amount = 120
WHERE Order_id = 'O001';

UPDATE Order_
SET Quantity = 15, Product = 'Books - The Great Gatsby (Hardcover)'
WHERE Order_id = 'O003';

DELETE FROM order_
WHERE Date_ < '2023-01-01';



-- Inserting data into the Customer table
insert into Customer (Customer_id, Name_, Contact_no, Order_id)
values
('C001', 'John Doe', '555-123-4567', 'O001'),
('C002', 'Jane Smith', '555-234-5678', 'O002'),
('C003', 'Robert Johnson', '555-345-6789', 'O003'),
('C004', 'Emily Wilson', '555-456-7890', 'O004'),
('C005', 'David Brown', '555-567-8901', 'O005'),
('C006', 'Jennifer Lee', '555-678-9012', 'O006'),
('C007', 'Michael Taylor', '555-789-0123', 'O007'),
('C008', 'Susan Anderson', '555-890-1234', 'O008');

select * from customer;

UPDATE Customer
SET Contact_no = '555-345-6789'
WHERE Customer_id = 'C002';

UPDATE Customer
SET Name_ = 'Daniel Brown', Contact_no = '555-555-5555'
WHERE Customer_id = 'C005';

DELETE FROM customer
WHERE Contact_no IS NULL;


-- Inserting data into the Retailer table
insert into Retailer (Retailer_id, Store_id, Retailer_name, Contact_no)
values
('R001', 'S001', 'Books Unlimited', '555-123-4567'),
('R002', 'S002', 'Readers Paradise', '555-234-5678'),
('R003', 'S003', 'Novel Nook', '555-345-6789'),
('R004', 'S004', 'Bookworms Emporium', '555-456-7890'),
('R005', 'S005', 'Page Turners', '555-567-8901'),
('R006', 'S006', 'Chapter & Verse', '555-678-9012'),
('R007', 'S007', 'Literary Lounge', '555-789-0123'),
('R008', 'S008', 'Book Haven', '555-890-1234');

select * from retailer ;

UPDATE Retailer
SET Contact_no = '555-555-5555'
WHERE Retailer_id = 'R002';

UPDATE Retailer
SET Retailer_name = 'Novel Haven'
WHERE Retailer_id = 'R003';

DELETE FROM retailer
WHERE Store_id IS NULL;


-- Inserting data into the Distributor table
insert into Distributor (Distributor_id, Location, Contact_no)
values
('D001', 'New York', '555-123-4567'),
('D002', 'Los Angeles', '555-234-5678'),
('D003', 'Chicago', '555-345-6789'),
('D004', 'Houston', '555-456-7890'),
('D005', 'Miami', '555-567-8901'),
('D006', 'San Francisco', '555-678-9012'),
('D007', 'Dallas', '555-789-0123'),
('D008', 'Atlanta', '555-890-1234');

select * from distributor;

UPDATE Distributor
SET Contact_no = '555-999-8888'
WHERE Distributor_id = 'D001';

UPDATE Distributor
SET Location = 'Seattle'
WHERE Distributor_id = 'D002';

DELETE FROM distributor
WHERE Contact_no IS NULL;


-- Inserting data into the Book_Store table
insert into Book_Store (Store_id, Store_name, Location, Contact_no)
values
('S001', 'Books Unlimited', 'New York', '555-123-4567'),
('S002', 'Readers Paradise', 'Los Angeles', '555-234-5678'),
('S003', 'Novel Nook', 'Chicago', '555-345-6789'),
('S004', 'Bookworms Emporium', 'Houston', '555-456-7890'),
('S005', 'Page Turners', 'Miami', '555-567-8901'),
('S006', 'Chapter & Verse', 'San Francisco', '555-678-9012'),
('S007', 'Literary Lounge', 'Dallas', '555-789-0123'),
('S008', 'Book Haven', 'Atlanta', '555-890-1234');

select * from Book_Store ;

UPDATE Distributor
SET Location = 'San Diego'
WHERE Distributor_id = 'D002';

UPDATE Distributor
SET Contact_no = '555-555-5555'
WHERE Distributor_id = 'D005';

DELETE FROM book_store
WHERE Contact_no IS NULL;

-- Inserting data into the Author_contracts table
insert into Author_contracts (Author_id, Contract_id)
values
('A001', 'C001'),
('A002', 'C002'),
('A003', 'C003'),
('A004', 'C004'),
('A005', 'C005'),
('A006', 'C006'),
('A007', 'C007'),
('A008', 'C008');

select * from Author_contracts ;

DELETE FROM author_contracts
WHERE Author_id = 'A001';

-- Inserting data into the Book_review table
insert into Book_review (Book_isbn, Editor_id)
values
('978-0451166890', 'E001'),
('978-0061120084', 'E002'),
('978-0141983042', 'E003'),
('978-0451524935', 'E004'),
('978-0064407663', 'E005'),
('978-0066620992', 'E006'),
('978-0446675536', 'E007'),
('978-1400032716', 'E008');

select * from Book_review ;

DELETE FROM book_review
WHERE Editor_id = 'E001';


-- Inserting data into the Print table
insert into Print (Book_isbn, Print_specialist_id)
values
('978-0451166890', 'PS001'),
('978-0061120084', 'PS002'),
('978-0141983042', 'PS003'),
('978-0451524935', 'PS004'),
('978-0064407663', 'PS005'),
('978-0066620992', 'PS006'),
('978-0446675536', 'PS007'),
('978-1400032716', 'PS008');

select * from print;

DELETE FROM print
WHERE Print_specialist_id = 'PS001';

-- Inserting data into the Create_ table
insert into Create_ (Book_isbn, Creative_Artist_id)
values
('978-0451166890', 'CA001'),
('978-0061120084', 'CA002'),
('978-0141983042', 'CA003'),
('978-0451524935', 'CA004'),
('978-0064407663', 'CA005'),
('978-0066620992', 'CA006'),
('978-0446675536', 'CA007'),
('978-1400032716', 'CA008');

select * from create_;

DELETE FROM create_
WHERE Creative_Artist_id = 'CA001';


-- Inserting data into the Book_distribution table
insert into Book_distribution (Book_isbn, Distributor_id)
values
('978-0451166890', 'D001'),
('978-0061120084', 'D002'),
('978-0141983042', 'D003'),
('978-0451524935', 'D004'),
('978-0064407663', 'D005'),
('978-0066620992', 'D006'),
('978-0446675536', 'D007'),
('978-1400032716', 'D008');

select * from Book_distribution;

DELETE FROM book_distribution
WHERE Book_isbn = 'ISBN123';


-- Inserting data into the Supply table
insert into Supply (Store_id, Distributor_id)
values
('S001', 'D001'),
('S002', 'D002'),
('S003', 'D003'),
('S004', 'D004'),
('S005', 'D005'),
('S006', 'D006'),
('S007', 'D007'),
('S008', 'D008');

select * from supply;

DELETE FROM supply
WHERE Store_id = 'BS001';


-- Inserting data into the Sales table
insert into Sales (Retailer_id, Customer_id)
values
('R001', 'C001'),
('R002', 'C002'),
('R003', 'C003'),
('R004', 'C004'),
('R005', 'C005'),
('R006', 'C006'),
('R007', 'C007'),
('R008', 'C008');

select * from sales;

DELETE FROM sales
WHERE Customer_id = 'C001';


-- Inserting data into the Make_order table
insert into Make_order (Retailer_id, Order_id)
values
('R001', 'O001'),
('R002', 'O002'),
('R003', 'O003'),
('R004', 'O004'),
('R005', 'O005'),
('R006', 'O006'),
('R007', 'O007'),
('R008', 'O008');

select * from make_order;

DELETE FROM make_order
WHERE Order_id = 'O001';


insert into Target (Book_isbn, Platform, Customer_id)
values
('978-0451166890', 'Social Media', 'C001'),
('978-0061120084', 'Email Marketing', 'C002'),
('978-0141983042', 'Online Ads', 'C003'),
('978-0451524935', 'Bookstore Displays', 'C004'),
('978-0064407663', 'Social Media', 'C005'),
('978-0066620992', 'Email Marketing', 'C006'),
('978-0446675536', 'Online Ads', 'C007'),
('978-1400032716', 'Bookstore Displays', 'C008');

select * from target;

DELETE FROM target
WHERE Customer_id = 'C001';

INSERT INTO Book_author (Book_isbn, Author_id)
VALUES
('978-0451166890', 'A001'), 
('978-0061120084', 'A002'), 
('978-0141983042', 'A003'), 
('978-0451524935', 'A004'), 
('978-0064407663', 'A005'), 
('978-0066620992', 'A006'), 
('978-0446675536', 'A007'), 
('978-1400032716', 'A008'); 

select * from Book_author;

DELETE FROM Book_author
WHERE Author_id = 'A008';

INSERT INTO Book_order (Book_isbn, Order_id)
VALUES
('978-0451166890', 'O001'), 
('978-0061120084', 'O002'), 
('978-0141983042', 'O003'), 
('978-0451524935', 'O004'), 
('978-0064407663', 'O005'), 
('978-0066620992', 'O006'), 
('978-0446675536', 'O007'), 
('978-1400032716', 'O008');

select * from Book_order;

DELETE FROM Book_order
WHERE Order_id = 'O007';

-- alter table Contract 
-- add constraint fk_Contract
-- foreign key( Book_isbn) references book(Book_isbn);


alter table Customer 
add constraint fk_Customer
foreign key(Order_id) references Order_(Order_id)
on delete set null on update cascade;


-- alter table Publisher 
-- add constraint fk_Publisher
-- foreign key(Book_isbn) references book(Book_isbn);
-- on delete set null on update cascade;

alter table Retailer 
add constraint fk_Retailer
foreign key(Store_id) references Book_Store(Store_id)
on delete set null on update cascade;

alter table Book 
add constraint fk_book1
foreign key(Distributor_id ) references Distributor(Distributor_id )
on delete set null on update cascade;

alter table Book 
add constraint fk_book2
foreign key(Contract_id ) references Contract(Contract_id)
on delete set null on update cascade;

-- alter table Book_review 
-- add constraint fk_Book_review
-- foreign key(Book_isbn ) references Book(Book_isbn);



alter table Author_contracts 
add constraint fk_Author_contracts
foreign key(Author_id ) references Author(Author_id)
on update cascade;

alter table Author_contracts 
add constraint fk_Author_contracts2
foreign key(Contract_id) references Contract(Contract_id)
on update cascade;

alter table Target 
add constraint fk_Target
foreign key (Book_isbn, Platform) references Marketing_campaign(Book_isbn,platform);

alter table Target 
add constraint fk_Target3
foreign key (Customer_id) references Customer(Customer_id)
on update cascade;



alter table Make_order
add constraint fk_Make_order
foreign key(Retailer_id) references Retailer(Retailer_id)
on update cascade;

alter table Make_order
add constraint fk_Make_order2
foreign key(Order_id ) references Order_(Order_id )
on update cascade;


alter table Sales
add constraint fk_Sales
foreign key(Retailer_id) references Retailer(Retailer_id)
on update cascade;

alter table Sales
add constraint fk_Sales2
foreign key(Customer_id) references Customer(Customer_id)
on update cascade;

alter table Supply
add constraint fk_Supply
foreign key(Store_id) references Book_store(Store_id)
on update cascade;

alter table Supply
add constraint fk_Supply2
foreign key(Distributor_id) references Distributor(Distributor_id)
on update cascade;

-- alter table Book_distribution
-- add constraint fk_Book_distribution
-- foreign key(Book_isbn ) references Book(Book_isbn)
-- on update cascade;

-- alter table Book_distribution
-- add constraint fk_Book_distribution2
-- foreign key(Distributor_id) references Distributor(Distributor_id)
-- on update cascade;

-- alter table Create_
-- add constraint fk_Book_Create_
-- foreign key(Book_isbn ) references Book(Book_isbn)
-- on update cascade;

alter table Create_
add constraint fk_Book_Create_2
foreign key(Creative_Artist_id ) references Creative_Artist(Creative_Artist_id)
on update cascade;

-- alter table Print
-- add constraint fk_Print
-- foreign key(Book_isbn ) references Book(Book_isbn)
-- on update cascade;

alter table Print
add constraint fk_Print2
foreign key(Print_specialist_id ) references Print_specialist(Print_specialist_id)
on update cascade;

-- alter table Book_author
-- add constraint fk_Book_author
-- foreign key(Book_isbn ) references Book(Book_isbn)
-- on update cascade;

-- alter table Book_author
-- add constraint fk_Book_author2
-- foreign key(Author_id ) references Author(Author_id)
-- on update cascade;

-- alter table Book_order
-- add constraint fk_Book_order
-- foreign key(Order_id ) references Order_(Order_id);

-- alter table Book_order
-- add constraint fk_Book_order2
-- foreign key(Book_isbn ) references Book(Book_isbn);


-- derived attribute 
SELECT *, DATEDIFF(End_date, Start_date) AS Campaign_period
FROM Marketing_campaign;


-- show create tables

show create table book;
show create table editor;
show create table author;
show create table contract;
show create table marketing_campaign;
show create table customer;
show create table order_;
show create table retailer;
show create table publisher;
show create table print_specialist;
show create table book_language;
show create table creative_artist;
show create table bookstore_inventory;
show create table book_store;
show create table distributor;
show create table book_review;
show create table author_contracts;
show create table target;
show create table make_order;
show create table sales;
show create table supply;
show create table book_distribution;
show create table create_;
show create table print;


-- simple queries
-- select operation
select * from Customer where Order_id = 'O005';

select Publisher_id, Book_isbn from Publisher;

select * from book cross join author;

select * from book cross join book_language;

select * from book cross join book_store;

select * from author cross join print_specialist;

select * from customer cross join retailer;

-- creating userview

create view book_info_view as select b.Title, b.Price from book as b;

-- select * from book_info_view;

select * from book as B inner join author as A on B.Author = A.First_name;


-- 1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
-- rename operation
create view view1 as (Select Total_amount - 500 as Profit from Order_);

show tables;


--  DEMONSTRATING THE USE OF LIKE KEYWORD
SELECT * FROM book WHERE Title LIKE 'T%';


-- DEMONSTRATING THE USE OF AGGREGATE (MIN FUNCTION)
-- Query to find the minimum total amount from all orders
SELECT MIN(Total_amount) AS MinimumTotalAmount FROM order_;

select* from order_;

-- complex queries
-- union operation
-- Example:
-- 22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
-- select Book_isbn as Item_ID, Title as Item_Name, 'Book' as ItemType from book
-- union
-- select Store_id as Item_ID, Store_name as Item_Name, 'Bookstore' as ItemType from book_store;
(select retailer_id, store_id from retailer) union (select order_id, quantity from order_ where quantity>100);

-- INTERSECTION OPERATION

-- Query to select books with a specific title and genre
-- select Book_isbn, Title, Genre from book where No_of_pages=371 and Price= 13.49;

/*select  * from book as B
inner join author as A on B.Author = A.First_name
where B.Book_isbn='978-0141983042' and A.Contact_no='555-345-6789';*/

/*create view UV1 as select book.Book_isbn, book.Title, book_language.Language_ from book
inner join book_language on book.Book_isbn = book_language.Book_isbn;
create view UV2 as select author.Book_isbn, book.Title, book_language.Language_ from book
inner join book_language on book.Book_isbn = book_language.Book_isbn;*/


-- inner join
select distinct book.Book_isbn, book.Title, book_language.Language_ from book
inner join book_language on book.Book_isbn = book_language.Book_isbn ;

create view view10 as select Title, No_of_pages, Price from book;
select * from view10;
create view view20 as select First_name, Contact_no from author;
select * from view20;
select * from view10 inner join view20  on price>10.00;

-- set difference



-- 33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
-- RUN THIS SET DIFFERENCE IN THE COMMAND LINE
-- (select * from order_ where quantity>1) except (select * from order_ where total_amount>100);

-- 4444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444
-- RUN THIS INTERSECT IN THE COMMAND LINE
-- (select * from order_ where quantity>1) INTERSECT (select * from order_ where total_amount>100);

-- (select (Product, Quantity) from order_) / (select Qunatity from order_ where quantity>100);
-- division
/*select ret.* from retailer ret
where not exists (
    select 1 from book_store bs
    where bs.Store_id = ret.Store_id
);*/


-- 55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
-- left outer join
-- select distinct author.First_name, author.Contact_no from author 
-- left outer join author_contracts on author.Author_id = author_contracts.Author_id;

create view v7 as select * from Author where First_name = "Dan" or "Scott";
select first_name, contact_no from v7;
create view v8 as select * from Author_contracts where Author_id = 'A003';
select author_id, contract_id from v8;
select * from v7 left outer join v8 on v7.Author_id = v8.Author_id;

drop view v8;
-- 6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
-- right  outer join
-- select *from print_specialist AS ps
-- right outer join print as p on ps.Print_specialist_id = p.Print_specialist_id;


create view view90 as select * from print_specialist where name_ = "David" or "Susan";
select * from view90;
create view view100 as select * from print where book_isbn = "978-0064407663";
select * from view100;
select * from view90 right outer join view100 on view90.Print_specialist_id = view100.Print_specialist_id;

drop view view90;
drop view view100;
-- meh tika one na
select * from book
right join book_review on book.Book_isbn = book_review.Book_isbn;

create view PrintedBy as
select print.Book_isbn, print_specialist.Print_specialist_id, print_specialist.Name_ from print_specialist
right join print on print_specialist.Print_specialist_id = print.Print_specialist_id;
select* from PrintedBy;


-- natural join
create view BookStoreRetailer as select * from book_store natural join retailer;
select * from BookStoreRetailer;



-- full outer join
/*(select * from book left outer join author_contracts on book.Book_isbn= book_publisher.Book_isbn)
union 
(select * from author right outer join author_contracts on author.Author_id = author_contracts.Author_id);*/


create view view90 as select * from print_specialist where name_ = "David" or "Susan";
select * from view90;
create view view100 as select * from print where book_isbn = "978-0064407663";
select * from view100;


(select * from v7 left outer join v8 on v7.Author_id = v8.Author_id) union (select * from view90 right outer join view100 on view90.Print_specialist_id = view100.Print_specialist_id);

-- create view a1 as select * from book left outer join book_review on book.book_isbn= book_review.book_isbn;
-- create view a2 as select * from author right outer join author_contracts on author.Author_id = author_contracts.Author_id;
-- (select * from a1) union (select *from a2);

-- outer union

 
create view book_distribution_union as
select b.Book_isbn, b.Title, b.Genre, b.No_of_pages, b.Price, b.Author, bd.Distributor_id from book b
left join book_distribution bd on b.Book_isbn = bd.Book_isbn
union all
select b.Book_isbn, b.Title, b.Genre, b.No_of_pages, b.Price, b.Author, bd.Distributor_id from book_distribution bd
left join book b on b.Book_isbn = bd.Book_isbn;
select * from book_distribution_union; 



-- create view v2 select * from book_distribution bd
-- left join book b on b.Book_isbn = bd.Book_isbn;
-- select * from book_distribution_union;


-- NESTED QUERY 1
explain SELECT Distributor_id, 
    (SELECT COUNT(*) FROM book_distribution 
     WHERE book_distribution.Distributor_id = distributor.Distributor_id 
     AND book_distribution.book_isbn = '978-0064407663') AS TotalBooksDistributed 
FROM distributor where distributor.location = "Atlanta";

-- NESTED QUERY 2
select * from book;
explain select Title, 
(select Price * (Royalty_percentage / 100) from contract where contract.Book_isbn = book.Book_isbn) 
as RoyaltyAmount from book where book.price>10;

-- NESTED QUERY 3
explain select * from book
where Book_isbn not in 
(select distinct Book_isbn from book_review where price>10 AND no_of_pages>200) and contract_id = "C003";

-- NESTED QUERY 4

select * from book;
select Title, 
(select Price * (Royalty_percentage / 100) from contract where contract.Book_isbn = book.Book_isbn) 
as RoyaltyAmount from book where book.author="Scott";

-- tuning the complex query (union)

-- Tuning 01

explain  (select retailer_id, store_id from retailer) union (select order_id, quantity from order_ where quantity>100);
show index from retailer;
show index from order_;

-- (select retailer_id, store_id from retailer) union (select order_id, quantity from order_);
create  index store_id_index using BTREE on retailer(store_id);
create  index quantity_index using BTREE on order_(quantity);

explain  (select retailer_id, store_id from retailer) union (select order_id, quantity from order_ where quantity>100);
-- drop index store_id_index on retailer;
drop index quantity_index on order_;


-- Tuning 02

-- (select * from order_ where quantity>1) INTERSECT (select * from order_ where total_amount>100);

-- explain (select * from order_ where quantity>1) INTERSECT (select * from order_ where total_amount>100);

show index from order_;

create  index order_index using BTREE on order_(quantity);
create  index total_amount_index using BTREE on order_(total_amount);

-- explain (select * from order_ where quantity>1) INTERSECT (select * from order_ where total_amount>100);

drop index total_amount_index on order_;
drop index order_index on order_;



-- Tuning 03


-- explain (select * from order_ where quantity>1) except (select * from order_ where total_amount>100);

show index from order_;

create  index quantity_index using BTREE on order_(quantity);
create  index total_amount_index using BTREE on order_(total_amount);

-- explain (select * from order_ where quantity>1) except (select * from order_ where total_amount>100);

drop index quantity_index on order_;
drop index total_amount_index on order_;

-- Tuning 04

create view v71 as select * from Author where First_name = "Dan" or "Scott";
select * from v71;
create view v81 as select * from Author_contracts where Author_id = 'A003';
select * from v81;
explain select * from v71 left outer join v81 on v71.Author_id = v81.Author_id;

show index from author;
show index from Author_contracts;

create  index author_first_name_index using BTREE on Author(First_name);
create  index author_id2_index using BTREE on Author_contracts(Author_id);

explain select * from v71 left outer join v81 on v71.Author_id = v81.Author_id;

drop index author_first_name_index on Author;
drop index author_id2_index on Author_contracts;

drop view v81;
drop view v71;


-- Tuning 05
select * from print_specialist;
create view view91 as select * from print_specialist where name_ = "David" or "Susan";
select * from view91;
create view view101 as select * from print where book_isbn = "978-0064407663";
select * from view101;
explain select * from view91 right outer join view101 on view91.Print_specialist_id = view101.Print_specialist_id;

show index from print_specialist;
-- show index from print;

create  index print_specialist_index using BTREE on print_specialist(name_);
create  index print_index using BTREE on print(book_isbn);

explain select * from view91 right outer join view101 on view91.Print_specialist_id = view101.Print_specialist_id;

drop index print_specialist_index on print_specialist;
drop index print_index on print;

drop view view91;
drop view view101;


-- Tuning 06

-- create view vie111 as select * from book where no_of_pages >180;-- select * from vie111;
-- create view vie121 as select * from book_review;
-- select * from vie121;
-- select * from vie111 full join vie121 on vie111.Book_isbn = vie121.Book_isbn;





select * from publisher;





create view a11 as select * from book 
left outer join author_contracts on book.Book_isbn= author_contracts.Book_isbn  where book.price>10;
create view a21 as select * from author 
right outer join author_contracts on author.Author_id = author_contracts.Author_id;
explain (select * from a11) union (select *from a21) ;

show index from book;

create  index book1_index using BTREE on book(price);
-- create  index author1_index using BTREE on print(book_isbn);

explain (select * from a11) union (select *from a21) ;

drop index book1_index on book;


-- drop view vie111;
-- drop view view121;
drop view a11;
drop view a21;


-- Tuning 07



explain SELECT Distributor_id, 
    (SELECT COUNT(*) FROM book_distribution 
     WHERE book_distribution.Distributor_id = distributor.Distributor_id 
     AND book_distribution.book_isbn = '978-0064407663') AS TotalBooksDistributed 
FROM distributor where distributor.location = "Atlanta";

show index from customer;
show index from order_;
show index from distributor;

select * from distributor;
create  index q2_index using BTREE on customer(name_);
create  index q3_index using BTREE on order_(quantity);
create index q10 using BTREE on distributor(location);
drop index q2_index on customer;
drop index q3_index on order_;
drop index q10 on distributor;



-- Tuning 08

select * from book;
explain select Title, 
(select Price * (Royalty_percentage / 100) from contract where contract.Book_isbn = book.Book_isbn) 
as RoyaltyAmount from book where book.price>10;

show index from contract;
show index from book;

create  index q8 using BTREE on contract(Royalty_percentage);
create  index q9 using BTREE on book(price);

drop index q8 on contract;
drop index q9 on book;

-- Tuning 09

select * from book;
explain select * from book
where Book_isbn not in 
(select distinct Book_isbn from book_review where price>10 AND no_of_pages>200) and contract_id = "C003";

show index from book;

create  index q9 using BTREE on book(price);
create  index q10 using BTREE on book(no_of_pages);
create  index q11 using BTREE on book(contract_id);

explain select * from book
where Book_isbn not in 
(select distinct Book_isbn from book_review where price>10 AND no_of_pages>200) and contract_id = "C003";

drop index q9 on book;
drop index q10 on book;
drop index q11 on book;


-- Tuning 10

explain select Title, 
(select Price * (Royalty_percentage / 100) from contract where contract.Book_isbn = book.Book_isbn) 
as RoyaltyAmount from book where book.author="Scott";

show index from book;

create  index q13 using BTREE on book(author);

explain select Title, 
(select Price * (Royalty_percentage / 100) from contract where contract.Book_isbn = book.Book_isbn) 
as RoyaltyAmount from book where book.author="Scott";

drop index q13 on book;