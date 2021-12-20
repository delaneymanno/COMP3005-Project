create table customer
	(username		varchar(100),
	 password		varchar(100),
	 name		varchar(100),
      email         varchar(100),
	 primary key (username)
	);

create table owner
	(username		varchar(100),
	 password		varchar(100),
	 name		varchar(100),
      email         varchar(100),
	 primary key (username)
	);

create table book
	(ISBN		varchar(10),
	 title		varchar(100),
	 author		varchar(100),
      year		numeric(4,0) check (year > 1701 and year < 2100),
	 genre		varchar(100),
	 num_pages	numeric(5,0),
	 price		numeric(4,2),
	 primary key (ISBN)
	);

create table publisher
	(pub_name		varchar(100),
	 email		varchar(100),
	 phone_number	varchar(100),
      banking_info  numeric(9,2),
	 primary key (pub_name)
	);

create table sale_order
	(order_num	varchar(10),
	 billing_info	varchar(100),
      total         numeric(5,2),
	 primary key (order_num)
	);

create table address
	(number		numeric(5,0),
	 street		varchar(100),
	 postal_code	varchar(7),
      city		varchar(100),
	 province		varchar(100),
	 primary key (number, street, postal_code)
	);

create table prequel
	(book_ISBN	varchar(10),
	 prequel_ISBN	varchar(10),
	 primary key (book_ISBN, prequel_ISBN),
	 foreign key (book_ISBN) references book
		on delete cascade,
	 foreign key (prequel_ISBN) references book
	);

create table sequel
	(book_ISBN	varchar(10),
	 sequel_ISBN	varchar(10),
	 primary key (book_ISBN, sequel_ISBN),
	 foreign key (book_ISBN) references book
		on delete cascade,
	 foreign key (sequel_ISBN) references book
	);

create table owns
	(username		varchar(100),
	 ISBN		varchar(10),
	 primary key (username, ISBN),
	 foreign key (username) references owner
		on delete cascade,
	 foreign key (ISBN) references book
	);

create table cart
	(username		varchar(100),
	 ISBN		varchar(10),
	 primary key (username, ISBN),
	 foreign key (username) references customer
		on delete cascade,
	 foreign key (ISBN) references book
	);

create table purchased
	(order_num	varchar(10),
	 ISBN		varchar(10),
	 primary key (order_num, ISBN),
	 foreign key (order_num) references sale_order
		on delete cascade,
	 foreign key (ISBN) references book
	 	on delete cascade
	);

create table sale
	(order_num	varchar(10),
	 username		varchar(100),
	 primary key (order_num),
	 foreign key (order_num) references sale_order
		on delete cascade,
	foreign key (username) references customer
    		on delete cascade,
	);

create table published
	(ISBN		varchar(10),
	 pub_name		varchar(100),
	 primary key (ISBN),
	 foreign key (ISBN) references book
	 foreign key (pub_name) references publisher
	     on delete cascade,
	);

create table publisher_addr
	(pub_name		varchar(100),
	 number		numeric(5,0),
	 street		varchar(100),
	 postal_code	varchar(7),
	 primary key (pub_name),
	 foreign key (pub_name) references publisher
	 	on delete cascade,
	 foreign key (number, street, postal_code) references address
	);

create table customer_addr
	(username		varchar(100),
	 number		numeric(5,0),
	 street		varchar(100),
	 postal_code	varchar(7),
	 primary key (username),
	 foreign key (username) references customer
	 	on delete cascade,
	 foreign key (number, street, postal_code) references address
	);

create table shipping_addr
	(order_num	varchar(100),
	 number		numeric(5,0),
	 street		varchar(100),
	 postal_code	varchar(7),
	 primary key (order_num),
	 foreign key (order_num) references sale_order
	 	on delete cascade,
	 foreign key (number, street, postal_code) references address
	);
