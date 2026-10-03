# Day 44 — Portfolio Project #1 Finalization, Business Storytelling & QA

**Project:** Ujjsha Retail — Portfolio Project #1  
**Tools:** Power BI, DAX, Git/GitHub

---

## Objective

Finalize Portfolio Project #1 by performing a complete report-quality review, validating the business story across all report pages, improving dynamic DAX behavior, testing drill-through functionality, resolving presentation issues, completing final QA, and saving the final Power BI report for the portfolio.

---

## Day 44 Mission

The goal was not to add unnecessary new visuals or continue redesigning the report.

The focus was to make sure the existing Power BI project was:

- Accurate
- Internally consistent
- Interactive
- Business-focused
- Easy to navigate
- Interview-ready
- Portfolio-ready
- Properly saved and version-controlled

---

# 1. Report Structure QA

The final report contains five pages in the following order:

1. Executive Summary
2. Executive Trends
3. Product Performance
4. Revenue Drivers & Business Investigation
5. Product Details

The page order was reviewed to ensure that the report follows a logical business storytelling sequence:

**Overall Performance → Trends → Product Performance → Revenue Investigation → Product Detail**

The report structure was confirmed as complete.

---

# 2. Executive Summary QA

The Executive Summary page was reviewed as the high-level management overview.

## Final KPIs

- Total Revenue: **$224.87K**
- Total Transactions: **200**
- Total Quantity: **742**
- Average Selling Price: **$303.06**
- Average Items / Transaction: **3.71**
- Computer Revenue: **$61.68K**
- Top Category Revenue: **$93.47K**

The transaction count was validated against the dataset. The correct total is **200 transactions**.

The Average Items / Transaction KPI is consistent with the underlying data:

**742 units / 200 transactions = 3.71 items per transaction**

The Average Selling Price KPI is based on total revenue divided by total quantity:

**$224,872.51 / 742 = $303.06**

## Executive Summary Visuals

The page includes:

- Revenue by Product Category
- Revenue Share by Category
- Running Total Revenue by Month

The page title and subtitle were finalized as:

**Executive Summary**

**Ujjsha Retail — Business Performance Overview**

The redundant Company Revenue KPI was removed.

The Revenue Share % KPI showing 100% was also removed because it did not provide useful business insight.

## Executive Insight

> Revenue totaled $224.87K across 200 transactions. Networking generated the highest category revenue at $93.47K, while the business averaged 3.71 items and $303.06 in revenue per unit sold.

The Executive Summary page was reviewed and locked as final.

---

# 3. Executive Trends QA

The Executive Trends page was reviewed to ensure that the time-intelligence analysis works both with and without a month selection.

The original Day 41 measures were improved so that the KPI cards dynamically respond to the selected month.

## Dynamic Current Month Revenue

The report uses a dynamic measure that determines the current month from the active date context.

The behavior was tested under multiple conditions:

- No month selected → August revenue
- June selected → June revenue
- August selected → August revenue

The measure therefore provides a useful default view while remaining interactive when a user selects a specific month.

## Dynamic Previous Month Revenue

The previous-month calculation was also updated to respond dynamically to the selected/current month.

## Dynamic MoM Growth

The Month-over-Month dollar and percentage measures were updated so that the calculations remain meaningful when the user changes the month selection.

## Default KPI Results

With no month selected, the report displays:

- Current Month Revenue: **$42.55K**
- Previous Month Revenue: **$57.24K**
- MoM Growth ($): **-$14.69K**
- MoM Growth (%): **-25.66%**

## Monthly Revenue Trend

The report shows:

- May: **$40.33K**
- June: **$84.75K**
- July: **$57.24K**
- August: **$42.55K**

June represents the highest revenue month.

Revenue subsequently declined in July and August.

## Final Executive Insight

> Revenue peaked at $84.75K in June after increasing 110.16% from May, then declined to $57.24K in July and $42.55K in August. The trend indicates strong mid-period growth followed by moderation in the subsequent two months.

The Executive Trends page was tested with different month selections and locked as final.

---

# 4. Product Performance QA

The Product Performance page was reviewed for ranking accuracy, revenue concentration, and business interpretation.

## Key KPIs

- Top 5 Product Revenue: **$116.08K**
- Top 5 Revenue Share: **51.62%**
- Computer + Networking Revenue Share: **68.98%**

## Top 5 Products

1. Mesh Wifi System — **$34,456.73**
2. Ethernet Adapter — **$24,833.94**
3. Wi-Fi Extender — **$20,782.00**
4. Desktop Computer — **$18,036.72**
5. Workstation — **$17,970.25**

The Top 5 products generated more than half of total revenue.

The five highest-revenue products also came from the Computer and Networking categories.

## Product Concentration

The report shows that:

- Top 5 products generated **51.62%** of total revenue.
- Computer and Networking generated **68.98%** of total revenue.
- Mesh Wifi System ranked #1.
- USB-C Cable ranked at the bottom with **$362.04** in revenue.
- The highest-revenue product generated approximately 95 times the revenue of the lowest-revenue product.

## Final Presentation Updates

The visual titles were refined to:

- **Top 5 Product Revenue**
- **Bottom 5 Product Revenue**

This makes the purpose of the visuals clearer.

The Product Performance page was reviewed and locked as final.

---

# 5. Revenue Drivers & Business Investigation QA

The Revenue Drivers & Business Investigation page was reviewed as the primary diagnostic page for the July-to-August revenue decline.

## Overall Change

August revenue declined by:

**-$14.69K**

compared with July.

## Category Contribution to Net Decline

- Computer: **46.21%**
- Networking: **44.23%**
- Accessories: **17.40%**
- Audio: **7.85%**
- Office: **-15.69%**

