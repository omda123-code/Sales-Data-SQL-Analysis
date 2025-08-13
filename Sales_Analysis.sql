use [Online Store]

-----لدمج جداول السنوات  Views انشاء  ----
create view Sales_data as 
select * from data1
union all
select * from data2
union all
select * from data3;

-------- احمالي النبيعات لكل سته ------
select year, sum(Sales) as total_sales 
from Sales_data 
group by Year;

-------- اجمالي الارباح لكل دولة ------ 
select Country, sum(Profit) as Total_Profit
from Sales_data
group by Country

-------- متوسط المبيعات لكل فئه ------- 
select Category , avg(sales) as Avg_Sales 
from Sales_data
group by Category

-------- عدد المنتحات المباعة لكل سنه ------ 
select year , count(distinct Product_ID) as total_Products
from Sales_data
group by Year

------- اعلى 5 دول في المبيعات -------
select top 5 country, sum(sales) as Total_Sales
from Sales_data
group by country
order by Total_Sales desc;

------- اعلى منتج من حيث الربح في 2020-------
select top 1 Product_Name , sum(Profit) as Total_profit
from Sales_data
where year=2020
group by Product_Name
order by Total_profit desc;

------- مقارنة المبيعات بين 2019 و2020 حسب الدولة ------

select Year,sum(sales) as total_Sales
from Sales_data
group by Year
having Year=2020 or year=2019
order by total_Sales

------- sub_category  اجمالي المبيعات لكل -----

select Sub_Category, sum(sales) as total_Sales
from Sales_data
group by Sub_Category

-------- اعلى فئة ربحا في كل سنة --------

select year ,Category, sum(Profit) as total_profit
from Sales_data
group by Year,Category
order by year,total_profit desc;

-------- الدول التي تجاوزت مبيعاتها 1 مليون في 2021 --------- 

select Country, sum(sales) as total_sales 
from Sales_data
where year=2021
group by Country
having sum(sales) > 1000000;

---------المنتجات ذات الربح السلبي ---------

select Product_Name , sum(profit) as totalProfit
from Sales_data
group by Product_Name
having sum(profit) < 0;

--------- نسبة مبيعات كل دولة من الاجمالي في 2020 -------

select Country , sum(sales) as total_sales 
, round(sum(sales) / (select sum(sales) from sales_data where year=2020) *100 , 2) as salesPrecentage
from Sales_data
where Year=2020
group by Country;

--------- نسبة الربح الى المبيعات لكل منتج ----------

select Product_Name , sum(profit) as total_profit ,sum(sales) as total_sales ,
round(sum(profit) / sum(sales) * 100, 2) as profit_Mergin_Percentage 
from Sales_data
group by Product_Name

--------- شراء في كل سنة segment  اكثر --------

select year, Segment, sum(sales) as total_sales
from Sales_data
group by year,Segment
order by total_sales;

--------- اقل 5 منتجات من حيث الربح --------

select top 5 Product_Name, sum(profit) as total_profit 
from Sales_data
group by Product_Name
order by total_profit asc;





