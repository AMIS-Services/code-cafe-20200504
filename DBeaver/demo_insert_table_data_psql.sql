insert into publishers (name, country) values ('Apress', 'USA');
insert into publishers (name, city, country) values ('Manning', 'Shelter Island, NY', 'USA');
insert into publishers (name, country) values ('Pragmatic Bookshelf', 'USA');

insert into authors(first_name, last_name, prefix) values ('Mike', 'Keith', null);
insert into authors(first_name, last_name, prefix) values ('Merrick', 'Schincariol', null);
insert into authors(first_name, last_name, prefix) values ('Massimo', 'Schincariol', null);
insert into authors(first_name, last_name, prefix) values ('Cornelia', 'Davis', null);
insert into authors(first_name, last_name, prefix) values ('Jonathan', 'Rasmusson', null);
insert into authors(first_name, last_name, prefix) values ('Craig', 'Walls', null);
insert into authors(first_name, last_name, prefix) values ('Raoul-Gabriel', 'Urma', null);
insert into authors(first_name, last_name, prefix) values ('Mario', 'Fusco', null);
insert into authors(first_name, last_name, prefix) values ('Alan', 'Mycroft', null);

insert into books(title, subtitle, isbn, publisher_id) 
select 'Pro JPA 2 in Java EE8', 'An In-Depth Guide to Java Persistence APIs', '978-1-4842-3419-8', p.id from publishers p where p.name = 'Apress';
insert into books(title, subtitle, isbn, publisher_id) 
select 'Cloud Native Patterns', 'Designing change-tolerant software', '978-1-61729-429-7', p.id from publishers p where p.name = 'Manning';
insert into books(title, subtitle, isbn, publisher_id) 
select 'The Agile Samurai', 'How Agile Masters Deliver Great Software', '978-1-93435-658-6', p.id from publishers p where p.name = 'Pragmatic Bookshelf';
insert into books(title, subtitle, isbn, publisher_id) 
select 'The ThoughtWorks Anthology 2', 'More Essays on Software Technology and Innovation', '978-1-93778-500-0', p.id from publishers p where p.name = 'Pragmatic Bookshelf';
insert into books(title, subtitle, isbn, publisher_id) 
select 'Spring in Action fifth edition', null, '978-1-61729-494-5', p.id from publishers p where p.name = 'Manning';
insert into books(title, subtitle, isbn, publisher_id) 
select 'Modern Java in Action', 'Lambdas, streams, functional and reactive programming', '978-1-61729-356-6', p.id from publishers p where p.name = 'Manning';


insert into book_authors (book_id, author_id)
select b.id, a.id
from   books b, authors a
where  b.title = 'Pro JPA 2 in Java EE8'
and    a.last_name in ('Keith','Schincariol','Schincariol');
insert into book_authors (book_id, author_id)
select b.id, a.id
from   books b, authors a
where  b.title = 'Cloud Native Patterns'
and    a.last_name in ('Davis');
insert into book_authors (book_id, author_id)
select b.id, a.id
from   books b, authors a
where  b.title = 'The Agile Samurai'
and    a.last_name in ('Rasmusson');
insert into book_authors (book_id, author_id)
select b.id, a.id
from   books b, authors a
where  b.title = 'Spring in Action fifth edition'
and    a.last_name in ('Walls');
insert into book_authors (book_id, author_id)
select b.id, a.id
from   books b, authors a
where  b.title = 'Modern Java in Action'
and    a.last_name in ('Urma','Fusco', 'Mycroft');

