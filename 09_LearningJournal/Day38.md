# Day 38 — Power BI Interactive Analysis & Navigation

**Phase:** Phase 3 — Power BI & Data Visualization

**Project:** Portfolio Project #1 — Ujjsha Retail Analysis

**Status:** ✅ Complete

---

## Objective

Learn how analysts design interactive Power BI reports by implementing hierarchies, drill-down, drill-through navigation, enhanced tooltips, and professional dashboard usability features.

The focus shifted from learning Power BI features to understanding how users investigate business questions with the fewest possible clicks.

---

# Module 1 — Analyst Decision Framework

Reviewed how different filtering methods solve different business problems.

| Business Need                   | Best Power BI Feature |
| ------------------------------- | --------------------- |
| Change one chart only           | Visual Filter         |
| Filter one report page          | Page Filter           |
| Filter every report page        | Report Filter         |
| Let users explore interactively | Slicer                |

Key lesson:

The same technical result can often be achieved multiple ways, but analysts choose the method based on how stakeholders will use the report.

---

# Dashboard Layout Improvement

Improved the Summary page by positioning the Category slicer near the top of the report.

Final slicer configuration:

* Dropdown style
* Single Select: Off
* Multi-select enabled
* No active selection

This improved report usability while preserving space for visuals.

---

# Module 2 — Hierarchies

Created the first Power BI hierarchy.

Location:

`ProductsTable`

Hierarchy structure:

`category Hierarchy
    ├── category
    └── product_name`

Learned why hierarchies belong in the dimension table rather than the fact table.

---

# Drill Down

Used the hierarchy inside the Revenue by Product Category column chart.

Drilled into:

`Computer`

Observed product-level detail:

* Business Laptop
* Gaming Laptop
* Desktop Computer
* Mini PC
* Workstation

Learned that Drill Down expands only the selected category.

---

# Drill Up

Returned from product level back to the category level.

Confirmed the chart restored the original five category bars.

---

# Go to Next Level

Used:

**Go to Next Level**

Observed:

* Category labels disappeared.
* Products from every category appeared together.
* The visual became a complete product-level ranking.

Business use case:

Useful when comparing all products regardless of category.

---

# Expand All Down One Level

Used:

**Expand All Down One Level**

Observed:

* Category names remained visible.
* Products appeared nested beneath each category.

Example:

`Computer
    Business Laptop
    Gaming Laptop
    Desktop Computer
    Mini PC
    Workstation`

Business use case:

Allows executives to compare category performance while simultaneously viewing product-level detail.

---

# Hierarchy QA Validation

Performed a complete quality assurance test.

Verified:

* Hierarchy exists
* Drill Down works
* Drill Up works
* Go to Next Level works
* Expand All works
* Tooltip correctly displays hierarchy context

While testing, discovered that Power BI displays hierarchy values as a breadcrumb.

Example tooltip:

`Category    Product Name
Computer    Business Laptop`

Learned that this is expected Power BI behavior rather than a formatting issue.

Removed the redundant:

`First Product Name`

tooltip field after identifying that the hierarchy already supplies product context.

---

# Module 3 — Drill-Through

Built the first multi-page report experience.

Created a new report page:

`Product Details`

Configured:

`Drill-through field:
ProductsTable[category]`

Built a detail table containing:

* product_name
* category
* unit_price

Tested drill-through.

Workflow:

`Summary Page
    ↓
Right-click Computer
    ↓
Drill-through
    ↓
Product Details`

Observed:

* Automatic navigation
* Computer-only products displayed
* No manual filtering required

This demonstrated Power BI's context preservation behavior.

---

# Back Button

Verified that Power BI automatically creates a Back button on Drill-through pages.

Learned the difference between:

* automatic Drill-through Back buttons
* manually configured navigation buttons

---

# Module 4 — Enhanced Tooltips

Improved the Revenue by Product Category visual.

Added:

* quantity
* product_name (initially)

While testing hierarchy behavior, discovered that the hierarchy already provides Product Name context.

Removed the redundant Product Name tooltip field.

Final tooltip displays:

* Category
* Product Name
* Sum of Revenue
* Sum of Quantity

Learned that numeric fields aggregate naturally while text fields default to aggregations such as First.

---

# Module 5 — Professional Dashboard Polish

Updated the column chart title.

Changed:

`Revenue by Category`

to

`Revenue by Product Category`

Discussed why descriptive titles improve dashboard usability.

Compared:

* generic chart titles
* business-focused titles

---

# Progressive Disclosure

Learned an important dashboard design principle.

Instead of placing every metric on the page, information can be revealed progressively.

Example progression:

| User Need             | Power BI Feature |
| --------------------- | ---------------- |
| Quick overview        | Chart            |
| More context          | Tooltip          |
| Product investigation | Drill Down       |
| Full detail page      | Drill-through    |

This keeps dashboards clean while preserving analytical depth.

---

# Final Dashboard Structure

Summary Page contains:

* Revenue by Product Category column chart
* Revenue Share by Category donut chart
* Category Dropdown slicer

Product Details page contains:

* Drill-through navigation
* Back button
* Product Details table

The report now functions as a connected, interactive business dashboard.

---

# Concepts Learned

Day 38 introduced and reinforced:

* analyst decision-making
* hierarchy creation
* Category → Product hierarchy
* Drill Down
* Drill Up
* Go to Next Level
* Expand All
* hierarchy breadcrumbs
* hierarchy QA testing
* Drill-through
* context preservation
* automatic Back button
* enhanced tooltips
* tooltip cleanup
* progressive disclosure
* dashboard usability
* professional visual titles
* report navigation

---

# Biggest Lesson

The most important lesson from Day 38 was learning to design reports around user workflows rather than individual visuals.

Instead of creating additional charts for every question, interactive navigation allows users to investigate data naturally through hierarchies, drill-down, and drill-through.

---

# Day 38 Status

**Power BI Interactive Analysis & Navigation — ✅ Complete**

---

# Next Step

**Day 39 — DAX Measures & Business Calculations**

Planned topics:

* Total Revenue
* Total Quantity Sold
* Average Selling Price
* Total Transactions
* Revenue per Product
* KPI Cards
* Introduction to DAX Measures
