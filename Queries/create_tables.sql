
-- First look at the data --

select *
from Amazon.amazon_sales_data;

-- Splitting the data into different entities --
-- Categories table

create table Amazon.categories(
    category_id INT primary key auto_increment,
    category_name varchar(500),
    sub_1 varchar(255),
    sub_2 varchar(255),
    sub_3 varchar(255),
    sub_4 varchar(255),
    sub_5 varchar(255)
);

insert into Amazon.categories(category_name,level_1,level_2,level_3,level_4,level_5)
select
    distinct category as category_name,
    substring_index(category, "|", 1) as level_1,
    substring_index( substring_index(category, "|", 2), "|", -1 ) as level_2,
    substring_index( substring_index(category, "|", 3), "|", -1 ) as level_3,
    substring_index( substring_index(category, "|", 4), "|", -1 ) as level_4,
    substring_index( substring_index(category, "|", 5), "|", -1 ) as level_5
from Amazon.amazon_sales_data;

select *
from Amazon.categories;


-- Products table

create table Amazon.products(
    product_id int primary key auto_increment,
    product_code varchar(500),
    product_name varchar(500),
    category_id int not null,
    actual_price decimal(20,2),
    discounted_price decimal(20,2),
    discount_percentage int,
    rating decimal(3,2),
    rating_count int,
    foreign key(category_id) references Amazon.categories(category_id)
);

insert into Amazon.products
(
    product_code,
    product_name,
    category_id,
    actual_price,
    discounted_price,
    discount_percentage,
    rating,
    rating_count)
select
    amazon_sales_data.product_id,
    product_name,
    category_id,
    actual_price,
    discounted_price,
    discount_percentage,
    rating,
    rating_count
from Amazon.amazon_sales_data
join Amazon.categories on
amazon_sales_data.category = categories.category_name;

select *
from Amazon.products;
    
    




