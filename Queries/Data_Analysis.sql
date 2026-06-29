
-- Exploratory Data Analysis --
select *
from Amazon.products;

select *
from Amazon.categories;





-- AMOUNT OF PRODUCTS --

-- Overall
select count(product_name) as amount_of_products
from Amazon.products;

-- Genreal and "specific" categories
select count(distinct level_1) as genreal_categories
from Amazon.categories;

select count(distinct level_5) as detailed_categories
from Amazon.categories;

-- Amount of products in genreal categories
select
    level_1,
    count(product_name) as amount_of_products
from Amazon.products
join Amazon.categories
using(category_id)
group by level_1
order by amount_of_products desc;

-- Amount of products in detailed categories
select
    level_5,
    count(product_name) as amount_of_products
from Amazon.products
join Amazon.categories
using(category_id)
group by level_5
order by amount_of_products desc;





-- PRICES --


-- MAX/MIN prices --

-- Max and Min prices overall
select
    max(discounted_price) as max_price,
    min(discounted_price) as min_price
from Amazon.products;
-- In generall categories
select
    level_1,
    max(discounted_price) as max_price,
    min(discounted_price) as min_price
from Amazon.products
join Amazon.categories
on products.category_id = categories.category_id
group by 1
order by 2 desc;
-- In specific categories
select
    level_5,
    max(discounted_price) as max_price,
    min(discounted_price) as min_price
from Amazon.products
join Amazon.categories
on products.category_id = categories.category_id
group by 1
order by 2 desc;

-- AVERAGE prices --

-- Average price overall
select 
    round(avg(discounted_price),2 )as average_price
from Amazon.products;

-- By generall categories
select
    level_1,
    round(avg(discounted_price),2) as average_price
from Amazon.categories
join Amazon.products
using(category_id)
group by 1
order by average_price desc;

-- By specific categories
select
    level_5,
    round(avg(discounted_price),2) as average_price
from Amazon.categories
join Amazon.products
using(category_id)
group by 1
order by average_price desc;





-- DISCOUNTS --

-- MAX/MIN discounts --
select
    max(discount_percentage) as max_discount_percentage,
    min(discount_percentage) as min_discount_percentage,
    round(max(actual_price - discounted_price), 2) as max_discounted_sum,
    round(min(actual_price - discounted_price), 2) as min_discounted_sum
from Amazon.products;

-- AVERAGE discounts --

-- Overall
select
    round(avg(discount_percentage),2) as avg_discount_percentage,
    round(avg( (actual_price - discounted_price) ),2) as avg_discounted
from Amazon.products
order by avg_discount_percentage desc;

-- By categories
select
    level_1 as category,
    round( avg(discount_percentage),2 ) as avg_discount_percentage,
    round( avg(rating),2 ) as avg_rating
from Amazon.categories
join Amazon.products
using(category_id)
group by level_1
order by avg_discount_percentage desc;

select
    level_5 as category,
    round( avg(discount_percentage),2 ) as avg_discount_percentage,
    round( avg(rating),2 ) as avg_rating
from Amazon.categories
join Amazon.products
using(category_id)
group by 1
order by avg_discount_percentage desc;





-- RATING --

-- Max/Min/Average rating overall and by categories
select
    max(rating) as max_rating,
    min(rating) as min_rating,
    round( avg(rating),2 ) as avg_rating
from Amazon.products;    

select
    level_1,
    max(rating) as max_rating,
    min(rating) as min_rating,
    round( avg(rating),2 ) as avg_rating,
    round( avg(rating_count),2 ) as avg_review_amount
from Amazon.products
join Amazon.categories
using(category_id)
group by 1
order by avg_review_amount desc;

select
    level_5,
    max(rating) as max_rating,
    min(rating) as min_rating,
    round( avg(rating),2 ) as avg_rating,
    round( avg(rating_count),2 ) as avg_review_amount
from Amazon.products
join Amazon.categories
using(category_id)
group by 1
order by avg_review_amount desc;





-- RANKING --
select
    level_1,
    count(products.product_id) as total_products,
    round( min(discounted_price),2 ) as min_price,
    round( MAX(discounted_price),2 ) as max_price,
    round( avg(discounted_price),2 ) as avg_price,
    round( avg(discount_percentage),1 ) as avg_discount_pct,
    round( avg(rating),2 ) as avg_rating,
    sum(rating_count)  as total_reviews,
    rank() over (order by count(products.product_id) desc) as category_rank
from Amazon.products
join Amazon.categories
using(category_id)
group by level_1
order by category_rank;

-- The most/least expensive products --
select
    products.product_id,
    product_name,
    category_name,
    discounted_price as price,
    discount_percentage,
    rating
from Amazon.products
join Amazon.categories
using(category_id)
where discounted_price =
(
    select max(discounted_price)
    from Amazon.products
)
union
select
    products.product_id,
    product_name,
    category_name,
    discounted_price as price,
    discount_percentage,
    rating
from Amazon.products
join Amazon.categories
using(category_id)
where discounted_price =
(
    select min(discounted_price)
    from Amazon.products
);

-- Products with the highest /lowest rating
select
    products.product_id,
    product_name,
    category_name,
    discounted_price as price,
    discount_percentage,
    rating
from Amazon.products
join Amazon.categories
using(category_id)
where rating =
(
    select max(rating)
    from Amazon.products
);

select
    products.product_id,
    product_name,
    category_name,
    discounted_price as price,
    discount_percentage,
    rating
from Amazon.products
join Amazon.categories
using(category_id)
where rating =
(
    select min(rating)
    from Amazon.products
);


select
    products.product_id,
    product_name,
    category_name,
    actual_price,
    discounted_price,
    round( (actual_price - discounted_price),2 ) as difference,
    discount_percentage,
    rating
from Amazon.products
join Amazon.categories
using(category_id)
where discount_percentage =
(
    select max(discount_percentage)
    from Amazon.products
);
