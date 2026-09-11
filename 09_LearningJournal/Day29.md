# Day 29 — Lookup Fundamentals

**Project:** DA-90 Data Analytics Journey  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Focus:** Lookup & Reference Fundamentals  
**Date:** September 10, 2026

---

## Objective

Begin systematic Excel lookup training after recognizing that many Excel concepts used during Portfolio Project #1 were learned through project exposure rather than structured instruction.

The goal for Day 29 was to build a strong foundation in Excel lookup functions, understand when different lookup methods should be used, and practice selecting the appropriate function based on a business requirement.

---

## Learning Approach

Day 29 followed the DA-90 learning method:

1. Learn
2. Review an example
3. Solve independently
4. Apply the concept to a business scenario
5. Explain the reasoning

The emphasis was on understanding why a function should be used, not simply memorizing its syntax.

---

## Concepts Covered

### 1. XLOOKUP

Learned the basic XLOOKUP structure:

`=XLOOKUP(lookup_value,lookup_array,return_array,[if_not_found],[match_mode],[search_mode])`

Key concepts covered:

- Lookup value
- Lookup array
- Return array
- `if_not_found`
- Exact match behavior
- Approximate matching
- Search direction
- Left-side lookups
- Returning values from independent lookup and return ranges
- Handling duplicate matches
- First-to-last search
- Last-to-first search

Important distinction:

**Match mode** determines what type of match Excel should perform.

**Search mode** determines the direction in which Excel searches.

XLOOKUP returns the first matching result by default when duplicate matches exist.

Using `search_mode = -1` changes the search direction to last-to-first.

---

## 2. VLOOKUP

Learned the basic structure and limitations of VLOOKUP.

Key concepts:

- Lookup value
- Table array
- Column index number
- Exact match using `FALSE`
- Approximate match using `TRUE`
- Lookup column must be the first column of the selected table
- VLOOKUP can return values to the right of the lookup column
- VLOOKUP cannot directly perform a left-side lookup

Also discussed why XLOOKUP is generally more flexible for new workbooks.

---

## 3. HLOOKUP

Learned that HLOOKUP performs a horizontal lookup rather than a vertical lookup.

Key concept:

- HLOOKUP searches across the first row and returns a value from a specified row.

---

## 4. LOOKUP

Learned that LOOKUP is an older lookup function commonly associated with approximate matching.

Key concept:

- LOOKUP can return the largest value that is less than or equal to the lookup value.

This makes it useful for threshold-based scenarios but less flexible than modern lookup approaches.

---

## 5. Lookup Decision-Making

Practiced choosing lookup functions based on the business requirement.

Examples:

- Modern, flexible lookup → XLOOKUP
- Legacy workbook → VLOOKUP
- Horizontal lookup → HLOOKUP
- Find a position → MATCH
- Find a position with additional search options → XMATCH

The goal was to understand that choosing a lookup function depends on the problem being solved rather than simply using the function learned most recently.

---

## 6. Approximate Lookup

Practiced threshold-based lookups using XLOOKUP.

Example:

`=XLOOKUP(7500,A2:A5,B2:B5,"Not Found",-1)`

This uses match mode `-1` to find an exact match or the next smaller value.

Important lesson:

Approximate lookup should be used intentionally because the matching behavior differs from an exact lookup.

---

## 7. Duplicate Matches and Search Direction

Practiced understanding how XLOOKUP behaves when multiple records satisfy the lookup condition.

Default behavior:

`search_mode = 1`

This searches from the first row toward the last row.

Using:

`search_mode = -1`

searches from the last row toward the first row.

Example:

If two rows match the same lookup criteria, the default XLOOKUP returns the first matching row.

---

## 8. Multi-Criteria Lookups

Introduced lookup scenarios involving more than one condition.

Example business question:

> What was the revenue for Monitor in August?

Conditions:

- Product = Monitor
- Month = August

A multi-criteria XLOOKUP can combine conditions using multiplication:

`=XLOOKUP(1,(A2:A7="Monitor")*(B2:B7="August"),C2:C7,"Not Found")`

