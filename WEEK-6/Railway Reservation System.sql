create database Railway_Reservation_System;
use Railway_Reservation_System;
create table train(
Train_no varchar(90) primary key,
Arrival varchar(100),
Destinamtion varchar(100),
Availability int,
Train_type varchar(100) not null,
Train_name varchar(100) not null
);
desc train;
create table compartment(
Train_no varchar(90),
compartment_no varchar(90) primary key,
compartment_Type varchar(50),
capacity int,
availability varchar(5) default 'yes',
FOREIGN KEY (Train_no) REFERENCES train(Train_no));
desc compartment;
create table route_info(
Train_no varchar(90),
From_station_no varchar(90),
From_station_name varchar(70),
To_station_no varchar(90),
To_station_name varchar(70),
Distance int,
primary key(From_station_no,To_station_no),
FOREIGN KEY (Train_no) REFERENCES train(Train_no)
);
desc route_info;
create table user(
user_id varchar(90) primary key,
user_type varchar(60),
Fname varchar(80),
Lname varchar(80),
Age int check(age>5),
Pincode int,
Street_no varchar(50),
DOB date
);
desc user;
create table user_train(
Train_no varchar(60),
User_id varchar(60),
Date_time_stamp int,
FOREIGN KEY (Train_no) REFERENCES train(Train_no),
FOREIGN KEY (User_id) REFERENCES user(User_id)
);
desc user_train;
create table user_phone(
user_id varchar(90),
phone_no varchar(10),
FOREIGN KEY (User_id) REFERENCES user(User_id)
);
desc user_phone;
create table ticket(
PNR varchar(60) PRIMARY KEY,
Train_no varchar(90),
Travel_date date,
Departure varchar(60),
Arrival varchar(60),
Departure_time varchar(50),
Arrival_time varchar(50),
User_id varchar(90),
Train_type varchar(100),
Compartment_type varchar(100),
Compartment_no varchar(90),
FOREIGN KEY (User_id) REFERENCES user(User_id)
);
desc ticket;
create table payment_info(
Transaction_id varchar(80) primary key,
Bank varchar(100),
Card_no varchar(150),
Price decimal(11,2),
PNR varchar(60),
FOREIGN KEY (PNR) REFERENCES ticket(PNR)
);
desc payment_info;
create table ticket_passenger(
Seat_no varchar(25) primary key,
Name varchar(80),
Age int,
PNR varchar(60),
FOREIGN KEY (PNR) REFERENCES ticket(PNR)
);
desc ticket_passenger;
create table fare_table(
Train_type varchar(100),
Compartment_type varchar(100),
Fareperkm decimal(25,2)
);
desc fare_table;
Rename table fare_table to fare_details;
create view ticket_details as select PNR,Seat_no from ticket_passenger;
desc ticket_details;
