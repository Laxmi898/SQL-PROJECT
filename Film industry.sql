
use filmindustry;
create table Movie(
mov_id int primary key,
mov_title varchar(50),
mov_year varchar(50),
mov_time varchar(50),
mov_lang varchar(50),
mov_release varchar(50));
create table director(
dir_id int primary key,
dir_fname varchar(50),
dir_lname varchar(50));
create table producer(
prod_id int primary key,
mov_id int,
dir_id int,
foreign key(mov_id)references Movie(mov_id),
foreign key(dir_id)references director(dir_id)
);
create table actor(
act_id int primary key,
act_fname varchar(50),
act_lname varchar(50),
act_gender varchar(50));

create table movie_cast(
act_id int,
foreign key(act_id)references actor(act_id),
mov_id int,
foreign key(mov_id)references Movie(mov_id),
cast int);

create table movie_direction
(
dir_id int ,
mov_id int,
foreign key(dir_id)references director(dir_id),
foreign key(mov_id)references Movie(mov_id));

create table reviewer(
rev_id int primary key,
rev_name varchar(50));

create table rating(
mov_id int,
rev_id int,
rev_status varchar(50),
num_of_rating float,
foreign key(mov_id)references Movie(mov_id));

create table genres(
gen_id int primary key,
gen_title varchar(50));

create table movie_genres(
mov_id int,
gen_id int,
foreign key(mov_id)references Movie(mov_id),
foreign key(gen_id)references genres(gen_id));


insert into movie values(101,"ramayan","1994","3HRS","hindi","July_14_1994"),
(102,"mahabharath","2000","3HRS","hindi","august_07_2000"),
(103,"chatrapathi_shivaji","2011","3HRS","marathi","december_22_2011"),
(104,"sher_shivaji","2017","3hrs","marathi","march_7_2017"),
(105,"KGF","2021","2hrs_40min","kannada","june_10_2021");
insert into movie values(106,"padmavathi","2018","2hrs30min","hindi","august_21_2018"),
(107,"kuch_kuck_hota_hai","2005","3hrs","hindi","may_21_2005"),
(108,"sherlock","1993","20hrs","english","feb_05_1993");
insert into movie values(109,"shaandar","2015","2hrs30min","hindi","sep_09_2015");

use filmindustry;
desc movie;
desc director;
insert into director values("201","karan","johar"),
(202,"sanjayleela","bhansali"),
(203,"SS","rajamouli"),
(204,"prashanth","neel"),
(205,"coan","doyle");
insert into director values("207","vikas","bahl");
insert into director values("206","digpal","j");
desc producer;
alter table producer
add column prod_name varchar(50);
insert into producer values("301","101","203","ramesh"),
("302","101","203","vinod"),
("303","105","204","murthy"),
(304,"108","205","roye");
insert into producer values("306","109","207","vikas");
desc actor;
insert into actor values("401","hrithik","roshan","male"),
("402","yash","gowda","male"),
("403","deepika","padkoune","female"),
("404","benedict","cumberbatch","male"),
("405","sharukh","khan","male");
insert into actor values(406,"alia","bhat","female",109);
desc movie_cast;
desc actor;
alter table movie_cast
drop column cast;
alter table movie_cast
add column role varchar(50);
insert into movie_cast values(401,101,"lead_actor"),
(402,105,"lead_actor"),
(405,107,"lead_actor"),
(403,106,"lead_actress"),
(404,108,"lead_actor");
desc movie_direction;
insert into movie_direction values(203,101),
(203,102),(206,103),(206,104),(204,105),(202,106),(201,107),(205,108);
insert into movie_direction values(207,109);
desc reviewer;
insert into reviewer values(501,"imbd"),
(502,"movie_meter"),
(503,"rotten_tomatoes"),
(504,"times_of_india");

use filmindustry;
desc rating;
select * from movie;
insert into rating values(109,501,"flop",2);
insert into rating values(109,501,"blockbuster",10);
insert into rating values(101,501,"hit",8),
(102,502,"super_hit",9),
(103,504,"hit",8),
(104,503,"hit",8),
(106,502,"super hit",9),
(107,501,"block_busteer",10),
(108,504,"super_hit",9);
desc genres;
select * from movie;
insert into genres values(601,"drama_Adventure_action"),
(602,"drama_action_thriller"),
(603,"drama_romance_action"),
(604,"drama_romance"),
(605,"action_comedy_mystrey");

