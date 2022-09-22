--# migrate -path ./schema -database 'postgres://test_db_user:qwerty@localhost:54320/lab2?sslmode=disable&connect_timeout=5' up 1
-- migrate -path ./schema -database 'postgres://test_db_user:qwerty@localhost:54320/lab2?sslmode=disable&connect_timeout=5' down

--migrate create -ext sql -dir ./schema -seq init


CREATE TABLE countries
(
    id  SERIAL PRIMARY KEY,
    name varchar(255) not null
);
CREATE TABLE clients
(
    id SERIAL PRIMARY KEY,
    first_name varchar(255) not null,
    middle_name varchar(255),
    last_name varchar(255) not null,
    phone_number varchar(11) not null,
    age int not null
);

CREATE TABLE airline_companies
(
    id  SERIAL PRIMARY KEY,
    name varchar(255) not null
);

CREATE TABLE statuses
(
    id  SERIAL PRIMARY KEY,
    name varchar(255) not null
);

CREATE TABLE tour_firms

(
    id  SERIAL PRIMARY KEY,
    company_name varchar(255) not null,
    web_site varchar(255),
    address varchar(255),
    phone_number varchar(11) not null
);

CREATE TABLE vouchers
(
    id SERIAL PRIMARY KEY,
    country_id_in int REFERENCES countries(id) on delete cascade,
    country_id_out int REFERENCES countries(id) on delete cascade,
    client_id int REFERENCES clients(id) on delete cascade,
    firm_id int REFERENCES tour_firms(id) on delete cascade,
    price int not null,
    status_id int REFERENCES statuses(id) on delete cascade,
    date_start DATE,
    date_finish DATE,
    airline_company_id int REFERENCES airline_companies(id) on delete cascade
);


CREATE TABLE airline_companies_tour_firms
(
    id SERIAL PRIMARY KEY,
    airline_id int REFERENCES airline_companies(id) on delete cascade,
    tour_firm_id int REFERENCES tour_firms(id) on delete cascade
);