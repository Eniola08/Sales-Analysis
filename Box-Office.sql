
create table movies(
id int primary key,
Title varchar(30),
Director varchar(30),
Year int,
Length_minutes int);

select * from movies

insert into movies(id, Title, Director, Year, Length_minutes)
values(1, 'Toy Story', 'John Lasseter', 1995, 81), (2, 'A Bugs Life', 'John Lasseter', 1998, 95), (3, 'Toy Story 2', 'John Lasseter', 1999, 93),
(4, 'Monsters, Inc.', 'Pete Docter', 2001, 92), (5, 'Finding Nemo', 'Andrew Stanton', 2003, 107), (6, 'The Incredibles', 'Brad Bird', 2004, 116),
(7, 'Cars', 'John Lasseter', 2006, 117), (8, 'Ratatouille', 'Brad Bird', 2007, 115), (9, 'WALL-E', 'Andrew Stanton', 2008, 104),
(10, 'Up', 'Pete Docter', 2009, 101), (11, 'Toy Story 3', 'Lee Unkrich', 2010, 103), (12, 'Cars 2', 'John Lasseter', 2011, 120),
(13, 'Brave', 'Brenda Chapman', 2012, 102), (14, 'Monsters University', 'Dan Scanlon', 2013, 110);


create table movies_sales (
Movie_id int,
Rating decimal,
Dosmestic_sales int,
International_sales int);

insert into movies_sales(Movie_id, Rating, Dosmestic_sales, International_sales)
values(5, 8.2, 380843261, 555900000), (14, 7.4, 268492764, 475066843), (8, 8, 206445654, 417277164), (12, 6.4, 191452396, 368400000),
(3, 7.9, 245852179, 239163000), (6, 8, 261441092, 370001000), (9, 8.5, 223808164, 297503696), (11, 8.4, 415004880, 648167031),
(1, 8.3, 191796233, 170162503), (7, 7.2, 244082982, 217900167), (10, 8.3, 293004164, 438338580), (4, 8.1, 289916256, 272900000),
(2, 7.2, 162798565, 200600000), (13, 7.2, 237283207, 301700000);select * from moviesselect * from movies_sales--Find the domestic and international sales for each movieselect m.Title, m.id, ms.International_sales, ms.Dosmestic_salesfrom movies mjoin movies_sales mson m.id = ms.Movie_id order by m.id--Show the sales numbers for each movie that did better internationally rather than domesticallyselect m.Title, ms.Movie_id, ms.International_sales, ms.Dosmestic_salesfrom movies mjoin movies_sales mson m.id = ms.Movie_id where ms.International_sales > ms.Dosmestic_sales--List all the movies by their ratings in descending orderselect m.Title, ms.Ratingfrom movies mjoin movies_sales mson m.id = ms.Movie_idorder by Rating desc--List all movies and their combined sales in millions of dollarsselect m.Title, ms.Movie_id, sum (ms.International_sales + ms.Dosmestic_sales) as combined_salesfrom movies mjoin movies_sales mson m.id = ms.Movie_id group by m.Title, ms.Movie_id--List all movies and their ratings in percentselect m.Title, (rating)/100 as sales_percentagefrom movies mjoin movies_sales mson m.id = ms.Movie_id group by m.Title, ms.Rating--List all movies that were released on even number yearsselect * from movieswhere Year %2 = 0-- List all movies directed by John Lasseterselect * from movieswhere Director = 'John Lasseter'--Which Movie has the highest international salesselect m.Title, ms.Movie_id, ms.International_salesfrom movies mjoin movies_sales mson m.id=ms.Movie_idorder by ms.International_sales desc--Movies directed in 2000sselect * from movieswhere Year > 2000 --List all movies and directors expect Pete Docter select *  from movies where Director not like 'Pete Docter'--The Movie 'Toy Story' is directed by who and yearselect Title, Director, Yearfrom movieswhere Title like '%Toy Story%'-- The dosmestic and international sales for the movie 'WALL-E' select m.Title, ms.Rating, ms.Movie_id, m.Year, ms.International_sales, ms.Dosmestic_salesfrom movies mjoin movies_sales mson m.id = ms.Movie_idwhere Title = 'WALL-E'