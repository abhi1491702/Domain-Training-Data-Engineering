 USE coding_challenge1;
-- Create another table for car_sales
CREATE TABLE IF NOT EXISTS car_sales (
    sale_id INT PRIMARY KEY,
    car_make VARCHAR(50),
    car_model VARCHAR(50),
    sale_price DECIMAL(10, 2),
    sale_date DATE
);

-- Insert data into the car_sales table
INSERT INTO car_sales VALUES
(1, 'Ford', 'Mondeo', 20000, '2023-01-15'),
(2, 'Renault', 'Fuego', 18000, '2023-01-20'),
(3, 'Citroen', 'Cactus', 22000, '2023-02-05'),
(4, 'Ford', 'Falcon', 9500, '2023-02-10'),
(5, 'Ford', 'Galaxy', 13000, '2023-03-01'),
(6, 'Renault', 'Megane', 15000, '2023-03-05'),
(7, 'Citroen', 'Picasso', 25000, '2023-03-10');

-- Query 1: Average price across all car sales and average price by car type
SELECT
    car_make,
    car_model,
    sale_price,
    AVG(sale_price) OVER() AS "overall_average_price",
    AVG(sale_price) OVER (PARTITION BY car_make) AS "car_make_average_price"
FROM car_sales;

-- Query 2: Average price and top price per car make
SELECT
    car_make,
    AVG(sale_price) AS average_price,
    MAX(sale_price) AS top_price
FROM car_sales
GROUP BY car_make;

-- Query 3: Average make price using window functions
SELECT
    car_make,
    car_model,
    sale_price,
    AVG(sale_price) OVER (PARTITION BY car_make) AS average_make
FROM car_sales;

-- Query 4: Monthly variation in car sales prices
WITH year_month_data AS (
   SELECT DISTINCT
        DATE_FORMAT(sale_date, '%Y') AS year,
        DATE_FORMAT(sale_date, '%m') AS month,
        AVG(sale_price) AS average_price
    FROM car_sales
    GROUP BY 1, 2
 )
 SELECT  year,
         month,
         average_price,
         LAG(average_price) OVER (ORDER BY year, month) AS avg_price_previous_month,
         average_price - LAG(average_price) OVER (ORDER BY year, month) AS avg_price_delta
 FROM year_month_data;
 
 
 
--  Totals and Subtotals
 
 
-- Create a table for City
CREATE TABLE IF NOT EXISTS City (
    CountryCode CHAR(3),
    District VARCHAR(255),
    Name VARCHAR(255),
    Population INT
);

-- Insert values into the City table
INSERT INTO City (CountryCode, District, Name, Population) VALUES
    ('AUS', 'New South Wales', 'Sydney', 3276207),
    ('AUS', 'Victoria', 'Melbourne', 2865329),
    ('AUS', 'Queensland', 'Brisbane', 1291117),
    ('AUS', 'West Australia', 'Perth', 1096829),
    ('AUS', 'South Australia', 'Adelaide', 978100),
    ('AUS', 'Capital Region', 'Canberra', 322723),
    ('AUS', 'Queensland', 'Gold Coast', 311932),
    ('AUS', 'New South Wales', 'Newcastle', 270324),
    ('AUS', 'New South Wales', 'Central Coast', 227657),
    ('AUS', 'New South Wales', 'Wollongong', 219761),
    ('AUS', 'Tasmania', 'Hobart', 126118),
    ('AUS', 'Victoria', 'Geelong', 125382),
    ('AUS', 'Queensland', 'Townsville', 109914),
    ('AUS', 'Queensland', 'Cairns', 92273),
    ('NZL', 'Auckland', 'Auckland', 381800),
    ('NZL', 'Canterbury', 'Christchurch', 324200),
    ('NZL', 'Auckland', 'Manukau', 281800),
    ('NZL', 'Auckland', 'North Shore', 187700),
    ('NZL', 'Auckland', 'Waitakere', 170600),
    ('NZL', 'Wellington', 'Wellington', 166700),
    ('NZL', 'Dunedin', 'Dunedin', 119600),
    ('NZL', 'Hamilton', 'Hamilton', 117100),
    ('NZL', 'Wellington', 'Lower Hutt', 98100);

-- Query to select all records from the City table
SELECT
    CountryCode,
    District,
    Name,
    Population
FROM City
WHERE CountryCode IN ('AUS', 'NZL');


-- Query to retrieve city populations with subtotals and grand total
SELECT
    IF(GROUPING(CountryCode), 'All Countries', CountryCode) AS CountryCode,
    IF(GROUPING(District), 'All Districts', District) AS District,
    IF(GROUPING(Name), 'All Cities', Name) As CityName,
    SUM(Population) AS Population
FROM City
WHERE CountryCode IN ('AUS', 'NZL')
GROUP BY CountryCode, District, Name WITH ROLLUP;

-- Query without labels (using NULLs) to get the same output
SELECT
    CountryCode,
    District,
    Name,
    SUM(Population) AS Population
FROM City
WHERE CountryCode IN ('AUS', 'NZL')
GROUP BY CountryCode, District, Name WITH ROLLUP;
