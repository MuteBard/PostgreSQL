
CREATE DATABASE restaurant_db;
CREATE TABLE restaurant (
  id serial primary key,
  name varchar,
  distance numeric,
  stars integer,
  catagory varchar,
  favorite_dish  varchar,
  does_takeout boolean,
  last_visited date
);
DELETE FROM restaurant;
insert into restaurant values
  ( default,'NaanStop', 2, 4,'BBQ','smoked salmon',FALSE,'2017-01-21');
insert into restaurant values
  ( default,'Chipotle', 5, 2,'Seafood','smoked cheese',FALSE,'2017-02-23');

\! echo "5 star stuff:"

SELECT * FROM restaurant;
SELECT name FROM restaurant;

SELECT favorite_dish FROM restaurant WHERE stars = 4;
\! echo "BBQ"
SELECT name FROM restaurant WHERE catagory = 'BBQ';
\! echo "DISTANCE"
SELECT name FROM restaurant WHERE distance <= 2;
\! echo "DISTANCE AND 4^ STARS"
SELECT name FROM restaurant WHERE distance <= 5 and stars >= 4;
\! echo "DATE VISITED"
SELECT name FROM restaurant WHERE last_visited ='2017-01-21';
-- where last_ate between '2010-01-01' and '2017-03-20'

--postgreSQL Aggregation
SELECT name FROM restaurant order by distance desc
