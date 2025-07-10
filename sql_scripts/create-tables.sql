-- Database Structure for Sales Analytics Project
-- Generated on [today's date]

-- ========================================
-- TABLE: DailySales
-- ========================================
-- Query to get DailySales structure:
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'DailySales'
ORDER BY ORDINAL_POSITION;

-- Results:
-- SalesID (int, NOT NULL, Primary Key)
-- report_date (date, NULL)
-- day_of_week (varchar(10), NULL)
-- taxable_product_sales (decimal, NULL)
-- taxable_other_sales (decimal, NULL)
-- total_tax_fees (decimal, NULL)
-- non_taxable_product_sales (decimal, NULL)
-- non_taxable_other_sales (decimal, NULL)
-- gpi_sales (decimal, NULL)
-- gross_sales (decimal, NULL)
-- transaction_count (int, NULL)
-- cash_payments (decimal, NULL)
-- check_payments (decimal, NULL)
-- credit_debit_payments (decimal, NULL)
-- ebt_snap_payments (decimal, NULL)
-- beer_sales (decimal, NULL)
-- cigar_sales (decimal, NULL)
-- cigarette_sales (decimal, NULL)
-- dairy_sales (decimal, NULL)
-- grocery_notax_sales (decimal, NULL)
-- grocery_taxable_sales (decimal, NULL)
-- ice_bag_sales (decimal, NULL)
-- lotto_sales (decimal, NULL)
-- medicine_sales (decimal, NULL)
-- misc_sales (decimal, NULL)
-- scratch_off_sales (decimal, NULL)
-- smoke_shop_sales (decimal, NULL)
-- snacks_sales (decimal, NULL)
-- soda_sales (decimal, NULL)
-- water_sales (decimal, NULL)
-- wine_sales (decimal, NULL)
-- vendor_payouts (decimal, NULL)
-- safe_drops (decimal, NULL)
-- cash_back_lottery (decimal, NULL)
-- cancelled_baskets (int, NULL)
-- voided_items (int, NULL)
-- discounts_total (decimal, NULL)
-- price_overrides (int, NULL)
-- CreatedDate (datetime, NULL, DEFAULT getdate())

-- ========================================
-- TABLE: VendorPayouts
-- ========================================
-- Query to get VendorPayouts structure:
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    COLUMN_DEFAULT,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'VendorPayouts'
ORDER BY ORDINAL_POSITION;

-- Results:
-- PayoutID (int, NOT NULL, Primary Key)
-- payout_date (date, NULL)
-- vendor_name (varchar(100), NULL)
-- amount (decimal, NULL)
-- payment_method (varchar(50), NULL)
-- category (varchar(50), NULL)
-- notes (varchar(500), NULL)
-- CreatedDate (datetime, NULL, DEFAULT getdate())

-- ========================================
-- TABLE LIST
-- ========================================
-- All tables in database:
SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE';
-- Results: DailySales, VendorPayouts