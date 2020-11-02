drop table if exists products cascade;

create table products (
                    id bigserial,
                    title varchar(255),
                    price numeric (8, 2),
                    primary key(id)
);

insert into products (title, price) values
('chocolate', 89.0), ('milk', 55.0), ('water', 70.0), ('cheese', 330.0),
('meat', 327.0), ('juice', 80.0), ('apples', 69.0), ('cucumbers', 51.0),
('bread', 25.0), ('onions', 18.0), ('pepper', 17.0), ('joghurt', 50.0),
('pears', 68.0), ('plums', 70.0), ('butter', 81.0), ('pineapples', 253.0),
('strawberry', 276.0), ('oil', 99.0), ('garlic', 220.0), ('potato', 25.0);


drop table if exists categories cascade;

create table categories (
                    id bigserial,
                    title varchar(255),
                    primary key(id)
);

insert into categories
(title) values
('Vegetables'),
('Fruit'),
('Other');


drop table if exists products_categories cascade;

create table products_categories (
                    product_id bigint not null,
                    category_id bigint not null,
                    primary key(product_id, category_id),
                    foreign key (product_id) references products(id),
                    foreign key (category_id) references categories(id)
);

insert into products_categories (product_id, category_id) values
(1, 3), (2, 3), (3, 3), (4, 3), (5, 3), (6, 3), (7, 2), (8, 1), (9, 3), (10, 1),
(11, 1), (12, 3), (13, 2), (14, 2), (15, 3), (16, 2), (17, 2), (18, 3), (19, 1), (20, 1);



drop table if exists users cascade;

create table users (
  id                    bigserial,
  phone                 VARCHAR(30) not null UNIQUE,
  password              VARCHAR(80) not null,
  first_name            VARCHAR(50),
  last_name             VARCHAR(50),
  email                 VARCHAR(50) UNIQUE,
  PRIMARY KEY (id)
);


drop table if exists roles;
create table roles (
  id                    serial,
  name                  VARCHAR(50) not null,
  primary key (id)
);



drop table if exists users_roles cascade;

create table users_roles (
                    user_id               INT NOT NULL,
                    role_id               INT NOT NULL,
                    primary key (user_id, role_id),
                    FOREIGN KEY (user_id)
                    REFERENCES users (id),
                    FOREIGN KEY (role_id)
                    REFERENCES roles (id)
);

insert into roles (name)
values
('ROLE_CUSTOMER'), ('ROLE_MANAGER'), ('ROLE_ADMIN');

insert into users (phone, password, first_name, last_name, email) values
('12345678','$2y$12$pDKtGkFNC9Gbp1BhK4SeNOSsqRiHapo83WE9VqyMD/MVjvMnvLluK',
'admin','admin','admin@email.com');

insert into users_roles (user_id, role_id)
values
(1, 1),
(1, 2),
(1, 3);



drop table if exists orders cascade;

create table orders (
                id bigserial,
                user_id bigint not null,
                price numeric(8, 2) not null,
                phone_number varchar(30) not null,
                address varchar (255) not null,
                primary key(id),
                constraint fk_user_id foreign key (user_id)
                references users (id)
);


drop table if exists orders_items cascade;

create table orders_items (
                id bigserial,
                order_id bigint not null,
                product_id bigint not null,
                quantity int,
                price numeric(8, 2),
                primary key(id),
                constraint fk_prod_id foreign key (product_id) references products (id),
                constraint fk_order_id foreign key (order_id) references orders (id)
);
