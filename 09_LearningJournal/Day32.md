# Day 32 — Dates, Dynamic Arrays & Advanced Analysis

## Objective

Continue structured Excel Analyst learning by developing practical skills in:

- Date and time analysis
- Dynamic arrays
- Ranking
- Growth analysis
- Variance analysis
- Contribution analysis
- Segmentation
- Trend analysis
- Anomaly identification
- Business interpretation

The focus remained on concepts that are commonly useful in analyst work rather than learning functions simply because they exist.

## Learning Approach

Followed the established learning structure:

**Learn → Example → Solve → Business Scenario → Ujjsha Application → Explain Reasoning**

The goal was to understand not only how to write an Excel formula, but also when and why an analyst would use it.

# Part 1 — Dates & Date Analysis

## YEAR

Used `YEAR()` to extract the year from a date.

Example:

`=YEAR(A2)`

If A2 contains 8/14/2026, the result is 2026.

## MONTH

Used `MONTH()` to extract the month number.

Example:

`=MONTH(A2)`

August returns 8.

## DAY

Used `DAY()` to extract the day of the month.

Example:

`=DAY(A2)`

8/14/2026 returns 14.

## WEEKDAY

Used `WEEKDAY()` to determine the day number within a week.

Example:

`=WEEKDAY(A2)`

Excel's default system is:

- Sunday = 1
- Monday = 2
- Tuesday = 3
- Wednesday = 4
- Thursday = 5
- Friday = 6
- Saturday = 7

Also practiced Monday-first numbering:

`=WEEKDAY(A2,2)`

With this system:

- Monday = 1
- Tuesday = 2
- Wednesday = 3
- Thursday = 4
- Friday = 5
- Saturday = 6
- Sunday = 7

## TEXT — Date Formatting

Used `TEXT()` to convert dates into useful reporting labels.

Weekday name:

`=TEXT(A2,"dddd")`

Example result:

Saturday

Abbreviated weekday:

`=TEXT(A2,"ddd")`

Example result:

Sat

Month name:

`=TEXT(A2,"MMMM")`

Example result:

August

Abbreviated month:

`=TEXT(A2,"MMM")`

Example result:

Aug

Year-month reporting label:

`=TEXT(A2,"yyyy-mm")`

Example result:

2027-03

This is useful when creating monthly reporting fields.

# Date Arithmetic

Calculated the number of days between dates:

`=B2-A2`

Calculated a date a specific number of days forward:

`=A2+30`

Calculated a date a specific number of days backward:

`=A2-7`

## EDATE

Used `EDATE()` to move a date by a specific number of months.

Three months forward:

`=EDATE(A2,3)`

Four months backward:

`=EDATE(A2,-4)`

This is useful for period-based analysis where the goal is to move by calendar months rather than a fixed number of days.

## EOMONTH

Used `EOMONTH()` to determine the end of a month.

Current month:

`=EOMONTH(A2,0)`

Next month:

`=EOMONTH(A2,1)`

Previous month:

`=EOMONTH(A2,-1)`

## WEEKNUM

Used `WEEKNUM()` to determine the week number within a year.

Example:

`=WEEKNUM(A2)`

Also practiced Monday-first week numbering:

`=WEEKNUM(A2,2)`

Important distinction:

- `WEEKDAY()` → day number within the week
- `WEEKNUM()` → week number within the year

Week numbers can extend to 53 depending on the year and numbering system.

# Month-over-Month Analysis

Reinforced the standard month-over-month percentage change calculation:

`=(Current-Previous)/Previous`

Example:

January revenue = $10,000

February revenue = $12,000

Calculation:

`=(12000-10000)/10000`

Result:

20%

Applied the same concept to the Ujjsha Retail Project.

July revenue = $57,237.81

August revenue = $42,551.47

Absolute change:

-$14,686.34

Percentage change:

-25.66%

## YEARFRAC

`YEARFRAC()` was discussed but not studied in depth.

Classification:

**Nice to Know**

Reason:

It can be useful for specialized date calculations, but it is not necessary to prioritize during the current Excel analyst learning phase.

# Part 1 — Dynamic Arrays

Dynamic arrays allow one formula to return multiple results that automatically spill into neighboring cells.

## UNIQUE

Used `UNIQUE()` to return distinct values.

Example:

`=UNIQUE(B2:B7)`

Business use:

Return unique product categories.

## SORT

Used `SORT()` to organize returned values.

Example:

`=SORT(UNIQUE(B2:B7))`

This returns unique categories in alphabetical order.

## SORTBY

Used `SORTBY()` to sort one range based on another range.

Example:

`=SORTBY(A2:A6,B2:B6,-1)`

This sorts products by revenue in descending order.

To return and sort an entire table:

`=SORTBY(A2:C6,C2:C6,-1)`

## FILTER

Used `FILTER()` to return all records meeting a condition.

Example:

`=FILTER(A2:C6,B2:B6="Computer")`

This returns all Computer records.

Numeric condition:

`=FILTER(A2:C6,C2:C6>=10000)`

This returns all records with revenue of at least $10,000.

## FILTER With Multiple Conditions

AND logic:

