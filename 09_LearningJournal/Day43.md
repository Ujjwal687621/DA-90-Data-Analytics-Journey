# Day 43 — Revenue Drivers & Business Investigation
 
**Project:** DA-90 — Data Analytics Journey  
**Tool:** Power BI  
**Portfolio Project:** Ujjsha Retail — Project #1

---

## Objective

Build a Revenue Drivers and Business Investigation page in Power BI to determine:

- Where the July-to-August revenue decline occurred
- Which categories contributed most to the decline
- Which products were the largest drivers of the decline
- Which products partially offset the decline
- What management should investigate
- What additional data would be required to determine the underlying causes

---

## Business Question

> What product and category factors drove the July-to-August revenue decline, and what should management investigate?

---

## Data Validation

Before beginning the analysis, the available SalesTable fields were reviewed.

The current SalesTable contains:

- sale_id
- product_id
- sale_date
- quantity
- product_name
- category
- unit_price
- revenue

The dataset does not contain customer-level identifiers, so customer analytics were not included in this analysis.

The Day 43 analysis was adapted from the originally planned customer analysis to focus on revenue drivers and business investigation using the available sales and product data.

---

## Revenue Drivers Page

Created a new Power BI report page:

**Revenue Drivers & Business Investigation**

Subtitle:

> Understanding where revenue changed and which products drove the July–August decline

The page was designed to focus specifically on explaining the July-to-August revenue movement rather than duplicating the category revenue-share analysis already presented on the Executive Summary page.

---

## Overall Revenue Change

The overall August revenue change compared with July was:

**-$14.69K**

This KPI was displayed using the existing MoM Growth ($) measure with the report context filtered to August.

The overall change establishes the business problem that the remainder of the page investigates.

---

## Category Revenue — July vs. August

Created a clustered chart comparing July and August revenue by category.

The visual shows the revenue movement across:

- Accessories
- Audio
- Computer
- Networking
- Office

The visual provides the first level of investigation by showing where revenue declined and where revenue increased.

---

## Category Revenue Change

Created the following DAX measure:

Category Revenue Change ($) =
VAR AugustRevenue =
    CALCULATE(
        [Total Revenue],
        DateTable[Month] = "August"
    )
VAR JulyRevenue =
    CALCULATE(
        [Total Revenue],
        DateTable[Month] = "July"
    )
RETURN
    AugustRevenue - JulyRevenue

The measure calculates:

**August category revenue − July category revenue**

Because category remains in the visual filter context, the calculation returns the July-to-August revenue change for each category.

Category revenue changes:

- Computer: approximately -$6.8K
- Networking: approximately -$6.5K
- Accessories: approximately -$2.6K
- Audio: approximately -$1.2K
- Office: approximately +$2.3K

The Office category increased revenue and therefore partially offset declines in the other categories.

---

## Contribution to August Revenue Change

Created the following DAX measure:

Category Contribution to Revenue Change % =
DIVIDE(
    [Category Revenue Change ($)],
    CALCULATE(
        [Category Revenue Change ($)],
        REMOVEFILTERS(SalesTable[category])
    )
)

This measure calculates each category's contribution relative to the overall July-to-August revenue change.

Results:

- Computer: 46.21%
- Networking: 44.23%
- Accessories: 17.40%
- Audio: 7.85%
- Office: -15.69%

The negative contribution for Office indicates that its revenue growth partially offset the overall decline.

The contribution percentages do not sum to 100% because Office moved in the opposite direction from the categories that declined.

---

## Major Category Finding

Computer and Networking together accounted for:

**90.44% of the net August revenue decline**

Calculation:

46.21% + 44.23% = 90.44%

This confirms that the majority of the overall revenue decline was concentrated in these two categories.

This result also cross-validates the earlier Excel analysis of the same July-to-August period.

---

## Product-Level Investigation

The next level of analysis focused on the products within the Computer and Networking categories.

Created a product-level visual using:

- product_name
- Revenue Change ($)

The category context was filtered to:

- Computer
- Networking

The visual identifies which individual products experienced the largest changes.

Largest product declines:

- Mesh Wi-Fi System: approximately -$8.5K
- Desktop Computer: approximately -$6.9K
- Wi-Fi Router: approximately -$1.6K
- Gaming Laptop: approximately -$1.1K
- Network Switch: approximately -$1.0K
- Business Laptop: approximately -$1.0K

Products showing growth:

- Wi-Fi Extender: approximately +$4.2K
- Workstation: approximately +$1.4K
- Mini PC: approximately +$0.8K
- Ethernet Adapter: approximately +$0.5K

