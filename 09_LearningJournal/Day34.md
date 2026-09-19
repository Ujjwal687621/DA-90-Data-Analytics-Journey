# Day 34 — Power Query & Data Preparation

**Date:** September 19, 2026  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Focus:** Power Query, Data Preparation, Transformation, Validation, and Repeatability  
**Status:** ✅ Complete

## 1. Day 34 Objective

The objective of Day 34 was to learn and practically apply Microsoft Excel Power Query for data preparation.

The focus was on taking raw data, applying repeatable transformations, validating the resulting dataset, combining related datasets, and loading the prepared data back into Excel.

The practical workflow followed:

Raw Data → Power Query → Clean / Transform → Validate → Refresh → Load → Analysis-Ready Data

## 2. Environment Setup

Power Query work initially required an Excel version update.

The original Excel installation was:

- Excel for Mac Version 16.46
- Microsoft 365 Subscription

The Mac was subsequently updated and Excel was upgraded to:

- Microsoft Excel for Mac Version 16.113.1
- Microsoft 365 Subscription

The updated Excel version provided access to the modern Power Query interface through:

Data → Get Data (Power Query)

## 3. Power Query Fundamentals

Power Query was introduced as Excel's data preparation and transformation tool.

Key purposes include:

- Importing data
- Cleaning data
- Transforming data
- Changing data types
- Filtering records
- Removing unnecessary columns
- Replacing values
- Handling missing values
- Removing duplicates
- Creating calculated columns
- Creating conditional columns
- Combining datasets
- Refreshing transformations
- Loading transformed data back into Excel

The major concept learned was that Power Query creates a repeatable transformation process rather than requiring the analyst to manually repeat the same cleaning tasks.

## 4. Power Query Workspace

The Power Query Editor was used to inspect and transform the dataset.

Important areas included:

- Queries pane
- Data preview
- Column headers
- Data type indicators
- Applied Steps
- Query Settings

Applied Steps record the sequence of transformations performed on the dataset.

Example workflow:

Source → Navigation → Validated Data Types → Filtered Rows → Replaced Value → Trimmed Text → Added Custom → Validation → Conditional Logic → Merge

## 5. Dataset Used

The primary dataset used during the practical exercise was:

**SalesTable**

The table contained:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category
- unit_price
- revenue

A separate:

**ProductsTable**

was also brought into Power Query to practice combining datasets.

## 6. Data-Type Validation

The existing data types were inspected and validated.

| Column       | Data Type      |
| ------------ | -------------- |
| sale_id      | Whole Number   |
| product_id   | Whole Number   |
| sale_date    | Date           |
| quantity     | Whole Number   |
| product_name | Text           |
| category     | Text           |
| unit_price   | Decimal Number |
| revenue      | Decimal Number |

The automatically generated Power Query step was renamed from:

`Changed column types`

to:

`Validated Data Types`

This reinforced the principle that data types should be validated based on business meaning rather than changed unnecessarily.

## 7. Removing Unnecessary Columns

The `product_id` column was initially removed from the working query as a practical exercise in removing unnecessary fields.

Later, the column was restored because it was required as the key for demonstrating a Power Query Merge.

This demonstrated an important principle:

> Columns should only be removed when they are genuinely unnecessary for the intended analysis or transformation.

## 8. Filtering Rows

The `category` column was filtered to:

`Computer`

This reduced the working dataset to:

**35 rows**

The resulting Applied Step was:

`Filtered Rows`

The purpose was to practice creating a reusable filtering rule rather than manually deleting records.

## 9. Replacing Values

The category value:

`Computer`

was replaced with:

`Computers`

The resulting Applied Step was:

`Replaced Value`

This demonstrated how Power Query can standardize values using a repeatable transformation rather than manually editing individual cells.

## 10. Missing-Value Inspection

The `product_name` column was inspected for missing values.

No `(null)` or blank values were found in the current filtered dataset.

No missing-value transformation was therefore required.

Key lesson:

> Missing values should be investigated and understood before deciding whether to remove, replace, or retain them.

## 11. Duplicate Inspection

The dataset was checked for duplicate rows.

No duplicate rows were found.

No duplicate-removal transformation was therefore necessary.

Key lesson:

> Do not remove duplicates simply because the feature exists. First determine whether duplicate records actually represent a data-quality problem.