The `*` operator acts as an AND condition in this array-based approach.

---

## 9. FILTER Introduction

FILTER was introduced because XLOOKUP is designed to return a single matching result, while business analysis often requires returning every record that satisfies a condition.

Example:

`=FILTER(A2:C6,(A2:A6="Monitor")*(C2:C6>9500),"Not Found")`

This returns all records where:

- Product = Monitor
- Revenue > $9,500

Multiple conditions can be combined using `*`.

Example pattern:

`=FILTER(data,(condition1)*(condition2)*(condition3),"Not Found")`

FILTER was introduced as the next step toward dynamic-array analysis and will be developed further during the upcoming Dynamic Arrays section.

---

## Practical Exercises Completed

During the session, I independently solved:

- Basic XLOOKUP
- XLOOKUP with `if_not_found`
- Left-side lookup using XLOOKUP
- Approximate XLOOKUP
- Latest-match lookup using `search_mode = -1`
- Lookup function selection scenarios
- INDEX/MATCH-based lookup examples
- Two-way lookup examples
- Multi-criteria XLOOKUP
- FILTER with multiple conditions
- FILTER using AND logic

I also explained why XLOOKUP returns the first duplicate match by default and how search direction changes that behavior.

---

## Key Lessons

### Match Mode vs. Search Mode

These should not be confused.

**Match Mode:**
Determines what constitutes a match.

**Search Mode:**
Determines where Excel begins searching.

---

### XLOOKUP vs. FILTER

**XLOOKUP:**

> Find a matching value.

**FILTER:**

> Return all records that satisfy specified conditions.

This distinction is important when working with real datasets because analysts may need either a single lookup result or an entire subset of records.

---

### AND Logic in Array Formulas

When using array-based conditions:

`*` represents AND logic.

For example:

`(Product="Monitor")*(Month="August")`

requires both conditions to be TRUE.

---

## Competency Assessment

Day 29 concepts were practiced interactively and successfully applied to business-style examples.

However, the DA-90 competency standard remains:

**Exposure ≠ Practice ≠ Independent Mastery**

Therefore, the lookup concepts covered today should not automatically be classified as fully mastered simply because I was able to solve individual exercises.

Current assessment:

| Skill Area                     | Status            |
| ------------------------------ | ----------------- |
| XLOOKUP fundamentals           | 🟡 Practice Needed |
| VLOOKUP                        | 🟡 Practice Needed |
| HLOOKUP                        | 🟡 Practice Needed |
| LOOKUP                         | 🟡 Practice Needed |
| Exact vs. approximate matching | 🟡 Practice Needed |
| Search mode                    | 🟡 Practice Needed |
| Duplicate-match behavior       | 🟡 Practice Needed |
| Multi-criteria lookup          | 🟡 Practice Needed |
| FILTER introduction            | 🟡 Practice Needed |

Additional practice and independent application will be required before these skills are considered fully learned.

---

## Reflection

Day 29 demonstrated that Lookup & Reference is a much broader Excel competency than initially expected.

Rather than compressing all lookup-related concepts into one learning day, the Excel phase was adjusted so that the concepts can be learned properly without sacrificing understanding for speed.

The revised structure separates the material into:

**Day 29 — Lookup Fundamentals**

**Day 30 — Advanced Lookup & Reference**

**Day 31 — Dynamic Arrays & Data Extraction**

This keeps the official DA-90 day count moving forward while giving each topic an appropriate amount of time.

---

## Outcome

Completed the foundational lookup portion of the Excel learning phase.

I now understand the purpose and basic behavior of several Excel lookup functions and can select an appropriate lookup approach based on the business requirement.

The most important takeaway is that Excel functions should be selected based on the analytical problem being solved rather than memorized independently.

---

## Next

**Day 30 — Advanced Lookup & Reference**

Planned focus:

- INDEX
- MATCH
- XMATCH
- INDEX + MATCH
- Left-side lookups
- Two-way lookups
- Search direction
- Multi-criteria lookups
- Additional lookup/reference practice

The goal will be deeper understanding and independent problem-solving rather than simply increasing the number of functions covered.