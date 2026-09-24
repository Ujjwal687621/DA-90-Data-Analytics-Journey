# Day 36 — Power BI Fundamentals

**Date:** September 22, 2026  
**Phase:** Phase 3 — Power BI & Data Visualization  
**Project:** Portfolio Project #1 — Ujjsha Retail Analysis  
**Status:** ✅ Complete

---

## Objective

Begin Power BI by learning the fundamentals through hands-on work using the Ujjsha Retail Portfolio Project #1 dataset.

The focus was to understand the Power BI workflow, data model, relationships, visuals, tooltips, cross-highlighting, and visual-level filtering.

---

## Power BI Workflow

Learned the basic Power BI analyst workflow:

**Source → Power Query → Data Model → Calculations → Visuals → Report**

Understanding this workflow is important because Power BI is not only a visualization tool. An analyst must understand how data moves from the source through transformation and modeling before it becomes a report.

---

## Power BI Interface

Worked with the main Power BI Desktop areas:

- Report View
- Data View
- Model View
- Visualizations / Build visual pane
- Filters pane
- Fields / Data pane
- Report canvas

---

## Importing Data

Loaded the Ujjsha Retail Project #1 Excel workbook into Power BI.

Primary tables:

### SalesTable

Used as the primary fact table.

Fields:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category
- unit_price
- revenue

### ProductsTable

Used as the product dimension table.

The relationship between the tables is based on:

`product_id`

---

## Fact Table vs. Dimension Table

### SalesTable — Fact Table

Contains transactional sales records.

Each row represents a sale record / product line.

The table contains measurable business values such as:

- quantity
- unit_price
- revenue

### ProductsTable — Dimension Table

Contains descriptive information about products.

It provides product-level attributes used to describe and categorize sales.

---

## Data Model

Verified the relationship:

`SalesTable (*) ───── (1) ProductsTable`

Relationship characteristics:

- Many-to-one relationship
- `SalesTable` contains many records for a product
- `ProductsTable` contains one record per product
- Relationship is active
- Relationship uses `product_id`
- Filter direction allows ProductsTable to filter SalesTable

---

## Important Data Modeling Concepts Learned

### Cardinality

The `* : 1` relationship represents:

**Many Sales records → One Product**

### Active Relationship

The solid relationship line indicates that the relationship is active.

### Filter Direction

Filters can flow from the product dimension into the sales fact table.

### Grain

The grain of SalesTable is approximately:

**One row = one sale record / product line**

Understanding grain is important before creating calculations because aggregation behavior depends on what each row represents.

---

# Power Query Troubleshooting

A major hands-on troubleshooting issue occurred during Day 36.

The first Power BI revenue-by-category visual showed only:

**Computers**

The expected categories were:

- Accessories
- Audio
- Computers
- Networking
- Office

---

## Investigation

The Data View and Power Query Editor were used to investigate the issue.

The workbook contained multiple Excel objects with similar names, including:

- SalesTable_Clean1
- SalesTable_Clean
- SalesTable
- ProductsTable

The initially selected `SalesTable_Clean1` contained only Computers.

The `SalesTable_Clean` object also contained only Computers.

The original `SalesTable` contained the complete sales data across all categories.

---

## Root Cause

The Power BI query was pointing to the wrong Excel object.

The query was changed to use the correct:

**SalesTable**

After changing the Navigation step, several downstream Applied Steps became invalid because they had been built against the previous source structure.

This demonstrated an important Power Query concept:

**Applied Steps are sequential and dependent on previous steps.**

---

## Resolution

Removed the stale downstream steps and retained the valid source/navigation structure.

The corrected SalesTable contained:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category
- unit_price
- revenue

Explicit data types were then assigned:

| Field        | Data Type      |
| ------------ | -------------- |
| sale_id      | Whole Number   |
| product_id   | Whole Number   |
| sale_date    | Date           |
| quantity     | Whole Number   |
| product_name | Text           |
| category     | Text           |
| unit_price   | Decimal Number |
| revenue      | Decimal Number |

Closed and applied the Power Query changes.

---

# Revenue by Category Visual

Created a column chart using:

**X-axis:**

`category`

**Y-axis:**

`Sum of revenue`

The visual now correctly displays all five categories:

- Accessories
- Audio
- Computer
- Networking
- Office

---

# Tooltips

Practiced hovering over a category column.

The tooltip displayed:

- Category
- Sum of revenue

Learned that Power BI automatically provides contextual information when hovering over a data point.

---

# Cross-Highlighting

Clicked the Office category in the chart.

Observed:

- Office remained highlighted.
- Other categories became faded.

This behavior is called:

**Cross-highlighting**

Cross-highlighting allows the user to visually emphasize a selected data point while still keeping the other data visible for comparison.

Cleared the selection successfully.

---

# Filters Pane

Opened the Filters pane for the revenue-by-category visual.

Under:

**Filters on this visual**

Observed:

### category

`is (All)`

Filter type:

**Basic filtering**

Available categories:

- Accessories
- Audio
- Computer
- Networking
- Office

Also observed:

### Sum of revenue

`is (All)`

---

# Visual-Level Filtering

Applied a visual-level filter:

**category = Office**

The chart changed to display only:

**Office**

Cleared the filter afterward and restored all five categories.

This demonstrated that a visual-level filter affects the selected visual rather than automatically filtering the entire report page.

---

# Concepts Learned

Day 36 introduced the following Power BI concepts:

- Power BI Desktop workflow
- Report View
- Data View
- Model View
- Power Query
- Fact tables
- Dimension tables
- Data grain
- Relationships
- Cardinality
- Many-to-one relationships
- Active relationships
- Filter direction
- Data types
- Column charts
- Category fields
- Aggregation
- Sum of revenue
- Tooltips
- Cross-highlighting
- Filters pane
- Visual-level filters
- Basic filtering
- Power Query Applied Steps
- Navigation steps
- Troubleshooting incorrect source objects

---

# Important Analyst Lesson

A Power BI visual can look incorrect because of a problem upstream in the data model or Power Query layer.

The Day 36 issue demonstrated the importance of troubleshooting in sequence:

**Source → Power Query → Data Model → Visual**

Instead of assuming that the visual itself was wrong, the underlying source and transformation steps were investigated.

---

# Day 36 Practical Achievement

Successfully created a working Power BI revenue-by-category visual using the Ujjsha Retail dataset.

Successfully diagnosed and corrected an incorrect Power Query source.

Successfully verified the corrected data model and relationship.

Successfully practiced tooltip behavior, cross-highlighting, and visual-level filtering.

---

# Day 36 Status

**Power BI Fundamentals — Day 36: ✅ Complete**

The following areas were intentionally left for continued Power BI training:

- Page-level filters
- Report-level filters
- More advanced visual interactions
- Additional visual types
- Slicers
- Measures and DAX
- Calculated columns
- Filter context
- Date analysis
- Interactive reporting
- Dashboard design
- Validation and troubleshooting
- Performance basics
- Publishing and sharing

These will continue in the upcoming Power BI sessions.

---

# Next Step

**Day 37 — Power BI Filtering, Slicers & Report Interactions**