`=FILTER(A2:C6,(B2:B6="Computer")*(C2:C6>=10000))`

The `*` operator represents AND logic in this array context.

OR logic:

`=FILTER(A2:C6,(B2:B6="Computer")+(B2:B6="Networking"))`

The `+` operator represents OR logic in this array context.

Combined OR + AND:

`=FILTER(A2:C6,((B2:B6="Computer")+(B2:B6="Networking"))*(C2:C6>=10000))`

This returns records where:

- Category is Computer OR Networking
- AND revenue is at least $10,000

## SEQUENCE

Used `SEQUENCE()` to generate a series of numbers.

Example:

`=SEQUENCE(5,1,10,2)`

Result:

10  
12  
14  
16  
18

Date sequence:

`=A2+SEQUENCE(5,1,0,1)`

If A2 is 9/1/2026, this generates:

9/1/2026  
9/2/2026  
9/3/2026  
9/4/2026  
9/5/2026

## Spill Range Operator

Used the `#` operator to reference the entire current spill range generated by a dynamic-array formula.

If D2 contains:

`=SEQUENCE(5)`

Then:

`=D2#`

references the entire spill range generated from D2.

Important understanding:

The `#` operator refers to the entire current spill range, regardless of how many cells the source formula currently spills into.

# Combining Dynamic Array Functions

Practiced combining functions to answer business questions.

Example:

`=UNIQUE(FILTER(B2:B7,C2:C7>=10000))`

This returns unique categories among products with revenue of at least $10,000.

Another example:

`=SORT(UNIQUE(B2:B7))`

This returns distinct categories in sorted order.

# Dynamic Array Function Selection

Reinforced the purpose of the major functions:

- `UNIQUE()` → return distinct values
- `SORT()` → sort a range or array
- `SORTBY()` → sort one range using another range
- `FILTER()` → return records meeting conditions
- `SEQUENCE()` → generate a series
- `#` → reference an entire spill range

# Part 2 — Advanced Analysis

## 1. Ranking

Introduced `RANK.EQ()` for ranking values.

Example:

`=RANK.EQ(B2,$B$2:$B$6,0)`

The `0` specifies descending order, meaning the highest value receives rank 1.

Ascending ranking:

`=RANK.EQ(B2,$B$2:$B$6,1)`

The `1` means the lowest value receives rank 1.

For a dataset containing 100 products:

`=RANK.EQ(B2,$B$2:$B$101,0)`

The absolute references ensure the comparison range remains fixed when the formula is copied down.

Business application:

A product with rank <= 5 can be classified as a Top 5 product.

## 2. Growth Analysis

Reinforced the difference between absolute and percentage change.

Absolute change:

`=Current-Previous`

Example:

`=12000-10000`

Result:

$2,000

Percentage change:

`=(Current-Previous)/Previous`

Example:

`=(12000-10000)/10000`

Result:

20%

Important distinction:

- Absolute change tells us how much the metric changed.
- Percentage change tells us how large the change was relative to the previous period.

## 3. Variance Analysis

Variance compares actual performance against a benchmark such as a budget.

Example:

Budget revenue = $25,000

Actual revenue = $22,000

Absolute variance:

`=22000-25000`

Result:

-$3,000

Variance percentage:

`=(22000-25000)/25000`

Result:

-12%

Interpretation:

Actual revenue was $3,000 below budget, representing a 12% unfavorable variance.

## 4. Contribution Analysis

Contribution analysis measures how much a category, product, or segment contributes to a total.

General formula:

`=Category Revenue/Total Revenue`

Ujjsha example:

Networking revenue = $14,304

Total August revenue = $42,552

Calculation:

`=14304/42552`

Result:

Approximately 33.62%

Therefore, Networking contributed approximately 33.62% of August revenue.

Office example:

`=7694/42552`

Result:

Approximately 18.08%

Therefore, Office contributed approximately 18.08% of August revenue.

## 5. Segmentation

Segmentation groups numerical values into meaningful business categories.

Example rules:

- High = Revenue >= $15,000
- Medium = Revenue >= $8,000 and < $15,000
- Low = Revenue < $8,000

Example Excel formula:

`=IF(B2>=15000,"High",IF(B2>=8000,"Medium","Low"))`

Example:

$12,000 → Medium

Ujjsha business scenario:

| Product  | Revenue | Segment |
| -------- | ------: | ------- |
| Laptop   | $22,000 | High    |
| Monitor  | $12,000 | Medium  |
| Router   |  $7,500 | Low     |
| Keyboard |  $3,000 | Low     |

Key lesson:

Segmentation converts continuous numerical data into meaningful business groups that can be easier to analyze and communicate.

## 6. Trend Analysis

Trend analysis examines how a metric changes over time.

Example:

| Month    | Revenue |
| -------- | ------: |
| January  | $10,000 |
| February | $12,000 |
| March    | $15,000 |
| April    | $13,000 |
| May      | $17,000 |

Interpretation:

The overall trend from January to May is upward because revenue increased from $10,000 to $17,000.

However, revenue declined between March and April, falling from $15,000 to $13,000.

Key lesson:

An overall upward trend can still contain temporary declines.

Analysts should examine both:

