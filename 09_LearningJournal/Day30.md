# Day 30 — Advanced Lookup & Reference

**Project:** DA-90 Data Analytics Journey  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Focus:** Advanced Lookup & Reference  
**Date:** September 13, 2026

---

## Objective

Continue the structured Excel learning phase by building on the lookup fundamentals introduced on Day 29.

The goal was to understand advanced lookup and reference techniques, including INDEX, MATCH, XMATCH, dynamic two-way lookups, multi-criteria lookups, reverse searches, error handling, and approximate matching.

The emphasis remained on understanding the logic behind each function and independently constructing formulas rather than memorizing syntax.

---

## Learning Approach

Day 30 followed the DA-90 learning method:

1. Learn
2. Review an example
3. Solve independently
4. Apply the concept to a business scenario
5. Explain the reasoning

Additional repetition from Day 29 was intentionally accepted because it provided useful hands-on practice and reinforced lookup concepts.

---

## Concepts Covered

### 1. INDEX

Learned that INDEX returns a value based on its position within a selected range.

Basic structure:

`=INDEX(array,row_num,[column_num])`

Key concepts:

- INDEX retrieves a value rather than searching for it.
- Row position comes before column position.
- Positions are relative to the selected range, not the worksheet.

Mental model:

**INDEX = WHAT**

---

## 2. MATCH

Learned that MATCH identifies the position of a value within a range.

Example structure:

`=MATCH(lookup_value,lookup_array,0)`

The `0` specifies an exact match.

Mental model:

**MATCH = WHERE**

---

## 3. INDEX + MATCH

Combined INDEX and MATCH to create flexible lookup formulas.

General pattern:

`=INDEX(return_range,MATCH(lookup_value,lookup_range,0))`

The logic is:

- MATCH determines WHERE the value is.
- INDEX retrieves WHAT is stored at that position.

This approach can perform lookups where the return range is located to the left of the lookup range.

---

## 4. XMATCH

Learned that XMATCH is a modern position-matching function with additional control over match behavior and search direction.

Structure:

`=XMATCH(lookup_value,lookup_array,[match_mode],[search_mode])`

Important match modes:

- `0` → exact match
- `-1` → exact match or next smaller item
- `1` → exact match or next larger item
- `2` → wildcard match

Important search modes:

- `1` → first-to-last
- `-1` → last-to-first

Key distinction:

**match_mode = What type of match?**

**search_mode = Which direction should Excel search?**

---

## 5. INDEX + XMATCH

Used XMATCH with INDEX as an alternative to INDEX + MATCH.

Example:

`=INDEX(B2:B6,XMATCH("Keyboard",A2:A6))`

XMATCH finds the position and INDEX returns the corresponding value.

This combination provides flexible lookups without relying on the structural limitations of VLOOKUP.

---

## 6. Left-Side Lookups

Practiced situations where the lookup column appears to the right of the column containing the desired result.

Example:

`=INDEX(A2:A6,XMATCH("Monitor",B2:B6))`

This returns a value from column A based on a match found in column B.

Key lesson:

INDEX + XMATCH does not require the return range to be positioned to the right of the lookup range.

---

## 7. Two-Way Lookups

Practiced retrieving a value based on both a row and a column.

Example:

`=INDEX(B2:D4,XMATCH(F2,A2:A4),XMATCH(G2,B1:D1))`

The first XMATCH finds the row.

The second XMATCH finds the column.

INDEX returns the value at the intersection.

Mental model:

**Row position + Column position → Intersection**

---

## 8. Dynamic Two-Way Lookups

Used input cells rather than hard-coded lookup values.

Example:

`=INDEX(B2:D5,XMATCH(F2,A2:A5),XMATCH(G2,B1:D1))`

Where:

- `F2` contains the selected product.
- `G2` contains the selected month.

Changing either input changes the returned result automatically.

This demonstrated how lookup formulas can be used to build flexible analysis tools.