Repeated product names or products appearing in multiple sales records do not automatically represent duplicates.

## 12. Text Cleaning — Trim

The `product_name` column was transformed using:

**Transform → Format → Trim**

The resulting Applied Step was:

`Trimmed Text`

No visible product-name changes occurred because the current data did not contain obvious leading or trailing spaces.

The transformation was still useful for learning how Power Query can standardize whitespace.

## 13. Text Standardization Lesson

The `product_name` column was temporarily transformed using:

**Capitalize Each Word**

This changed:

`Mini PC`

to:

`Mini Pc`

The transformation was determined to be inappropriate because it changed the correct capitalization of the acronym `PC`.

The transformation was therefore reverted.

This created an important analyst lesson:

> A transformation can technically work while still making the data worse.

The correct question is not:

"Can Power Query perform this transformation?"

The correct question is:

"Does this transformation improve the data for the business purpose?"

Data cleaning should improve data quality rather than simply modify values.

## 14. Custom Column — Calculated Revenue

A custom column was created:

`Calculated Revenue`

Formula:

`[quantity] * [unit_price]`

The resulting Applied Step was:

`Added Custom`

This independently calculated revenue from the underlying quantity and unit price.

## 15. Revenue Validation

The existing `revenue` column was compared against `Calculated Revenue`.

A second custom column was created:

`Revenue Check`

Formula:

`if [revenue] = [Calculated Revenue] then "Match" else "Mismatch"`

The resulting Applied Step was:

`Added Custom 1`

The observed validation result was:

`Match`

This demonstrated a basic data reconciliation process:

Source Metric → Independent Calculation → Comparison → Validation

## 16. Conditional Column

A conditional column was created:

`Revenue Status`

Business rule:

If Revenue Check = Match → Valid  
Otherwise → Review

The resulting Applied Step was:

`Inserted Conditional Column`

The observed result was:

`Valid`

This demonstrated how Power Query can convert technical validation results into business-readable status indicators.

## 17. Merge Queries

A second query was created from:

`ProductsTable`

The working sales query was renamed:

`SalesTable_Clean`

The unnecessary duplicate `SalesTable` query was removed so the Power Query environment remained clean.

The final query structure used for the merge was:

- SalesTable_Clean
- ProductsTable

## 18. Merge Queries and SQL JOIN

The Power Query Merge feature was used to combine:

`SalesTable_Clean`

with:

`ProductsTable`

The common key was:

`product_id`

The join type used was:

`Left Outer`

Conceptually, this is equivalent to a SQL LEFT JOIN:

SELECT
    s.*,
    p.*
FROM SalesTable_Clean s
LEFT JOIN ProductsTable p
    ON s.product_id = p.product_id;

Important conceptual connection:

**Power Query Merge ≈ SQL JOIN**

A Merge combines related datasets using a matching key.

## 19. Expanding Merged Data

After the Merge, the resulting ProductsTable column was expanded.

The selected fields were:

- product_name
- category
- unit_price

Because those columns already existed in the sales query, Power Query created:

- product_name.1
- category.1
- unit_price.1

The duplicate expanded fields were removed because they did not provide additional information.

This reinforced the importance of avoiding unnecessary redundant fields in an analysis-ready dataset.

## 20. Append Queries

Append Queries was introduced conceptually.

Append combines datasets with similar structures by adding rows.

Example:

January Sales + February Sales = Combined Sales

The SQL equivalent is conceptually:

`UNION / UNION ALL`

Key distinction:

**Merge adds columns. Append adds rows.**

If January Sales and February Sales have the same structure and need to be combined into one dataset, use:

**Append**

## 21. Merge vs Append

| Power Query | SQL Equivalent    | Purpose                                |
| ----------- | ----------------- | -------------------------------------- |
| Merge       | JOIN              | Combine related datasets using a key   |
| Append      | UNION / UNION ALL | Stack datasets with similar structures |

**Merge:** Sales + Products → More columns

**Append:** January Sales + February Sales → More rows

## 22. Applied Steps and Step Navigation

Applied Steps were used throughout the exercise.

The user practiced clicking different Applied Steps to inspect the dataset at different points in the transformation process.

This demonstrated that Power Query maintains a sequential transformation pipeline.

Example:

