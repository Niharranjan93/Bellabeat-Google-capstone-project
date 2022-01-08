create database triggers
use triggers
show tables


create table customers (
cust_id int,
age int,
name varchar (20));
delimiter //
create trigger age_verify
before insert
on customers
for each row
if new.age < 0  then set new.age = 0 ;
end if ; //

insert into customers
values(101, 27, 'james'),
(102, -40, 'ammy'),
(103, 33, 'ben'),
(104, -39, 'angela');

# after insert triggers


create table customers1 (
id int auto_increment primary key,
name varchar (20) not null,
email varchar (20),
birthdate date);

create table message (
id int auto_increment,
msg_id int,
msg varchar(50)not null,`
j  
primary key (id, msg_id));

delimiter //
create trigger checknull
after insert
on customers1
for each row
begin
if new.birthdate is null
then insert into message (msg_id, msg)
values (new.id, concat('hi ', new.name,' please upadate youe birthday'));
end if;
end//

insert into customers1(name, email, birthdate)
values('nancy', 'abc@da', null),
('krish', 'jhgg@hh', '10.02.2005'),
('sibu', 'uhhgg@jh', '13.11.2009'),
('bitu', 'gfhhgff@gghj', null)