---

## 9. Multi-Criteria Lookups

Practiced finding a row based on multiple conditions.

Example:

`=INDEX(C2:C7,XMATCH(1,(A2:A7=F2)*(B2:B7=G2)))`

The multiplication operator combines conditions using AND logic.

The formula finds the position where:

- Condition 1 is TRUE
- Condition 2 is TRUE

XMATCH identifies the matching position and INDEX returns the corresponding value.

---

## 10. Last-Match Lookups

Practiced finding the last occurrence of a value by using XMATCH with reverse search.

Example:

`=INDEX(C2:C7,XMATCH(F2,B2:B7,0,-1))`

The `-1` search mode causes XMATCH to search from bottom to top.

This is useful when the business requirement is specifically to retrieve the most recent or last matching record.

---

## 11. Last Match with Multiple Criteria

Combined multiple criteria with reverse searching.

Example:

`=INDEX(D2:D7,XMATCH(1,(B2:B7=F2)*(C2:C7=G2),0,-1))`

This formula:

1. Checks multiple conditions.
2. Identifies rows where both conditions are TRUE.
3. Requires an exact match.
4. Searches from bottom to top.
5. Returns the corresponding value from the return range.

This demonstrated how multiple lookup concepts can be combined into one analytical formula.

---

## 12. Error Handling with IFNA

Practiced handling missing lookup values.

Example:

`=IFNA(INDEX(A2:A5,XMATCH(F2,C2:C5)),"Not Found")`

If the lookup exists, the corresponding result is returned.

If XMATCH produces `#N/A`, IFNA displays:

`Not Found`

Key distinction:

- `IFNA` specifically handles `#N/A`.
- `IFERROR` handles broader Excel error types.

---

## 13. FILTER for Multiple Matching Records

Reinforced that lookup functions such as XLOOKUP and INDEX + XMATCH generally focus on retrieving a single matching result, while FILTER can return multiple matching records.

Example:

`=FILTER(A2:C6,(A2:A6="Monitor")*(C2:C6>9500),"Not Found")`

Multiple conditions can be combined using `*` to represent AND logic.

Key distinction:

**One matching result → XLOOKUP / INDEX + XMATCH**

**All matching records → FILTER**

---

## 14. Approximate Matching and Threshold Tables

Practiced lookup scenarios involving thresholds such as commission tiers.

Example table:

| Minimum Sales | Commission |
| ------------: | ---------: |
|            $0 |         1% |
|        $5,000 |         2% |
|       $10,000 |         3% |
|       $20,000 |         5% |
|       $50,000 |         7% |

For a sales amount such as $47,500, the applicable threshold is the largest value less than or equal to the lookup value.

Therefore:

`$47,500 → $20,000 threshold → 5%`

For exactly $50,000:

`$50,000 → exact threshold → 7%`

XLOOKUP example:

`=XLOOKUP(13500,A2:A5,B2:B5,"Not Found",-1)`

The `-1` match mode represents exact match or next smaller item.

---

## Lookup Decision-Making

Practiced selecting lookup functions based on the business requirement.

| Business Requirement                          | Appropriate Tool                        |
| --------------------------------------------- | --------------------------------------- |
| Simple lookup in a new workbook               | XLOOKUP                                 |
| Existing legacy workbook built around VLOOKUP | VLOOKUP                                 |
| Find the position of a value                  | MATCH / XMATCH                          |
| Return a value based on a position            | INDEX                                   |
| Flexible left-side lookup                     | INDEX + XMATCH                          |
| Return a value using row and column criteria  | INDEX + XMATCH + XMATCH                 |
| Return the last matching value                | XMATCH with reverse search              |
| Return a value using multiple criteria        | INDEX + XMATCH with multiple conditions |
| Return all matching records                   | FILTER                                  |
| Lookup based on thresholds                    | XLOOKUP approximate match               |

---

## Key Lessons

