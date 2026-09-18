# DA-90 — Day 33: PivotTable & PivotChart Mastery

**Date:** September 17, 2026  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Focus:** PivotTable & PivotChart Mastery  
**Status:** Complete

---

## 1. Day Objective

The objective of Day 33 was to strengthen PivotTable and PivotChart skills used by Junior Data Analysts for business reporting and interactive analysis.

The session focused on:

- PivotTable structure
- Aggregation and data grain
- Multiple value fields
- Difference From and % Difference From
- % of Grand Total
- Top N filtering
- Sorting
- Date grouping
- Slicers
- Timelines
- PivotCharts
- Refreshing PivotTables
- Validation and reconciliation
- Business interpretation
- Selecting visualizations based on business questions

---

## 2. PivotTable Mental Model

Reviewed the four primary PivotTable areas:

- Rows = grouping
- Columns = comparison across categories or periods
- Values = calculations and metrics
- Filters = subset of the data

Example business question:

"Compare revenue by category between July and August."

Recommended setup:

- Rows → Category
- Columns → Month
- Values → Sum of Revenue

---

## 3. Aggregation and Data Grain

Reviewed the difference between:

- Sum
- Average
- Count
- Distinct Count

Important concept:

A transaction/order can contain multiple line items.

Example:

Transaction 1001:
- Laptop
- Mouse

Transaction 1002:
- Monitor
- Keyboard

There are 4 line items but only 2 transactions.

Therefore:

- Counting rows = line-item count
- Counting unique transaction IDs = transaction count

This is an important data-grain consideration when building business reports.

---

## 4. Multiple Value Fields

A PivotTable can contain multiple metrics in the Values area.

Example management report:

- Sum of Revenue
- Count/Distinct Count of Transaction ID
- Average Revenue

These metrics belong in the Values area rather than being placed manually into Columns.

---

## 5. Difference From

Reviewed how to calculate absolute change between periods directly inside a PivotTable.

Example:

- Values → Sum of Revenue
- Show Values As → Difference From
- Base Field → Month
- Base Item → July

This produces the dollar change from July to August.

Example findings:

- Computer → approximately -$6,787
- Networking → approximately -$6,496
- Office → +$2,304

---

## 6. % Difference From

Reviewed percentage change between periods.

Example:

- Show Values As → % Difference From
- Base Field → Month
- Base Item → July

This answers questions such as:

"By what percentage did revenue increase or decrease from July to August?"

Example:

Computer revenue declined approximately 34.46% from July to August.

---

## 7. % of Grand Total

Reviewed how to show each category's contribution to total revenue.

Example:

- Values → Sum of Revenue
- Show Values As → % of Grand Total

August revenue contribution:

- Accessories → approximately 1.65%
- Audio → approximately 16.32%
- Computer → approximately 30.33%
- Networking → approximately 33.62%
- Office → approximately 18.08%

Important distinction:

- Sum of Revenue = actual dollar amount
- % of Grand Total = contribution to the overall total

---

## 8. Top N Filtering

Reviewed how to create a dynamic Top 5 report.

Technique:

PivotTable → Value Filters → Top 10 → change to Top 5

This is preferable to manually selecting the current top five products because the filter can recalculate after the source data is refreshed.

---

## 9. Sorting

Reviewed sorting PivotTable results by the calculated metric.

Example:

Sort products by Sum of Revenue → Largest to Smallest.

The sorting should be performed on the PivotTable analysis rather than manually sorting the underlying source data for reporting purposes.

---

## 10. Date Grouping

Reviewed how to analyze individual transaction dates by month.

Technique:

Date field → Group → Months

This allows a PivotTable to summarize revenue by month without requiring a separate Month column in the source data.

---

## 11. Slicers

Reviewed Slicers as interactive categorical filters.

Examples:

- Category
- Product
- Region
- Supplier

A Category Slicer allows management to click a category and dynamically filter connected PivotTables and PivotCharts.

---

## 12. Timelines

Reviewed Timelines as interactive date filters.

Key distinction:

