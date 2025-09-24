IF OBJECT_ID('gold.dim_customers','U') IS NOT NULL
	DROP VIEW gold.dim_customers
GO
CREATE VIEW gold.dim_customers AS
SELECT 
ROW_NUMBER() OVER(ORDER BY ci.cst_id) AS Customer_key,
ci.cst_id AS Customer_id,
ci.cst_key AS Customer_Number,
ci.cst_firstname AS First_name,
ci.cst_lastname AS Last_name,
la.cntry AS Country,
ci.cst_marital_status AS Marital_status,
CASE WHEN ci.cst_gndr!='N/A' THEN ci.cst_gndr
	 ELSE COALESCE(ca.gen,'N/A')
END as Gender,
ca.bdate AS Birthdate,
ci.cst_create_date AS Create_date


IF OBJECT_ID('gold.dim_products','U') IS NOT NULL
	DROP VIEW gold.dim_products
GO
CREATE VIEW gold.dim_products AS 
SELECT
ROW_NUMBER() OVER(ORDER BY pr.prd_id) AS Product_key,
pr.prd_id AS Product_id,
pr.prd_key AS Product_Number,
pr.prd_nm AS Product_name,
pr.cat_id AS Category_id,
px.cat AS Category,
px.subcat AS Sub_Category,
px.maintenance AS Maintainance,
pr.prd_cost AS Product_cost,
pr.prd_line AS Product_line,
pr.prd_start_dt AS Product_startdate

FROM silver.crm_prd_info pr
LEFT JOIN silver.erp_px_cat_g1v2 px
ON pr.cat_id=px.id
WHERE pr.prd_end_dt IS NULL


FROM silver.crm_cst_info ci
LEFT JOIN silver.erp_cust_az12 ca
ON ci.cst_key=ca.cid
LEFT JOIN silver.erp_loc_a101 la
ON ci.cst_key=la.cid;

IF OBJECT_ID('gold.fact_sales','U') IS NOT NULL
	DROP VIEW gold.fact_sales
GO
CREATE VIEW gold.fact_sales AS
SELECT 
sd.sls_ord_num AS Order_number,
dp.Product_key,
dc.Customer_id,
sd.sls_order_dt AS Order_date,
sd.sls_ship_dt AS Shipping_date,
sd.sls_due_dt AS Due_date,
sd.sls_sales AS Sale_amount,
sd.sls_quantity AS Quantity,
sd.sls_price AS Price

FROM silver.crm_sales_details sd
LEFT JOIN gold.dim_products dp
ON dp.product_number=sd.sls_prd_key
LEFT JOIN gold.dim_customers dc
ON dc.customer_id=sd.sls_cust_id
