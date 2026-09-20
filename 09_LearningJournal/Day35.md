# Day 35 — Excel Dashboard & Excel Sign-Off

**Project:** DA-90 — Data Analytics Journey  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Project:** Portfolio Project #1 — Ujjsha Financial Technologies / Ujjsha Retail

---

## Day 35 Objective

Complete the Excel reporting layer for Portfolio Project #1 by building a professional, interactive dashboard from the completed July vs. August retail analysis.

The goal was to transform the underlying Excel analysis into a business-facing deliverable containing:

- KPI summary
- Charts
- Interactive filtering
- Business findings
- Recommended investigation
- Data limitations
- Professional dashboard formatting
- One-page print layout

---

## Practical Workbook Work

Day 35 was completed directly in the Ujjsha Retail Project #1 Excel workbook.

The dashboard was created on a dedicated worksheet named:

`Dashboard`

The dashboard was designed around the primary business question:

> What changed from July to August, where did it change, and what should management investigate?

---

## Dashboard Header

Created the dashboard header:

`Ujjsha Retail — Sales Performance Dashboard`

Subtitle:

`July vs. August Performance Analysis`

Project identifier:

`Portfolio Project #1 | Excel Analysis`

---

## KPI Summary

Created a KPI summary comparing July and August performance.

### Total Revenue

July:

`$57,237.81`

August:

`$42,551.47`

Change:

`-25.66%`

Formula:

`=(August Revenue - July Revenue) / July Revenue`

---

### Transactions

July:

`61`

August:

`36`

Change:

`-40.98%`

Formula:

`=(August Transactions - July Transactions) / July Transactions`

---

### Units Sold

July:

`204`

August:

`125`

Change:

`-38.73%`

Formula:

`=(August Units - July Units) / July Units`

---

### Revenue / Transaction

July:

`$938.32`

August:

`$1,181.99`

Change:

`+25.97%`

Formulas:

`=July Revenue / July Transactions`

`=August Revenue / August Transactions`

`=(August Revenue / Transaction - July Revenue / Transaction) / July Revenue / Transaction`

---

### Revenue / Unit

July:

`$280.58`

August:

`$340.41`

Change:

`+21.32%`

Formulas:

`=July Revenue / July Units`

`=August Revenue / August Units`

`=(August Revenue / Unit - July Revenue / Unit) / July Revenue / Unit`

---

### MoM Revenue Change

Created a Month-over-Month revenue KPI using July as the comparison period and August as the current period.

Result:

`-25.66%`

Formula:

`=(August Revenue - July Revenue) / July Revenue`

---

## Conditional Formatting

Applied conditional formatting to the KPI Change column.

Negative values were automatically identified using:

`Cell Value < 0`

Positive values were automatically identified using:

`Cell Value > 0`

This allows the dashboard to dynamically distinguish positive and negative KPI changes instead of relying on manually formatted values.

---

## Chart 1 — Revenue by Category

Created a clustered column chart comparing July and August revenue by category.

Chart title:

`Revenue by Category — July vs. August`

Categories included:

- Accessories
- Audio
- Computer
- Networking
- Office

The chart was formatted with:

- Data labels
- Currency values
- Clear title
- Consistent chart border
- July vs. August comparison

The chart was positioned on the Dashboard worksheet.

---

## Chart 2 — Product-Level Revenue

Created a clustered horizontal bar chart comparing July and August revenue for selected Computer and Networking products.

Chart title:

`Product Level Revenue — July vs. August`

Products included:

- Business Laptop
- Desktop Computer
- Wi-Fi Router
- Gaming Laptop
- Network Switch
- Ethernet Adapter
- Mesh Wi-Fi System
- Mini PC
- Wi-Fi Extender
- Workstation

The horizontal bar format was selected because product names are easier to read in a horizontal layout.

The chart was positioned beside the category revenue chart.

---

## Interactive Category Slicer

Created a Category slicer connected to the PivotTable powering the category revenue chart.

The slicer was renamed:

`Category Filter`

Available selections:

- Accessories
- Audio
- Computer
- Networking
- Office

Tested the slicer by selecting Computer and confirming that the associated chart filtered correctly.

Tested multi-selection/all-category behavior and confirmed that the chart returned to the complete category view.

The slicer was positioned on the Dashboard worksheet.

A Month slicer was intentionally not added because the dashboard's primary purpose is to show the July vs. August comparison side-by-side. Filtering to a single month would reduce the usefulness of that comparison.

---

## Business Findings

Added a Business Findings section to the dashboard.

### Finding 1 — Overall Performance

Revenue declined 25.66% from July to August, while transactions declined 40.98% and units sold declined 38.73%.

### Finding 2 — Category Driver

Computer and Networking revenue declined by $13,282.99 combined, accounting for approximately 90.44% of the net revenue decline.