- Overall direction
- Period-to-period changes

## 7. Anomaly Identification

An anomaly is an observation that is unusual compared with the normal pattern of the data.

Example:

| Month | Revenue |
| ----- | ------: |
| Jan   | $10,000 |
| Feb   | $11,000 |
| Mar   | $10,500 |
| Apr   | $10,800 |
| May   | $25,000 |
| Jun   | $11,200 |

May would be flagged as a potential anomaly because its revenue is substantially higher than the surrounding months.

Important analyst principle:

**An anomaly should be investigated, not automatically treated as an error.**

Possible explanations could include:

- Large customer/order
- Promotion or campaign
- New product launch
- Seasonal demand
- Data-entry or reporting issue

## 8. Business Interpretation

Applied advanced analysis concepts to the Ujjsha Retail Project.

Previously observed:

- February had the highest revenue.
- March experienced a significant decline.

When investigating an unusually high revenue month, the first step is to examine transaction volume.

Potential investigation areas include:

1. Transaction count
2. Units sold
3. Revenue per transaction
4. Revenue per unit
5. Product mix
6. Data quality

This helps distinguish between:

**What happened?**

and

**Why might it have happened?**

# Integrated Business Interpretation Exercise

Scenario:

Revenue increased by 20%, while transactions decreased by 10%.

Interpretation:

The increase in revenue combined with fewer transactions suggests that **revenue per transaction may have increased**.

The next metric to investigate is:

`=Total Revenue/Total Transactions`

The analyst should then compare revenue per transaction with previous periods.

Key lesson:

A strong analyst does not stop at reporting a metric change. The analyst asks what other metrics can explain the observed result.

# Day 32 Competency Assessment

## Dates & Date Analysis

🟢 Strong Practice

Practiced:

- YEAR
- MONTH
- DAY
- WEEKDAY
- TEXT
- EDATE
- EOMONTH
- WEEKNUM
- Date arithmetic
- Month-over-month analysis

## Dynamic Arrays

🟢 Strong Practice

Practiced:

- UNIQUE
- SORT
- SORTBY
- FILTER
- SEQUENCE
- Spill ranges
- `#` spill-range reference
- Multiple-condition array logic

## Ranking

🟢 Strong Practice

Practiced:

- RANK.EQ
- Descending ranking
- Ascending ranking
- Absolute references
- Top-N identification

## Growth Analysis

🟢 Strong Practice

Practiced:

- Absolute change
- Percentage change
- Month-over-month interpretation

## Variance Analysis

🟢 Strong Practice

Practiced:

- Absolute variance
- Variance percentage
- Actual vs. budget interpretation

## Contribution Analysis

🟢 Strong Practice

Practiced:

- Category contribution
- Percentage of total
- Business interpretation

## Segmentation

🟢 Strong Practice

Practiced:

- Threshold-based segmentation
- Nested IF logic
- High / Medium / Low classification
- Business interpretation

## Trend Analysis

🟢 Strong Practice

Practiced:

- Overall trend identification
- Period-specific reversals
- Trend interpretation

## Anomaly Identification

🟢 Strong Practice

Practiced:

- Identifying unusual observations
- Comparing observations with surrounding patterns
- Distinguishing anomalies from confirmed errors
- Developing investigation questions

## Business Interpretation

🟢 Strong Practice

Practiced moving from:

**Metric → Observation → Interpretation → Investigation**

# Key Lessons

1. Date functions allow analysts to transform raw dates into useful reporting dimensions.
2. `WEEKDAY()` identifies a day within a week, while `WEEKNUM()` identifies a week within a year.
3. `EDATE()` moves dates by calendar months, while simple date arithmetic moves by days.
4. Dynamic arrays allow a single formula to return multiple results automatically.
5. `FILTER()` is useful when multiple records need to be returned.
6. `UNIQUE()` identifies distinct values.
7. `SORT()` and `SORTBY()` organize analytical results.
8. `SEQUENCE()` can generate useful numerical or date series.
9. Ranking helps identify top and bottom performers.
10. Absolute and percentage changes answer different business questions.
11. Variance analysis compares actual performance against a benchmark.
12. Contribution analysis measures the share of a total generated by a category or segment.
13. Segmentation converts numerical values into meaningful business groups.
14. Trend analysis should examine both overall direction and temporary reversals.
15. Anomalies should be investigated before being classified as errors.
16. Business analysis requires moving beyond what happened toward understanding what should be investigated next.

# Reflection

Day 32 expanded Excel from individual formulas into broader analytical thinking.

The focus was not simply on learning functions. Each concept was connected to a business question.

The most important progression was:

**Calculate → Compare → Interpret → Investigate**

This reinforces the goal of using Excel as an analytical tool rather than simply as a spreadsheet.

# Day 32 Outcome

Completed the structured learning for:

- Dates and date analysis
- Dynamic arrays
- Ranking
- Growth analysis
- Variance analysis
- Contribution analysis
- Segmentation
- Trend analysis
- Anomaly identification
- Business interpretation

Day 32 strengthened the ability to use Excel to analyze business performance and translate numerical results into meaningful investigation questions.

**Day 32 is complete.**