- Slicer → categorical filtering
- Timeline → date filtering

A Timeline can allow users to interactively filter a report by months, quarters, years, or date ranges.

---

## 13. Connecting Multiple PivotTables

Reviewed how a single Slicer can control multiple PivotTables/PivotCharts.

Technique:

Slicer → Report Connections / PivotTable Connections

This is useful for management dashboards where multiple visualizations need to respond to the same filter.

---

## 14. PivotChart Selection

Reviewed selecting charts based on the business question.

### Bar/Column Chart

Use for:

- Category comparisons
- Product comparisons
- Rankings
- Top N analysis

Example:

Compare August revenue across Accessories, Audio, Computer, Networking, and Office.

### Line Chart

Use for:

- Monthly trends
- Time-series analysis
- Ordered progression

Example:

Analyze monthly revenue from January through August.

### Scatter Chart

Use for:

- Relationships between two numerical variables
- Potential correlation analysis

Example:

Units sold vs. revenue.

### Pie Chart

Can be used for simple part-to-whole comparisons when there are only a small number of categories.

---

## 15. Business Interpretation

Practiced moving beyond simply reading numbers from a chart.

Example interpretation:

"Networking generated the highest August revenue, while Accessories generated the lowest. The substantial gap between the highest- and lowest-performing categories indicates that revenue is concentrated more heavily in certain categories."

Important principle:

Observation → Pattern → Business implication

Avoid assuming causation without supporting evidence.

---

## 16. PivotTable Validation

Reviewed the importance of validating PivotTable results before reporting them.

Validation checklist:

- Confirm the source table/range contains all expected records.
- Confirm the PivotTable has been refreshed.
- Reconcile PivotTable totals against an independent source-data calculation.
- Check filters and slicers for unintended restrictions.
- Check formulas and calculated fields.
- Investigate discrepancies rather than assuming one number is correct.

Example:

If the PivotTable shows $42,551 but an independent source-data calculation shows $44,200, the discrepancy must be investigated before the report is delivered.

Key principle:

**Reconcile first → identify the cause → correct the analysis → report the result.**

---

## 17. Practical Learning Reflection

Day 33 exposed and reinforced the major PivotTable and PivotChart concepts required for Excel-based business reporting.

The session also highlighted an important improvement to the DA-90 learning approach.

The purpose of DA-90 is to develop practical Junior Data Analyst capability, not simply theoretical knowledge.

Going forward, technical learning will follow this structure:

**Learn briefly → Work directly in the workbook → Troubleshoot → Interpret results → Apply business reasoning → Document**

Theory and quizzes will be used as supporting tools, but hands-on work will be the primary method of learning whenever an actual workbook or project is available.

---

## 18. Day 33 Key Takeaways

1. PivotTables allow flexible multidimensional analysis.
2. Data grain matters when counting transactions.
3. Multiple metrics can be placed in the Values area.
4. Difference From provides absolute period-over-period change.
5. % Difference From provides percentage change.
6. % of Grand Total shows contribution to the overall total.
7. Top N Value Filters create repeatable rankings.
8. Date grouping makes time-based analysis easier.
9. Slicers provide interactive categorical filtering.
10. Timelines provide interactive date filtering.
11. Report Connections allow one Slicer to control multiple PivotTables.
12. Bar/Column charts are appropriate for category comparisons.
13. Line charts are appropriate for time trends.
14. Scatter charts are appropriate for numerical relationships.
15. PivotTables must be refreshed and validated before reporting.
16. Business analysis requires interpretation rather than simply displaying numbers.

---

## 19. Day 33 Competency

**PivotTable:** 🟢 Strong  
**PivotTable calculations:** 🟢 Strong  
**Top N / sorting:** 🟢 Strong  
**Date grouping:** 🟢 Strong  
**Slicers / Timelines:** 🟢 Strong  
**PivotCharts:** 🟢 Strong  
**Business interpretation:** 🟢 Strong  
**Validation / reconciliation:** 🟢 Strong

### Overall Day 33 Status: COMPLETE