Source → Navigation → Validated Data Types → Filtered Rows → Replaced Value → Trimmed Text → Added Custom → Revenue Validation → Conditional Column → Merge

## 23. Refresh and Repeatability

The Power Query preview was refreshed.

The data remained correct after refresh.

This demonstrated one of the most important Power Query concepts:

> Refresh reruns the transformation process against the source data.

Instead of manually repeating the same cleaning operations whenever the source changes, Power Query can rerun the recorded Applied Steps.

Conceptually:

New / Updated Raw Data → Refresh → Applied Steps Run Again → Updated Clean Dataset

## 24. Close & Load

After completing the transformations, both queries were loaded back into the Excel workbook.

New worksheets were created for:

- ProductsTable
- SalesTable_Clean

The original source data remained available.

The completed workflow was:

Raw Data → Power Query → Clean / Transform → Validate → Merge / Enrich → Refresh → Close & Load → Analysis-Ready Excel Data

## 25. Day 34 Competency Checkpoint

### 1. January Sales + February Sales

**Answer:** Append

Reason: Both datasets contain sales records with the same structure, so the rows should be combined.

### 2. Sales + Products

**Answer:** Merge

Reason: Product information needs to be added to sales using a common key, resulting in additional columns.

### 3. Power Query equivalent of SQL LEFT JOIN

**Answer:** Merge using a Left Outer join

### 4. Why is Refresh important?

**Answer:** It reruns the Power Query transformation steps against the source data.

### 5. Should duplicates be removed if none exist?

**Answer:** No

Cleaning should be based on an actual data-quality requirement.

### 6. Should an unwanted text transformation be kept?

**Answer:** No

If the transformation creates an undesirable result and does not support the business purpose, it should be reverted.

### 7. Merge vs Append

**Answer:** Merge adds columns. Append adds rows.

### 8. Purpose of Applied Steps

**Answer:** Applied Steps records the sequential transformations performed in Power Query and creates a repeatable data-preparation workflow.

## 26. Key Lessons

**Power Query:** Power Query is a repeatable data-preparation tool.

**Applied Steps:** Transformations are recorded sequentially and can be inspected or revised.

**Data Types:** Data types should be validated based on the meaning of the data.

**Cleaning:** Cleaning should improve data quality rather than modify data unnecessarily.

**Missing Values:** Missing data should be investigated before deciding how to handle it.

**Duplicates:** Duplicates should only be removed when they represent actual duplicate records.

**Custom Columns:** Power Query can calculate new fields using existing columns.

**Conditional Columns:** Business rules can be translated into reusable transformation logic.

**Merge:** Merge combines related datasets using a common key and is conceptually similar to SQL JOIN.

**Append:** Append combines datasets with similar structures by stacking rows and is conceptually similar to SQL UNION / UNION ALL.

**Refresh:** Refresh allows the transformation workflow to be rerun against updated source data.

**Validation:** Source metrics can be independently recalculated and compared to validate data quality.

## 27. Day 34 Practical Learning Reflection

Day 34 followed the revised DA-90 practical learning approach:

**Learn briefly → Perform in Excel → Inspect result → Troubleshoot → Interpret → Move on**

Instead of relying primarily on theoretical questions, Power Query skills were learned through direct interaction with the Ujjsha Retail Project #1 workbook.

The session included troubleshooting the Excel environment, building Power Query queries, applying transformations, validating calculations, merging datasets, refreshing the transformation pipeline, and loading the final results into Excel.

A particularly important learning moment occurred when `Mini PC` was changed to `Mini Pc` by the Capitalize Each Word transformation. The transformation was intentionally reverted because it reduced data quality.

This reinforced the analyst principle:

> Data transformation should serve the business and improve the dataset, not simply change the dataset.

## 28. Day 34 Competency Status

**🟢 Learned**

- Power Query fundamentals
- Power Query Editor
- Queries
- Applied Steps
- Data-type validation
- Filtering
- Removing columns
- Replacing values
- Trim
- Missing-value inspection
- Duplicate inspection
- Custom columns
- Conditional columns
- Data validation
- Merge Queries
- Left Outer Join
- Expand
- Append concept
- Refresh
- Close & Load
- SQL JOIN ↔ Power Query Merge
- SQL UNION ↔ Power Query Append
- Repeatable transformation workflows

**Day 34 Status: ✅ COMPLETE**