### Finding 3 — Product Driver

Mesh Wi-Fi System had the largest product-level revenue decline, decreasing by $8,496.18 as units sold fell from 25 to 7.

### Finding 4 — Positive Offset

Office was the only category to increase revenue, growing by $2,304.47 from July to August.

---

## Recommended Investigation

Added the following recommendation to the dashboard:

> Investigate the decline in Mesh Wi-Fi System and Computer/Networking performance, including inventory availability, pricing, promotions, product mix, and customer purchasing behavior. Additional data is required to determine the underlying causes.

The recommendation deliberately avoids claiming causation because the available data does not establish why sales changed.

---

## Data Limitations

Added the following limitations:

> The analysis does not include customer IDs, historical inventory snapshots, promotion or campaign data, traffic data, competitor pricing, or product cost/margin information. Therefore, the analysis identifies patterns and investigation priorities but does not establish causation or profitability impact.

These limitations were included to distinguish observed patterns from unsupported conclusions.

---

## Dashboard Formatting

Completed final dashboard formatting including:

- Removed worksheet gridlines from the dashboard view.
- Applied consistent chart borders.
- Improved KPI visual hierarchy.
- Applied conditional formatting to KPI changes.
- Renamed the slicer to `Category Filter`.
- Formatted Business Findings, Recommended Investigation, and Data Limitations sections.
- Applied Wrap Text where required.
- Adjusted row heights so narrative text is fully visible.
- Added a footer:

`Ujjsha Retail Dataset | July–August Analysis | Excel Portfolio Project #1`

---

## One-Page Dashboard Setup

Configured the Dashboard worksheet for a professional one-page printable layout.

Print settings:

- Paper Size: US Letter
- Orientation: Landscape
- Margins: Narrow
- Scale: 1 page wide
- Scale: 1 page tall

Verified the print preview showed:

`Page 1 of 1`

The dashboard can also be exported as a one-page PDF for portfolio presentation.

---

## Business Story

The completed dashboard communicates the following story:

Overall revenue declined 25.66% from July to August, accompanied by substantial declines in transaction volume and units sold.

Despite the decline in overall volume, revenue per transaction increased 25.97% and revenue per unit increased 21.32%, indicating that the average value of transactions increased during August.

The revenue decline was concentrated primarily in Computer and Networking. Together, these categories declined by $13,282.99 and accounted for approximately 90.44% of the net revenue decline.

At the product level, Mesh Wi-Fi System experienced the largest revenue decline, decreasing by $8,496.18 as units sold fell from 25 to 7.

Office was the only category to increase revenue, growing by $2,304.47 and partially offsetting declines elsewhere.

The available data supports identifying these patterns and investigation priorities, but additional information is required to determine the underlying causes.

---

## Analyst Communication Lessons

Day 35 reinforced several important analyst principles:

1. A dashboard should answer a business question rather than simply display charts.
2. KPIs should be calculated from underlying data where possible.
3. Positive and negative changes should be easy to interpret.
4. Charts should be selected based on the analytical question.
5. Slicers can provide useful interactive filtering.
6. Findings should describe observed evidence.
7. Hypotheses should not be presented as established facts.
8. Recommendations should be connected to observed business patterns.
9. Limitations should be explicitly documented.
10. A professional dashboard should prioritize clarity over excessive visual decoration.
11. A portfolio dashboard should communicate the business story without requiring the reviewer to inspect the entire workbook.

---

## Day 35 Competency Sign-Off

### Excel Reporting

- Dashboard construction — Learned
- KPI calculation — Learned
- Percentage change — Learned
- MoM analysis — Learned
- Chart creation — Learned
- Column charts — Learned
- Horizontal bar charts — Learned
- Chart formatting — Learned
- Conditional formatting — Learned
- Slicers — Learned
- PivotTable-connected dashboard interaction — Learned
- Business findings — Learned
- Dashboard storytelling — Learned
- Data limitations — Learned
- One-page print configuration — Learned
- Excel-to-PDF reporting workflow — Introduced

---

## Excel Phase Project Sign-Off

Portfolio Project #1 Excel reporting requirements are complete.

The Excel deliverable now includes:

- Prepared data
- Analytical calculations
- PivotTable analysis
- Power Query preparation
- KPI analysis
- Charts
- Interactive slicer
- Dashboard
- Business findings
- Recommended investigation
- Data limitations
- Professional one-page reporting layout

**Day 35 Status: ✅ Complete**

**Excel Phase Status: ✅ Complete**

---

## Next Step

Next phase:

**Phase 3 — Power BI & Data Visualization**

**Day 36 — Power BI Fundamentals**

Portfolio Project #1 will continue through the Power BI phase before the project is formally completed.