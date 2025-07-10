-- Custom Business Intelligence Views for Sales Analytics Project
-- Created with Claude Opus assistance
-- These views transform raw transactional data into business insights

-- ========================================
-- VIEW 1: Daily Business Summary
-- Provides key daily metrics for business performance
-- ========================================
CREATE VIEW vw_DailySummary AS
SELECT 
    report_date as Date,
    day_of_week as Day,
    gross_sales as Revenue,
    transaction_count as Customers,
    ROUND(gross_sales / NULLIF(transaction_count, 0), 2) as AvgSale,
    cash_payments as Cash,
    credit_debit_payments as Card,
    ROUND((cash_payments / NULLIF(gross_sales, 0)) * 100, 1) as CashPercent
FROM dbo.DailySales;
GO

-- ========================================
-- VIEW 2: Product Performance Analysis
-- Breaks down sales by product category for trend analysis
-- ========================================
CREATE VIEW vw_ProductPerformance AS
SELECT Date, Product, Sales FROM (
    SELECT report_date as Date, 'Beer' as Product, beer_sales as Sales FROM DailySales WHERE beer_sales > 0
    UNION ALL
    SELECT report_date, 'Cigarettes', cigarette_sales FROM DailySales WHERE cigarette_sales > 0
    UNION ALL
    SELECT report_date, 'Lottery', lotto_sales + scratch_off_sales FROM DailySales WHERE (lotto_sales + scratch_off_sales) > 0
    UNION ALL
    SELECT report_date, 'Snacks', snacks_sales FROM DailySales WHERE snacks_sales > 0
    UNION ALL
    SELECT report_date, 'Grocery', grocery_taxable_sales + grocery_notax_sales FROM DailySales WHERE (grocery_taxable_sales + grocery_notax_sales) > 0
    UNION ALL
    SELECT report_date, 'Beverages', soda_sales + water_sales FROM DailySales WHERE (soda_sales + water_sales) > 0
) AS ProductData;
GO

-- ========================================
-- VIEW 3: Vendor Payment Summary
-- Analyzes vendor payment patterns and totals
-- ========================================
CREATE VIEW vw_VendorSummary AS
SELECT 
    vendor_name as Vendor,
    COUNT(*) as PaymentCount,
    SUM(amount) as TotalPaid,
    AVG(amount) as AvgPayment,
    MIN(payout_date) as FirstPayment,
    MAX(payout_date) as LastPayment
FROM VendorPayouts
WHERE vendor_name != 'No Vendors'
GROUP BY vendor_name;
GO

-- ========================================
-- VIEW 4: Daily Vendor Payout Trends
-- Shows daily vendor payment activity
-- ========================================
CREATE VIEW vw_DailyVendorPayouts AS
SELECT 
    payout_date as Date,
    COUNT(DISTINCT vendor_name) as VendorCount,
    SUM(amount) as TotalPayouts,
    MAX(amount) as LargestPayment
FROM VendorPayouts
WHERE vendor_name != 'No Vendors'
GROUP BY payout_date;
GO