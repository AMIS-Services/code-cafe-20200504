create table if not exists authors
( id           serial primary key
, first_name   varchar not null
, last_name    varchar not null
, prefix       varchar
);

create table if not exists publishers
( id           serial primary key
, name         varchar not null
, city         varchar
, country      varchar not null
);

create table if not exists books
( id           serial primary key
, title        varchar not null
, subtitle     varchar
, isbn         varchar not null
, excerpt      varchar
, publisher_id integer references publishers (id) not null
);

create table if not exists book_authors
( book_id      integer references books (id) not null
, author_id    integer references authors (id) not null
);

