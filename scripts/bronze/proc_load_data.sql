--Load the data from the source to the DATAWAREHOUSE
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	BEGIN TRY
		--For cust_info table
		PRINT '**********************************************';
		PRINT 'Loading the Bronze Layer';
		PRINT '**********************************************';


		PRINT '----------------------------------------------';
		PRINT 'Loading the data from CRM into Tables';
		PRINT '----------------------------------------------';


		PRINT 'Truncating Table bronze.crm_cst_info';
		PRINT 'Inserting Into :bronze.crm_cst_info';
		DECLARE @start_time DATETIME,@end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
		SET @start_time=GETDATE();
		SET @batch_start_time=GETDATE();
		TRUNCATE TABLE bronze.crm_cst_info;
		BULK INSERT bronze.crm_cst_info
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';

		--SELECT * FROM bronze.crm_cst_info;

		--For prd_info Tabl
		PRINT 'Truncating Table bronze.crm_prd_info';
		PRINT 'Inserting Into :bronze.crm_prd_info';
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		--SELECT * FROM bronze.crm_prd_info;


		--For sales_details Table
		PRINT 'Truncating Table bronze.crm_sales_details';
		PRINT 'Inserting Into :bronze.crm_sales_details';
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		--SELECT * FROM bronze.crm_sales_details;

		--For cust_az12 Table
		PRINT 'Truncating Table bronze.erp_cust_az12';
		PRINT 'Inserting Into :bronze.erp_cust_az12';
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		--SELECT * FROM bronze.erp_cust_az12;
		PRINT '----------------------------------------------';
		PRINT 'Loading the data from ERP into Tables';
		PRINT '----------------------------------------------';

		--For loc_a101 Table
		PRINT 'Truncating Table bronze.erp_loc_a101';
		PRINT 'Inserting Into :bronze.erp_loc_a101';
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		-- SELECT * FROM bronze.erp_loc_a101;

		--For p_cat_g1v2 TAble
		PRINT 'Truncating Table bronze.erp_px_cat_g1v2';
		PRINT 'Inserting Into :bronze.erp_px_cat_g1v2';
		SET @start_time=GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Eash\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR = ',' ,
			TABLOCK -- It locks the table while the insertion
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duartion:'+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) +'seconds';
		SET @batch_end_time=GETDATE();
		PRINT'=========================================';
		PRINT 'LOADING COMPLETED.....';
		PRINT 'TOTAL LOADING DURATION :'+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time)AS NVARCHAR)+'seconds';
		PRINT'=========================================';
		--SELECT * FROM bronze.erp_px_cat_g1v2;
	END TRY
	BEGIN CATCH
	    PRINT '===============================================';
		PRINT 'Error Occured during loading of bronze layer';
		PRINT 'Error Message:'+ERROR_MESSAGE();
		PRINT 'Error MEssage:'+CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT '===============================================';
	END CATCH
END
