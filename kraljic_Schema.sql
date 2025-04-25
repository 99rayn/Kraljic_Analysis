use kraljic_matrix;


drop table if exists kraljic_dataset;

create table kraljic_dataset(
Product_ID	varchar(20) null,
Product_Name	varchar(50) null,
Supplier_Region	varchar(50) null,
Lead_Time_Days	int null,
Order_Volume_Units	int null,
Cost_per_Unit	decimal(20) null,
Supply_Risk_Score	int null,
Profit_Impact_Score	int null,
Environmental_Impact	int null,
Single_Source_Risk	varchar(10) null,
Kraljic_Category	varchar(30) null,
Total_Price decimal(20) null
);