select *
from kraljic_dataset;

-- What are the top 5 suppliers by total spend?
select Supplier_Region, Total_Price
from kraljic_dataset
group by Supplier_Region,Total_Price
order by Total_Price DESC LIMIT 5;

 -- Which products have the highest supply risk and profit impact (i.e., strategic items)?
 
 select Product_Name,Supply_Risk_Score,Profit_Impact_Score
from kraljic_dataset
where Supply_Risk_Score>=4 
and Profit_Impact_Score>=4
group by Product_Name,Supply_Risk_Score,Profit_Impact_Score;

-- Which products have high environmental impact but low profit impact?
select Product_Name, Environmental_Impact,Profit_Impact_Score
from kraljic_dataset
where Environmental_Impact>=4 AND Profit_Impact_Score<=2
group by Product_Name, Environmental_Impact,Profit_Impact_Score;

-- Average lead time per region
select Supplier_Region,avg(Lead_Time_Days) AS Lead_Time
from kraljic_dataset
group by Supplier_Region
order by Lead_Time DESC LIMIT 10;

-- Single source products by risk score
select distinct(Product_Name),Supply_Risk_Score
from kraljic_dataset
where Single_Source_Risk = 'Yes'
group by Product_Name,Supply_Risk_Score;

-- Hidden Strategic Items
select Product_Name,Supply_Risk_Score,Profit_Impact_Score,Kraljic_Category
from kraljic_dataset
where Supply_Risk_Score>=4 
and Profit_Impact_Score<=3
and Kraljic_Category != 'Strategic'
group by Product_Name,Supply_Risk_Score,Profit_Impact_Score,Kraljic_Category;

-- Over-Reliance on Specific Supplier Regions

select Supplier_Region,Product_Name,Total_Price
from kraljic_dataset
where Supply_Risk_Score>=4
group by Supplier_Region,Product_Name, Total_Price
order by Total_Price DESC LIMIT 10;

-- High Spend on Low Impact Products

select Product_Name, Profit_Impact_Score, Total_Price
from kraljic_dataset
where Profit_Impact_Score<=2
group by Product_Name, Profit_Impact_Score, Total_Price
order by Total_Price DESC LIMIT 10;


select Product_Name, Supply_Risk_Score,Profit_Impact_Score,Total_Price
from kraljic_dataset
WHERE (Supply_Risk_Score >= 4 AND Profit_Impact_Score <= 2 AND Kraljic_Category = 'Strategic')
   OR (Supply_Risk_Score <= 2 AND Profit_Impact_Score >= 4 AND Kraljic_Category = 'Bottleneck')
group by Product_Name, Supply_Risk_Score,Profit_Impact_Score,Total_Price;