### MATCH / XMATCH vs. INDEX

**MATCH / XMATCH**

> Finds WHERE the value is.

**INDEX**

> Returns WHAT is stored at that position.

---

### Match Mode vs. Search Mode

These arguments should not be confused.

**Match mode:**

Determines what qualifies as a match.

**Search mode:**

Determines the direction in which Excel searches.

---

### Exact vs. Approximate Matching

Exact matching is appropriate when the specific lookup value must exist.

Approximate matching is useful when working with ordered threshold tables such as commission tiers or performance bands.

---

### One Result vs. Multiple Results

A lookup formula is generally appropriate when the business question requires one corresponding result.

FILTER is more appropriate when the business question requires all records meeting one or more conditions.

---

## Practical Exercises Completed

During Day 30, independently constructed formulas for:

- INDEX lookups
- MATCH position searches
- INDEX + MATCH
- INDEX + XMATCH
- Left-side lookups
- Dynamic two-way lookups
- Multi-criteria lookups
- Last-occurrence lookups
- Multi-criteria last-occurrence lookups
- IFNA error handling
- XLOOKUP approximate matching
- FILTER with multiple conditions

Also independently explained the purpose of:

- Match mode
- Search mode
- Exact matching
- Approximate matching
- Reverse searching
- Multiple-condition logic

---

## Competency Assessment

Day 30 provided substantial hands-on practice with advanced lookup techniques.

Current assessment:

| Skill Area                | Status            |
| ------------------------- | ----------------- |
| INDEX                     | 🟡 Practice Needed |
| MATCH                     | 🟡 Practice Needed |
| XMATCH                    | 🟡 Practice Needed |
| INDEX + MATCH             | 🟡 Practice Needed |
| INDEX + XMATCH            | 🟡 Practice Needed |
| Two-way lookup            | 🟡 Practice Needed |
| Multi-criteria lookup     | 🟡 Practice Needed |
| Reverse/last-match lookup | 🟡 Practice Needed |
| IFNA error handling       | 🟡 Practice Needed |
| Approximate matching      | 🟡 Practice Needed |
| FILTER                    | 🟡 Practice Needed |

The concepts were successfully applied independently during exercises, but continued application in different business contexts will be required before classifying them as fully mastered.

---

## Reflection

Lookup & Reference proved to be a significantly broader Excel competency than initially expected.

The DA-90 schedule was therefore adjusted to avoid spending excessive time on lookup functions while still providing meaningful practice.

Day 29 introduced the lookup fundamentals, while Day 30 reinforced and expanded those concepts through advanced scenarios.

Additional lookup repetition from Day 29 was useful because it strengthened formula construction, reasoning, and recall.

At this point, the lookup section is considered sufficiently covered for the current Excel phase.

The focus will now shift to other important Excel analyst competencies rather than continuing to expand the lookup curriculum indefinitely.

---

## Outcome

Completed the structured Lookup & Reference portion of the Excel learning phase.

The major takeaway is that Excel lookup functions should be selected based on the business question:

**Find one value → lookup**

**Find a position → MATCH/XMATCH**

**Return a value from a position → INDEX**

**Find a value using multiple dimensions → INDEX + XMATCH**

**Return all matching records → FILTER**

**Find an applicable threshold → approximate matching**

---

## Next

**Day 31 — Logic, Conditional Analysis & Data Cleaning**

Planned focus:

- IF
- IFS
- AND / OR / NOT
- IFERROR / IFNA
- SUMIF / SUMIFS
- COUNTIF / COUNTIFS
- AVERAGEIF / AVERAGEIFS
- TRIM
- CLEAN
- LEFT / RIGHT / MID
- FIND / SEARCH
- SUBSTITUTE / REPLACE
- Remove Duplicates
- Find & Replace
- Handling blanks
- Standardizing inconsistent values

The focus will remain on practical analyst scenarios and independent problem-solving rather than attempting to complete every Excel function in a single session.