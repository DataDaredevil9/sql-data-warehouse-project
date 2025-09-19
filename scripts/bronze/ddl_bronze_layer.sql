--*********************DDL Command for table creation of bronze layer*************************
--SCRIPT PURPOSE:
--THIS IS TO CREATE ALL THE NECESSARY TABLES FOR  INSERTING THE DATA INTO BRONZE LAYER
--===================================================================================


-- Creating the Bronze Layer

--Creating Customer Info Table
IF OBJECT_ID('bronze.crm_cst_info','U') IS NOT NULL
	DROP TABLE bronze.crm_cst_info;
 CREATE TABLE bronze.crm_cst_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(10),
	cst_gndr NVARCHAR(10),
	cst_create_date DATE
);

--Creating Product Info Table
IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
	DROP TABLE bronze.crm_prd_info;
 CREATE TABLE bronze.crm_prd_info(
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(10),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

--Creating Sales Details Table
IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
	DROP TABLE bronze.crm_sales_details;
 CREATE TABLE bronze.crm_sales_details(
	sls_ord_num NVARCHAR(20),
	sls_prd_key NVARCHAR(20),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

--Craeting Customer AZ12 Table
IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
	DROP TABLE bronze.erp_cust_az12;
 CREATE TABLE bronze.erp_cust_az12(
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(10),
);

--Creating LOC_A101 Table
IF OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
	DROP TABLE bronze.erp_loc_a101;
CREATE TABLE bronze.erp_loc_a101(
	cid NVARCHAR(50),
	cntry NVARCHAR(20)
);

-- Creating PX_CAT_G1V2 Table
IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
	DROP TABLE bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2(
	id NVARCHAR(10),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(10)
);
