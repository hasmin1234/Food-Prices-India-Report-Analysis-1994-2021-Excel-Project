create schema food_prices_India;wfp_food_prices_ind
use food_prices_India;

-- 1.Count of records--
select COUNT(date) from wfp_food_prices_ind; ## 12103

-- 2.Find out from how many states data are taken--
select count(distinct admin1) as state from wfp_food_prices_ind; ## 26 

-- 3.How to find out the states which have had the highest prices of rice under cereals and tubers category - retail purchases?  
select admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where category ="cereals and tubers" and pricetype ="Retail" and commodity ="Rice" group by 1,2,3 order by mprice desc;

-- 4.How to find out the states which have had the highest prices of rice under cereals and tubers category - wholesale purchases?  
select admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where category ="cereals and tubers" and pricetype ="Wholesale" and commodity ="Rice" group by 1,2,3 order by mprice desc;

-- 5.Find out the states and market which have had the hghest prices of Milk under milk and diary category- Retail purchases only?  
select admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where category ="milk and diary" and pricetype ="Retail" and commodity ="Milk" group by 1,2,3 order by mprice desc;

-- 5.Find out the states and market which have had the hghest prices of Milk(pasteurized) under milk and diary category- Retail purchases only?  
select admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where category ="milk and diary" and pricetype ="Retail" and commodity ="Milk (pasteurized)" group by 1,2,3 order by mprice desc;

-- 5.Find out the states and market which have had the hghest prices of Ghee (Vanaspati) under oil and fats - Retail purchases only?  
select admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where category ="oil and fats" and commodity ="Ghee (Vanaspati)" group by 1,2,5 order by mprice desc;

-- 6.Finding out the average price of oil and fats as whole --
select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats";

-- 7.Finding out the average price of each type of oil under oil and fats --
select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="oil (mustard)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="oil (groundnut)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="oil (sunflower)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="oil (palm)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="oil (Vanaspati)";

-- 8.Finding out the average price of lentils of each type under pulses and nuts --
select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="pulses and nuts" and commodity ="Lentils (moong)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="Lentils (urad)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="Lentils (masur)";

select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="oil and fats" and commodity ="chickpeas";

-- 9.Finding out the average price of Onions and tomatoes --
select AVG(price) as Average_price
from wfp_food_prices_ind
where category ="vegetables and fruits" and commodity ="Tomatoes";

-- 10.Find out which commodity has highest price --
select date, admin1 as states,market,category,commodity,pricetype,max(price) as mprice from wfp_food_prices_ind 
where pricetype ="Retail" group by 1,2,3,4,5,6 order by mprice desc;

-- 11.Create a table for zones.

create table zones (
state varchar(255),
zone varchar(255),
primary key(state)
);

insert into zones 
values
('Tamil Nadu','South'),('Telangana','South') ,('Andhra Pradesh','South'),('Kerala','South'),('Karnataka','South'), 
('Himachal Pradesh','North'),('Punjab','North'),('Uttarakhand','North'),('Uttar Pradesh','North'),('Haryana','North'),
('Bihar','East'),('Orissa','East'),('Jharkhand','East'),('West Bengal','East'),
('Rajasthan','West'),('Gujarat','West'),('Goa','West'),('Maharashtra','West'),
('Madhya Pradesh','Central'),('Chhattisgarh','Central'),
('Assam','North East'),('Sikkim','North East'),('Manipur','North East'),('Meghalaya','North East'),('Nagaland','North East'),('Mizoram','North East'),('Tripura','North East'),('Arunachal Pradesh','North East'),
('Chandigarh','Union Territory'),('Delhi','Union Territory'),('Puducherry','Union Territory'),('Andaman and Nicobar','Union Territory');

-- 12.Join wfp_food_prices_ind and zones table and create a view--

SELECT *
  FROM wfp_food_prices_ind 
  LEFT JOIN zones ON
  wfp_food_prices_ind.admin1=
  zones.state
  UNION
  SELECT *
  FROM wfp_food_prices_ind
  RIGHT JOIN zones ON
  wfp_food_prices_ind.admin1=
  zones.state;
  
         -------THE END --------




  