Computer and Networking collectively accounted for:

**90.44% of the net revenue decline**

## Category Revenue Changes

- Computer: **-$6.8K**
- Networking: **-$6.5K**
- Accessories: **-$2.6K**
- Audio: **-$1.2K**
- Office: **+$2.3K**

The Office category partially offset declines in the other categories.

## Major Product-Level Declines

The largest product-level declines included:

- Mesh Wi-Fi System: approximately **-$8.5K**
- Desktop Computer: approximately **-$6.9K**
- Wi-Fi Router: approximately **-$1.6K**
- Gaming Laptop: approximately **-$1.1K**
- Network Switch: approximately **-$1.0K**
- Business Laptop: approximately **-$1.0K**

Some products partially offset the decline:

- Wi-Fi Extender: approximately **+$4.2K**
- Workstation: approximately **+$1.4K**
- Mini PC: approximately **+$0.8K**
- Ethernet Adapter: approximately **+$0.5K**

## Final Executive Insight

> August revenue declined by $14.69K compared with July. Computers and Networking accounted for 90.44% of the net decline, with Computers contributing 46.21% and Networking contributing 44.23%. At the product level, the largest declines came from the Mesh Wi-Fi System and Desktop Computer, while growth in products such as Wi-Fi Extender and Workstation partially offset the losses. The available data identifies where revenue declined, but additional information is needed to determine why these products declined.

## Management Investigation

> Management should investigate the decline in the Mesh Wi-Fi System and Desktop Computer, which were the two largest product-level declines within the Computers and Networking categories. Potential factors to investigate include product availability and stockouts, pricing changes, promotions or discounts, changes in customer demand, and competitive pricing. Additional historical data would be required to determine which factors contributed to the observed decline.

The Revenue Drivers page was reviewed and locked as final.

---

# 6. Product Details Drill-Through QA

The Product Details page was tested to ensure that drill-through filters correctly pass the selected product.

An issue was identified where selecting a product initially displayed multiple products on the Product Details page.

The drill-through field was configured to use:

**Allow drill through when: Summarized**

This was changed to:

**Not summarized**

After the change, product-level drill-through worked correctly.

## Tests Performed

### Test 1 — Mesh Wi-Fi System

Selecting Mesh Wi-Fi System opened Product Details and displayed only:

**Mesh Wi-Fi System**

### Test 2 — Ethernet Adapter

Selecting Ethernet Adapter opened Product Details and displayed only:

**Ethernet Adapter**

### Navigation

The Back button was tested and successfully returned the user to the originating report page.

The Product Details drill-through functionality was therefore confirmed as working correctly.

The Product Details page was locked as final.

---

# 7. Final Data and Business Story QA

The complete report was reviewed across all five pages.

The final business story is:

### Executive Summary

Ujjsha Retail generated **$224.87K** across **200 transactions** and **742 units**.

### Executive Trends

Revenue peaked in June at **$84.75K** and declined to **$42.55K** in August.

### Product Performance

The Top 5 products generated **51.62%** of total revenue, while Computer and Networking generated **68.98%**.

### Revenue Drivers

August revenue declined by **$14.69K**, with Computer and Networking responsible for **90.44%** of the net decline.

### Product Investigation

Mesh Wi-Fi System and Desktop Computer were identified as major product-level drivers of the decline.

### Product Details

Users can drill through to an individual product for more detailed analysis.

The pages tell a consistent story without making unsupported causal claims.

---

# 8. Data Limitations

The project does not contain enough information to establish the exact causes of the observed revenue changes.

Important missing data includes:

- Historical inventory levels
- Stockout dates
- Promotion and discount history
- Pricing history
- Customer-level purchase history
- Website/store traffic
- Competitor pricing
- Product cost and margin information

Therefore, the analysis identifies **where performance changed** and recommends areas for investigation rather than claiming definitive causes.

---

# 9. Portfolio Readiness

The final Power BI report was reviewed for:

- Accuracy
- KPI consistency
- Visual clarity
- Business storytelling
- Navigation
- Drill-through functionality
- Dynamic filtering
- Time-intelligence behavior
- Data limitations
- Interview readiness
- Portfolio presentation

Final assessment:

**Portfolio Project #1 is complete and portfolio-ready.**

---

# 10. Final Power BI File

The final Power BI file was saved as:

`Ujjsha_Retail_Dashboard_Final.pbix`

Location:

`05_Portfolio/Ujjsha-Financial-Technologies/Ujjsha-Retail-PowerBI/`

The final dashboard was committed and pushed to GitHub from the Windows laptop.

Final Git commit:

`7cb28d6 — feat: finalize Project 1 Power BI dashboard`

The Windows repository was verified after the push:

- Branch: `main`
- Working tree: clean
- Branch synchronized with `origin/main`

---

# 11. Key Learning Outcomes

Day 44 reinforced several analyst skills:

- Reviewing an entire BI report from a business-user perspective
- Validating KPI calculations against source data
- Improving DAX measures for dynamic report behavior
- Testing filter context across report pages
- Troubleshooting drill-through functionality
- Distinguishing data-driven findings from causal assumptions
- Communicating business findings clearly
- Identifying data limitations
- Performing final QA before publishing a portfolio project
- Using Git to version-control a completed BI artifact

---

# Day 44 Status

**Completed — Portfolio Project #1 finalized and GitHub-ready.**

Next phase:

**Day 45 — Project #1 Final Documentation & Portfolio Packaging**

After Project #1 is fully documented, the next major phase is the **Job Launch Sprint**, including resume, LinkedIn, GitHub portfolio presentation, interview preparation, job tracking, and targeted applications.