# Portfolio Project #1 — Final QA & Portfolio Readiness

**Project:** Ujjsha Retail  
**Tool:** Power BI  
**Status:** Final  

---

## Purpose

This document records the final quality-assurance review completed before publishing Portfolio Project #1.

The review focused on report accuracy, business storytelling, interactivity, navigation, drill-through behavior, dynamic DAX calculations, and portfolio readiness.

---

## Report Structure

The final report contains five pages:

1. Executive Summary
2. Executive Trends
3. Product Performance
4. Revenue Drivers & Business Investigation
5. Product Details

The page sequence follows the intended analytical story:

**Overall Performance → Trends → Product Performance → Revenue Investigation → Product Detail**

---

## Executive Summary QA

### Final KPIs

| KPI                         | Final Value |
| --------------------------- | ----------: |
| Total Revenue               |    $224.87K |
| Total Transactions          |         200 |
| Total Quantity              |         742 |
| Average Selling Price       |     $303.06 |
| Average Items / Transaction |        3.71 |
| Computer Revenue            |     $61.68K |
| Top Category Revenue        |     $93.47K |

The transaction count was validated as 200.

The Average Items / Transaction KPI is consistent with the underlying data:

742 / 200 = 3.71

The Average Selling Price KPI is consistent with total revenue divided by total quantity:

$224,872.51 / 742 = $303.06

Redundant KPIs were removed where they did not provide useful management insight.

---

## Executive Trends QA

The Executive Trends page was updated so that the KPI cards dynamically respond to month selection.

### Default View

When no month is selected:

- Current Month Revenue: $42.55K
- Previous Month Revenue: $57.24K
- MoM Growth ($): -$14.69K
- MoM Growth (%): -25.66%

### Month Selection Testing

The dynamic calculations were tested using June and August selections.

The calculations correctly changed based on the selected month.

### Revenue Trend

| Month  | Revenue |
| ------ | ------: |
| May    | $40.33K |
| June   | $84.75K |
| July   | $57.24K |
| August | $42.55K |

The page communicates the June peak followed by revenue moderation in July and August.

---

## Product Performance QA

### Key Results

- Top 5 Product Revenue: $116.08K
- Top 5 Revenue Share: 51.62%
- Computer + Networking Revenue Share: 68.98%

### Top 5 Products

1. Mesh Wifi System — $34,456.73
2. Ethernet Adapter — $24,833.94
3. Wi-Fi Extender — $20,782.00
4. Desktop Computer — $18,036.72
5. Workstation — $17,970.25

The chart titles were refined to:

- Top 5 Product Revenue
- Bottom 5 Product Revenue

The page was confirmed to communicate revenue concentration clearly.

---

## Revenue Drivers QA

### August vs. July

August revenue declined by:

**-$14.69K**

Computer and Networking accounted for:

**90.44% of the net revenue decline**

### Major Product-Level Declines

- Mesh Wi-Fi System: approximately -$8.5K
- Desktop Computer: approximately -$6.9K
- Wi-Fi Router: approximately -$1.6K

### Offsetting Growth

- Wi-Fi Extender: approximately +$4.2K
- Workstation: approximately +$1.4K
- Mini PC: approximately +$0.8K
- Ethernet Adapter: approximately +$0.5K

The page correctly distinguishes observed patterns from causal explanations.

---

## Drill-Through QA

An issue was identified where product drill-through initially displayed multiple products.

### Root Cause

The drill-through field was configured as:

**Allow drill through when: Summarized**

### Resolution

The field was changed to:

**Not summarized**

### Validation

The following tests passed:

- Mesh Wi-Fi System → Product Details → Mesh Wi-Fi System only
- Ethernet Adapter → Product Details → Ethernet Adapter only
- Back button → returns to originating page

Drill-through functionality is confirmed as working correctly.

---

## Business Story QA

The final report communicates the following story:

1. Ujjsha Retail generated $224.87K in revenue.
2. Networking was the highest-revenue category at $93.47K.
3. Revenue peaked in June at $84.75K.
4. Revenue declined to $42.55K in August.
5. The Top 5 products generated 51.62% of total revenue.
6. Computer and Networking represented 68.98% of total revenue.
7. Computer and Networking accounted for 90.44% of the August net revenue decline.
8. Mesh Wi-Fi System and Desktop Computer were major product-level contributors to the decline.
9. Additional data is required to determine the underlying causes.

The report avoids presenting hypotheses as confirmed causes.

---

## Data Limitations

The analysis does not include:

- Historical inventory levels
- Stockout dates
- Promotion history
- Discount history
- Pricing history
- Customer-level purchase history
- Traffic data
- Competitor pricing
- Product cost
- Gross margin

These limitations prevent definitive causal conclusions.

---

## Final QA Checklist

- [x] Report pages reviewed
- [x] Page order confirmed
- [x] KPI calculations validated
- [x] Transaction count validated
- [x] Revenue trend validated
- [x] Product ranking validated
- [x] Revenue concentration validated
- [x] Revenue driver analysis reviewed
- [x] Dynamic month behavior tested
- [x] Drill-through tested
- [x] Back navigation tested
- [x] Business insights reviewed
- [x] Data limitations documented
- [x] Final PBIX saved
- [x] Final PBIX committed to Git
- [x] Final PBIX pushed to GitHub
- [x] Windows Git working tree confirmed clean

---

## Final Assessment

**Portfolio Project #1 — FINAL**

The Power BI report is complete, internally consistent, interactive, business-focused, and ready to be presented as a Data Analyst portfolio project.