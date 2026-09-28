# Day 40 — Advanced DAX & CALCULATE()

**Phase:** Phase 3 — Power BI & Data Visualization

**Project:** Portfolio Project #1 — Ujjsha Retail Analysis

**Status:** ✅ Complete

---

## Objective

Learn advanced DAX by using `CALCULATE()` to modify filter context, build time intelligence with a Date Table, create executive benchmarking measures, and validate each measure through business-oriented QA.

---

# Module 1 — Understanding CALCULATE()

Learned that `CALCULATE()` changes the filter context used to evaluate a measure.

Instead of creating separate calculations from scratch, existing measures can be reused under different conditions.

General syntax:

```DAX
CALCULATE(
    Expression,
    Filter
)
```

Key takeaway:

`CALCULATE()` became the foundation for every advanced measure built today.

---

# Computer Revenue (Fixed Benchmark)

Created a measure that always returns Computer revenue regardless of the slicer.

Final working measure:

```DAX
Computer Revenue =
CALCULATE(
    [Total Revenue],
    SalesTable[category] = "Computer"
)
```

Business behavior:

* All Categories → $61.68K
* Office → $61.68K
* Networking → $61.68K

---

# DAX Debugging Lesson

Initial attempts using `ProductsTable[category]` returned a blank (`--`).

Investigation showed that filtering `SalesTable[category]` matched the actual data model.

Most important lesson:

Understanding which table owns the filter context is just as important as knowing DAX syntax.

---

# Module 2 — Building a Professional Date Table

Created a dedicated calendar table.

```DAX
DateTable =
CALENDAR(
    MIN(SalesTable[sale_date]),
    MAX(SalesTable[sale_date])
)
```

Added calculated columns:

* Year
* Month
* Month Number

Sorted:

`Month` by `Month Number`

Created an active relationship:

DateTable[Date] → SalesTable[sale_date]

Result:

The model now follows a much more professional star-schema structure.

---

# Module 3 — Running Total Revenue

Created the first Time Intelligence measure.

```DAX
Running Total Revenue =
CALCULATE(
    [Total Revenue],
    FILTER(
        ALL(DateTable[Date]),
        DateTable[Date] <= MAX(DateTable[Date])
    )
)
```

Validation:

* Running total continually increased.
* Final value matched Total Revenue.

Final value:

`$224.87K`

Business use:

Executives can now view cumulative revenue growth over time.

---

# Module 4 — Top Revenue Category

Created an executive benchmarking measure.

Initial version:

```DAX
MAXX(
    VALUES(SalesTable[category]),
    CALCULATE([Total Revenue])
)
```

Problem discovered:

The measure changed when the slicer changed.

Root cause:

`VALUES()` respects current filter context.

Final corrected measure:

```DAX
Top Category Revenue =
MAXX(
    ALL(SalesTable[category]),
    CALCULATE([Total Revenue])
)
```

Validation:

Always returns:

`$93.47K`

Current top category:

`Networking`

---

# Module 5 — Company Revenue

Created a company-wide benchmark.

```DAX
Company Revenue =
CALCULATE(
    [Total Revenue],
    ALL(SalesTable[category])
)
```

Behavior:

Remains constant regardless of category selection.

Value:

`$224.87K`

---

# Module 6 — Revenue Share

Created an executive KPI.

```DAX
Revenue Share % =
DIVIDE(
    [Total Revenue],
    [Company Revenue]
)
```

Example:

Office

* Revenue: $19.22K
* Revenue Share: 8.55%

Business interpretation:

This measure explains each category's contribution to total company revenue.

---

# Executive QA Testing

Validated every measure using multiple slicer selections.

| Measure              | Result  |
| -------------------- | ------- |
| Total Revenue        | Dynamic |
| Computer Revenue     | Fixed   |
| Company Revenue      | Fixed   |
| Top Category Revenue | Fixed   |
| Revenue Share        | Dynamic |
| Running Total        | Correct |

Most important QA lesson:

Every new measure should be tested under multiple filter conditions before considering it complete.

---

# New DAX Functions Learned

| Function  | Purpose                            |
| --------- | ---------------------------------- |
| CALCULATE | Modify filter context              |
| FILTER    | Build custom filter logic          |
| ALL       | Ignore filters                     |
| MAXX      | Evaluate an expression across rows |
| VALUES    | Return unique values               |
| CALENDAR  | Build a Date Table                 |
| YEAR      | Extract year                       |
| MONTH     | Extract month number               |
| FORMAT    | Format month names                 |

---

# Biggest Lessons

Today's work introduced enterprise-style DAX development.

Instead of simply creating calculations, measures were designed to intentionally behave differently under different filter contexts.

The most valuable lesson came from debugging real DAX behavior rather than memorizing formulas.

---

# Day 40 Status

**Advanced DAX & CALCULATE() — ✅ Complete**

---

# Next Step

**Day 41 — Time Intelligence & Business Trend Analysis**

Planned topics:

* Month-over-Month Growth
* Previous Month Revenue
* Growth %
* Dynamic Trend KPIs
* Executive Trend Reporting