insert into movie_genres values(101,601),
(102,601),(103,601),(104,601),(105,602),
(106,603),(107,604),(108,605);

#1.SELECT ACTOR NAME WHO HAS WORKED IN FILM KGF AND FIND HIS MOVIE RATING

select act_fname,act_lname from actor 
join movie_cast on actor.act_id= movie_cast.act_id
join movie on movie_cast.mov_id=movie.mov_id 
and movie.mov_title='kgf' 
join rating on movie.mov_id=rating.mov_id;

select * from rating;
desc rating;
#2.select movies which is blockbuster
select mov_title from movie 
join rating on movie.mov_id=rating.mov_id and rev_status='blockbuster';

update rating 
set rev_status='blockbuster'
where mov_id=107;

#3.find director name who has directed thriller movies with the rating
select * from movie;
select dir_fname from director
join movie_direction on director.dir_id=movie_direction.dir_id
join movie_genres on movie_genres.mov_id=movie_direction.mov_id
join genres on genres.gen_id=movie_genres.gen_id and gen_title like '%thriller%'; 
select * from actor;
# 4.select the producer and director who has worked with hrithik roshan
select dir_fname ,prod_name from director
join producer on producer.dir_id=director.dir_id 
join actor on producer.mov_id=actor.mov_id and act_fname="hrithik";
select * from producer;
select * from director;
select * from movie;
insert into producer values(305,107,201,"karan");
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=101 where act_id=401;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=105 where act_id=402;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=106 where act_id=403;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=108 where act_id=404;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=107 where act_id=405;
alter table actor
add  foreign key (mov_id) references movie(mov_id);
update actor set mov_id=101 where act_id=401;
use filmindustry;
#5.find the movies director and producer name whose movie release between 1990 to 2000
select dir_fname,prod_name,mov_title from director
join producer on director.dir_id=producer.dir_id
join movie on movie.mov_id=producer.mov_id and mov_year between 1990 and 2000;
select * from producer;
select * from movie;
select * from actor;
# 6.find actors who have given blockbuster movies
select act_fname from actor where mov_id 
in (Select mov_title from movie where mov_id 
in (select rev_status from rating where rev_status="blockbuster"));
select act_fname from actor
join movie on actor.mov_id=movie.mov_id
join rating on movie.mov_id=rating.mov_id where rev_status="blockbuster";

#7.select movies which is produced by ramesh

select mov_title from movie where
mov_id in(select prod_name from producer where prod_name='ramesh');
select mov_title from movie 
join producer on producer.mov_id=movie.mov_id where prod_name='ramesh';

#8.select movies which is directed by ss rajamouli

select mov_title from movie 
join movie_direction on movie.mov_id=movie_direction.mov_id 
join director on director.dir_id=movie_direction.dir_id where dir_fname="ss";

#9.select movie whis is released in 2000
select mov_title from movie
where mov_year=2000;
select * from movie;
#10.select actor who worked in the year 1993
select act_fname As 'Actor name'from actor 
join movie on movie.mov_id=actor.mov_id where mov_year='1993';

#11.select movies in hindi language
select mov_title from movie
where mov_lang='hindi';

#12.select director name who have directed english movies

select dir_fname,dir_lname from director where (dir_id)in 
(select dir_id from movie_direction where mov_id in
(select mov_id from movie where mov_lang='english'));

#13.select producer who have produced english movie
select prod_name from producer
where (mov_id) in (Select mov_id from movie where mov_lang='english');


#14.select director who have given flop movies
select dir_fname from director
where (dir_id) in (select dir_id from movie_direction where mov_id in(select mov_id from rating where rev_status='flop'));  

#15.select actor who did hindi movies
select act_fname from actor where (mov_id) in(select mov_id from movie where mov_lang='hindi');

#select actor .producer and director movie who done comedy movies
select dir_fname from director where (dir_id)in(select dir_id,prod_name from producer where mov_id in(select mov_id from actor
where mov_id in(select mov_id from movie_genres where gen_id in (select gen_id from genres where gen_title like '%comedy%'))));

select dir_fname,prod_name,act_fname from director
join producer on director.dir_id=producer.dir_id
join actor on producer.mov_id=actor.mov_id
join movie_genres on movie_genres.mov_id=actor.mov_id
join genres on genres.gen_id=movie_genres.gen_id where gen_title like '%comedy%'; 
