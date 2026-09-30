# Day 41 — Time Intelligence & Executive Trends

**Phase:** Phase 3 — Power BI & Data Visualization

**Project:** Portfolio Project #1 — Ujjsha Retail Executive Dashboard

**Status:** ✅ Complete

---

## Objective

Build an Executive Trends page that enables stakeholders to analyze revenue performance over time using professional Time Intelligence measures, Month-over-Month comparisons, and executive storytelling.

---

# Module 1 — Time Intelligence Foundation

Configured the data model for Power BI Time Intelligence.

### Completed

* Marked `DateTable` as the official Date Table.
* Selected `DateTable[Date]` as the calendar column.
* Confirmed the active relationship between `DateTable[Date]` and `SalesTable[sale_date]`.

Business impact:

Power BI can now correctly evaluate built-in Time Intelligence functions such as `PREVIOUSMONTH()`.

---

# Module 2 — Previous Month Revenue

Created the first Time Intelligence measure.

```DAX id="6h4pnq"
Previous Month Revenue =
CALCULATE(
    [Total Revenue],
    PREVIOUSMONTH(DateTable[Date])
)
```

Business purpose:

Answer the question:

> "How much revenue did we generate in the previous month?"

---

# QA Validation

Observed behavior:

* May correctly returns Blank because the dataset begins in May.
* June correctly returns May's revenue.
* Month shifting works correctly.

---

# Module 3 — Month-over-Month Growth ($)

Initial measure:

```DAX id="6vgk98"
MoM Growth ($) =
[Total Revenue] - [Previous Month Revenue]
```

Issue discovered:

The first month displayed May's revenue instead of Blank.

Root cause:

DAX treats `BLANK()` as zero during arithmetic operations.

Final corrected measure:

```DAX id="qwxg0j"
MoM Growth ($) =
IF(
    ISBLANK([Previous Month Revenue]),
    BLANK(),
    [Total Revenue] - [Previous Month Revenue]
)
```

Key lesson:

Explicitly handling `BLANK()` prevents misleading KPIs.

---

# Module 4 — Month-over-Month Growth (%)

Created the percentage growth measure.

```DAX id="w8ut5l"
MoM Growth (%) =
DIVIDE(
    [MoM Growth ($)],
    [Previous Month Revenue]
)
```

Formatting:

* Percentage
* Two decimal places

Validation:

* June: **110.16%**
* May: Blank

---

# Module 5 — Executive Trends Page

Created a new report page:

**Executive Trends**

Final layout includes:

* Executive title
* Monthly Revenue Trend
* Total Revenue KPI
* Previous Month Revenue KPI
* MoM Growth ($)
* MoM Growth (%)
* Executive Insight section

This separates trend analysis from the Executive Summary page and creates a more professional report structure.

---

# Monthly Revenue Trend

Improved the visual by:

* Switching from daily dates to monthly aggregation.
* Using Year + Month.
* Adding markers.
* Adding data labels.

Observed trend:

* May: ~$40K
* June: ~$85K (Peak)
* July: ~$57K
* August: ~$43K

Business interpretation:

Revenue more than doubled from May to June before moderating during subsequent months.

---

# Conditional KPI Formatting

Added rule-based formatting.

Rules:

| Condition                  | Color |
| -------------------------- | ----- |
| Less than 0                | Red   |
| Greater than or equal to 0 | Green |

Result:

Positive Month-over-Month performance is immediately visible.

---

# Executive Insight

Final insight added to the dashboard:

> Revenue increased by **$44.43K (110.16%)** from May to June, indicating the business more than doubled revenue before moderating in subsequent months.

This transforms the page from a technical dashboard into an executive-facing report.

---

# QA Validation

| Test                      | Result |
| ------------------------- | ------ |
| Date Table marked         | ✅      |
| Previous Month Revenue    | ✅      |
| First month returns Blank | ✅      |
| June returns May revenue  | ✅      |
| MoM Growth ($)            | ✅      |
| MoM Growth (%)            | ✅      |
| Conditional formatting    | ✅      |
| Monthly trend chart       | ✅      |

---

# New DAX Functions Learned

| Function      | Purpose                        |
| ------------- | ------------------------------ |
| PREVIOUSMONTH | Previous month's context       |
| IF            | Conditional logic              |
| ISBLANK       | Handle first-period edge cases |

---

# Biggest Lessons

Today's biggest lesson was understanding that Time Intelligence is not just about writing DAX—it depends on building a proper Date Table, validating edge cases, and ensuring KPIs communicate accurate business stories.

Handling `BLANK()` correctly became an important debugging lesson that reflects real-world dashboard development.

---

# Portfolio Badge Earned

🏅 **Executive Storytelling**

Built a Time Intelligence page that combines DAX, trend analysis, QA validation, and business interpretation into an executive-ready report.

---

# Day 41 Status

**Time Intelligence & Executive Trends — ✅ Complete**

---

# Next Step

**Day 42 — Product Performance Dashboard**

Planned topics:

* Product Ranking
* `RANKX()`
* Top Products
* Bottom Products
* Management Recommendations
* Executive Product Insights
