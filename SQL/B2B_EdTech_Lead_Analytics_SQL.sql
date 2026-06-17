-- ==========================================================
-- B2B EDTECH LEAD CONVERSION ANALYSIS USING POSTGRESQL
-- ==========================================================

-- Project Objective:
-- Analyze lead conversion performance and identify key factors
-- influencing conversions across marketing channels, engagement
-- levels, and lead interactions.

-- Tools Used:
-- PostgreSQL (Supabase)
-- SQL

-- Dataset:
-- B2B EdTech Lead Conversion Sales Analytics Dataset
-- Total Records: 9,240

-- Key Analysis Areas:
-- 1. Total Leads & Converted Leads
-- 2. Overall Conversion Rate
-- 3. Marketing Source Performance
-- 4. Conversion Rate by Marketing Source
-- 5. Engagement Level Analysis
-- 6. High Intent Lead Analysis
-- 7. Website Visit Analysis
-- 8. City-wise Lead Distribution
-- 9. Last Significant Interaction Analysis
-- 10. Top Performing Marketing Sources
-- 11. Lead Acquisition Type Analysis
-- 12. Average Engagement Time Analysis

-- ==========================================================
-- SQL QUERIES
-- ==========================================================

--Total Leads & Converted Leads
SELECT
COUNT(*) AS total_leads,
SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) AS converted_leads
FROM leads_data;

--Top Marketing Sources
SELECT
"Marketing_Source",
COUNT(*) AS total_leads
FROM leads_data
GROUP BY "Marketing_Source"
ORDER BY total_leads DESC;

--Conversion Rate by Source
SELECT
"Marketing_Source",
COUNT(*) AS total_leads,
SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) AS converted_leads,
ROUND(
100.0 * SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) / COUNT(*),
2
) AS conversion_rate
FROM leads_data
GROUP BY "Marketing_Source"
ORDER BY conversion_rate DESC;

--Engagement Level Analysis
SELECT
"Engagement_Level",
COUNT(*) AS total_leads,
SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) AS converted_leads
FROM leads_data
GROUP BY "Engagement_Level"
ORDER BY total_leads DESC;

--High Intent Leads
SELECT
"High_Intent_Lead",
COUNT(*) AS lead_count
FROM leads_data
GROUP BY "High_Intent_Lead";

--Website Visits vs Conversion
SELECT
AVG("Total_Website_Visits") AS avg_visits,
AVG(CASE WHEN "Lead_Converted" = 1 THEN "Total_Website_Visits" END) AS converted_avg_visits
FROM leads_data;

--Top Cities
SELECT
"City",
COUNT(*) AS total_leads
FROM leads_data
GROUP BY "City"
ORDER BY total_leads DESC
LIMIT 10;

--Last Significant Interaction
SELECT
"Last_Significant_Interaction",
COUNT(*) AS total_leads
FROM leads_data
GROUP BY "Last_Significant_Interaction"
ORDER BY total_leads DESC;

--Top 5 Sources by Conversion Volume
SELECT
"Marketing_Source",
SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) AS converted_leads
FROM leads_data
GROUP BY "Marketing_Source"
ORDER BY converted_leads DESC
LIMIT 5;

--Conversion by Lead Acquisition Type
SELECT
"Lead_Acquisition_Type",
COUNT(*) AS total_leads,
SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) AS converted_leads
FROM leads_data
GROUP BY "Lead_Acquisition_Type"
ORDER BY converted_leads DESC;

--High Intent vs Normal Leads
SELECT
"High_Intent_Lead",
ROUND(
100.0 * SUM(CASE WHEN "Lead_Converted" = 1 THEN 1 ELSE 0 END) / COUNT(*),
2
) AS conversion_rate
FROM leads_data
GROUP BY "High_Intent_Lead";

--Average Time on Website
SELECT
ROUND(AVG("Total_Engagement_Time"),2) AS avg_time_all_leads,
ROUND(AVG(CASE WHEN "Lead_Converted" = 1 THEN "Total_Engagement_Time" END),2) AS avg_time_converted
FROM leads_data;


-- ==========================================================
-- CONCLUSION
-- ==========================================================

-- The analysis revealed that Google and Direct Traffic
-- generated the highest number of leads and conversions.

-- Reference showed the strongest conversion efficiency,
-- indicating high-quality leads despite lower lead volume.

-- Leads with higher engagement levels and stronger website
-- activity demonstrated significantly better conversion rates.

-- Converted leads spent more time engaging with the platform,
-- highlighting the importance of user engagement in the
-- conversion process.

-- Overall conversion rate was approximately 38.5%,
-- providing a solid benchmark for future marketing campaigns.

-- These insights can help optimize marketing spend,
-- improve lead targeting strategies, and increase overall
-- conversion performance.