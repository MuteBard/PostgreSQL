CREATE DATABASE restaurant_db2;
-- use \c <name> to load database
CREATE TABLE restaurant(
  id serial primary key,
  name varchar,
  address varchar,
  catagory varchar

);
CREATE TABLE reviewer(
  id serial primary key,
  name varchar,
  email varchar,
  karma integer,
  CHECK (karma > 0 and karma <= 7)
);
CREATE TABLE review_table(
  id serial primary key,
  reviewer_id integer REFERENCES reviewer(id),
  stars integer,

  title varchar,
  review varchar,
  restaurant_id integer REFERENCES restaurant (id),
    CHECK (stars >= 0 and stars <= 5)
);


INSERT INTO restaurant values
(default, 'NaanStop', '123 uwuStreet', 'Indian'),
(default, 'Chipotle', '123 uwuStreet', 'Mexican'),
(default, 'Lovies', '123 uwuStreet', 'BBQ');
INSERT INTO reviewer values
(default, 'Marie','MarieT@gmail.com', 6),
(default, 'John','xXsweglord840KappaXx@gmail.com', 2),
(default, 'BSME','science@gmail.com', 7);
(default, 'Druid','art@gmail.com', 6);

--go into postico and check the ids of the reviewer and that of the restaurant to fill in foreign data
INSERT INTO review_table values
(default,1,4,'Epic Food Review','peak food tbhiidssmsf',1),
(default,2,2,'The hungry Worker', 'meh food tbhiidssmsf',3),
(default,3,5,'Solid Food','great food tbhiidssmsf',2),
(default,4,5,'Solid Food','AMAZING food tbhiidssmsf',2),
-- we are selecting a review from the review column within review table. Review_table and Restaurant are then joined and the
-- restaurant name is filtered to have our restaurant name of choice

Select review from review_table, restaurant where review_table.restaurant_id = restaurant.id AND restaurant.name = 'NaanStop'
-- great food tbhiidssmsf
Select review from review_table, restaurant where review_table.restaurant_id = restaurant.id AND restaurant.id = 2
--meh food tbhiidssmsf
Select review from review_table, reviewer where review_table.reviewer_id = reviewer.id AND reviewer.name = 'BSME'
--great food tbhiidssmsf
Select restaurant.name, review from review_table, restaurant where review_table.restaurant_id = restaurant.id
-- NaanStop	peak food tbhiidssmsf
-- Lovies	meh food tbhiidssmsf
-- Chipotle	great food tbhiidssmsf
Select (star)

 -- * from article inner join author on article.author_id = author.id