---

## Product-Level Finding

The largest product-level declines within the Computer and Networking categories were:

1. Mesh Wi-Fi System
2. Desktop Computer

These two products experienced substantially larger declines than the other products shown in the analysis.

At the same time, products such as Wi-Fi Extender and Workstation increased revenue and partially offset the losses.

The product analysis identifies the specific products that management should investigate further without claiming that the current dataset establishes the cause of their decline.

---

## Executive Insight

> August revenue declined by $14.69K compared with July. Computers and Networking accounted for 90.44% of the net decline, with Computers contributing 46.21% and Networking contributing 44.23%. At the product level, the largest declines came from the Mesh Wi-Fi System and Desktop Computer, while growth in products such as Wi-Fi Extender and Workstation partially offset the losses. The available data identifies where revenue declined, but additional information is needed to determine why these products declined.

---

## Management Investigation

> Management should investigate the decline in the Mesh Wi-Fi System and Desktop Computer, which were the two largest product-level declines within the Computers and Networking categories. Potential factors to investigate include product availability and stockouts, pricing changes, promotions or discounts, changes in customer demand, and competitive pricing. Additional historical data would be required to determine which factors contributed to the observed decline.

---

## Data Limitations

The current dataset identifies revenue patterns and changes but does not contain enough information to determine the underlying causes.

Additional data needed for further investigation includes:

- Historical inventory levels
- Stockout dates
- Historical pricing
- Discount history
- Promotion and campaign history
- Customer-level purchase history
- Competitor pricing
- Website or store traffic
- Product cost
- Product margin

The analysis therefore identifies **where revenue changed**, but does not establish **why the change occurred**.

---

## DAX and Analytical Concepts Practiced

Used CALCULATE() to evaluate revenue under specific month and filter contexts.

Used VAR to separately calculate August and July revenue before calculating the difference.

Used REMOVEFILTERS() to remove the category filter when calculating each category's contribution to the overall revenue change.

Used DIVIDE() for contribution calculations.

Practiced understanding how category and date filters interact with DAX measures.

Practiced filter-context removal to compare individual category changes against the total business-level change.

---

## DAX Troubleshooting

The first version of the category revenue change calculation used DATEADD() to move the current date context back one month.

The resulting visual did not return the expected July-to-August category changes.

The measure was revised to explicitly calculate August revenue and July revenue using the existing DateTable month field.

The revised measure produced the expected category-level changes.

A similar filter-context issue occurred when calculating category contribution. The denominator needed the category filter removed so that each category could be compared against the total July-to-August change.

The final contribution measure used REMOVEFILTERS(SalesTable[category]) to remove the category filter from the denominator.

---

## Final Revenue Drivers Page

The completed page contains:

- Page title: Revenue Drivers & Business Investigation
- Page subtitle describing the July-to-August investigation
- August Revenue Change KPI
- Category Revenue — July vs. August
- Category Revenue Change — July to August
- Contribution to August Revenue Change
- Product Revenue Change — Computers & Networking
- Executive Insight
- Management Investigation
- Data Limitations

The previously created Revenue Share by Category visual was intentionally excluded from the final page because the Executive Summary already contains a category revenue-share visualization.

This kept the page focused on the specific analytical question of explaining the July-to-August revenue decline.

---

## Final QA

The following checks passed:

- Overall August revenue change: -$14.69K
- Computer contribution: 46.21%
- Networking contribution: 44.23%
- Computer + Networking contribution: 90.44%
- Accessories contribution: 17.40%
- Audio contribution: 7.85%
- Office contribution: -15.69%
- Category revenue change values display correctly
- Product-level revenue change visual displays all relevant Computer and Networking products
- Executive Insight is visible
- Management Investigation is visible
- Data Limitations is visible
- No redundant category revenue-share visual included
- Final page layout reviewed and finalized

---

## Key Learning

The main lesson from Day 43 was that business analysis should move beyond identifying a change and investigate the drivers behind it.

The analysis progressed through:

**Overall Revenue Change → Category Change → Contribution to Change → Product-Level Drivers → Business Investigation → Additional Data Requirements**

The analysis also reinforced an important analyst principle:

> **Observed patterns should be separated from explanations that require additional evidence.**

The available data can show that revenue declined and identify where the decline occurred, but additional operational, pricing, customer, inventory, and competitive data would be required to determine the underlying cause.

---

## Portfolio Badge

🏅 **Revenue Driver & Business Investigation**

---

## Status

**Day 43: ✅ Complete**

**Next: Day 44 — Portfolio Project #1 Finalization / Business Storytelling & QA**