# Day 31 — Logic, Conditional Analysis & Data Cleaning

**Project:** DA-90 — Data Analytics Journey  
**Phase:** Phase 2 — Excel Analysis & Reporting  
**Focus:** Excel Logic, Conditional Analysis & Data Cleaning

## Objective

Continue the structured Excel learning phase by building a strong foundation in:

- Logical functions
- Conditional analysis
- Conditional aggregation
- Text cleaning and transformation
- Duplicate identification
- Find & Replace
- Blank handling
- Business-rule classification

The goal was to move beyond simply using Excel inside Project #1 and develop independent understanding of the underlying Excel concepts.

## Learning Approach

Continued the DA-90 structured learning model:

**Learn → Example → Solve → Business Scenario → Ujjsha Application → Explain Reasoning**

The emphasis was on understanding what each function does, why it is appropriate for a business question, and how to validate the result.

## 1. Logical Functions

### IF

Learned the structure:

=IF(logical_test,value_if_true,value_if_false)

Practiced using IF to classify business conditions.

Example:

=IF(B2>=10000,"High Performer","Not High Performer")

Important learning point:

- `>=` means greater than or equal to.
- `>` means strictly greater than.
- The exact comparison operator must match the business requirement.

**Competency:** 🟢 Strong Practice

### AND

Learned that AND evaluates multiple conditions and returns TRUE only when all conditions are TRUE.

Example:

=IF(AND(B2>=10000,C2>=50),"High Performer","Not High Performer")

Practiced combining AND with IF to create business classifications.

**Competency:** 🟢 Strong Practice

### OR

Learned that OR returns TRUE when at least one condition is TRUE.

Example:

=OR(B2<5000,C2<20)

Combined OR with IF:

=IF(OR(B2<5000,C2<20),"Needs Attention","Healthy")

**Competency:** 🟢 Strong Practice

### AND + OR

Practiced combining logical functions to represent more complex business rules.

Example business rule:

A product requires Priority Review if revenue is below $5,000 AND units are below 20, OR revenue is above $20,000.

Formula:

=IF(OR(AND(B2<5000,C2<20),B2>20000),"Priority Review","Normal")

The exercise reinforced the importance of understanding the structure of nested logic before writing the formula.

**Competency:** 🟢 Strong Practice

### NOT

Learned that NOT reverses a logical result.

Example:

=NOT(B3>=10000)

**Competency:** 🟢 Strong Practice

### IFS

Learned how IFS can evaluate multiple conditions without requiring multiple nested IF statements.

Example:

=IFS(B2>=20000,"Excellent",B2>=10000,"Good",B2>=5000,"Average",B2<5000,"Low")

Important learning point:

Conditions are evaluated in order, so threshold-based classifications should generally be structured from the highest threshold downward.

**Competency:** 🟢 Strong Practice

### IFERROR and IFNA

Reviewed the difference between the two functions.

IFERROR handles Excel errors generally.

Example:

=IFERROR(B2/C2,"No Units")

IFNA specifically handles `#N/A` errors.

Example:

=IFNA(INDEX(A2:A5,XMATCH("Webcam",C2:C5)),"Not Found")

**Competency:**

- IFERROR — 🟢 Strong Practice
- IFNA — 🟡 Practice Needed

IFNA had already been encountered during lookup training, but requires additional independent practice.

## 2. Conditional Aggregation

### SUMIF

Learned how SUMIF calculates a total based on one condition.

Syntax:

=SUMIF(range,criteria,sum_range)

Practiced:

- Text criteria
- Numeric criteria
- Comparison operators
- Dynamic criteria

Example:

=SUMIF(B2:B6,">=10000",B2:B6)

For a criterion stored in another cell:

=SUMIF(B2:B6,">="&E1,B2:B6)

Important learning point:

When combining an operator with a cell reference, the operator must be joined to the cell reference using `&`.

**Competency:** 🟢 Strong Practice

### SUMIFS

Learned how SUMIFS applies multiple conditions.

Syntax:

=SUMIFS(sum_range,criteria_range1,criteria1,...)

Example:

=SUMIFS(D2:D6,B2:B6,"Computer",C2:C6,"West")

Also practiced combining text and numeric conditions:

=SUMIFS(D2:D6,B2:B6,"Computer",C2:C6,"East",D2:D6,">=10000")

**Competency:** 🟢 Strong Practice

### COUNTIF

Learned how COUNTIF counts records that meet one condition.

Example:

=COUNTIF(D2:D6,">=10000")

Also practiced text-based conditions:

=COUNTIF(C2:C6,"East")

**Competency:** 🟢 Strong Practice

### COUNTIFS

Learned how COUNTIFS counts records that meet multiple conditions.

Example:

=COUNTIFS(B2:B6,"Computer",C2:C6,"East",D2:D6,">=10000")

Practiced combining category, region, and revenue conditions.

**Competency:** 🟢 Strong Practice

### AVERAGEIF

Learned how AVERAGEIF calculates an average based on one condition.

Example:

=AVERAGEIF(B2:B6,"Networking",D2:D6)

**Competency:** 🟢 Strong Practice

### AVERAGEIFS

Learned how AVERAGEIFS calculates an average using multiple conditions.

Example:

=AVERAGEIFS(D2:D6,B2:B6,"Computer",C2:C6,"East")

**Competency:** 🟢 Strong Practice

### COUNTBLANK

Learned how COUNTBLANK identifies the number of blank cells in a range.

Example:

=COUNTBLANK(C2:C6)

**Competency:** 🟢 Strong Practice

## 3. Text & Data Cleaning

### TRIM

Learned how TRIM removes unnecessary spaces from text.

Example:

=TRIM(A2)

This is useful when imported or manually entered data contains leading, trailing, or repeated spaces.

**Competency:** 🟢 Strong Practice

### CLEAN

Learned how CLEAN removes non-printing characters.

Example:

=CLEAN(A2)

Combined with TRIM:

=TRIM(CLEAN(A2))

This provides a stronger basic text-cleaning approach.

**Competency:** 🟢 Strong Practice

### LEFT

Learned how LEFT extracts characters from the beginning of a text value.

Example:

=LEFT(A2,4)

For:

COMP-101-LAP

Result:

COMP

### RIGHT

Learned how RIGHT extracts characters from the end of a text value.

Example:

=RIGHT(A2,3)

Result:

LAP

### MID

Learned how MID extracts characters from a specified position.

Example:

=MID(A2,6,3)

Result:

101

**Competency:**

- LEFT — 🟢 Strong Practice
- RIGHT — 🟢 Strong Practice
- MID — 🟢 Strong Practice

### LEN

Learned how LEN counts the number of characters in a text value.

Example:

=LEN(A2)

**Competency:** 🟢 Strong Practice

### FIND

Learned that FIND locates text within another text value and is case-sensitive.

Example:

=FIND("-",A2)

**Competency:** 🟢 Strong Practice

### SEARCH

Learned that SEARCH locates text without requiring case-sensitive matching.

Example:

=SEARCH("computer",A2)

**Competency:** 🟢 Strong Practice

### FIND vs SEARCH

Key distinction:

FIND = case-sensitive

SEARCH = not case-sensitive

### SUBSTITUTE

Learned how SUBSTITUTE replaces specific text.

Example:

=SUBSTITUTE(A2,"-","_")

### REPLACE

Learned how REPLACE changes characters based on their position.

Example:

=REPLACE(A2,6,3,"205")

Key distinction:

SUBSTITUTE → replaces specific text.

REPLACE → replaces characters based on position.

**Competency:**

- SUBSTITUTE — 🟢 Strong Practice
- REPLACE — 🟢 Strong Practice

### PROPER

Learned how PROPER converts text into proper-case formatting.

Example:

=PROPER(TRIM(A2))

For:

   networking   

Result:

Networking

A stronger cleaning combination is:

=PROPER(TRIM(CLEAN(A2)))

**Competency:** 🟢 Strong Practice

## 4. Duplicate Identification

Learned that duplicate values do not automatically mean duplicate records.

Example:

Two transactions may have the same Customer ID but different Transaction IDs.

That does not necessarily mean one is a duplicate.

A duplicate should be evaluated against the appropriate business key or combination of identifying fields.

For example, identical values across:

- Transaction ID
- Customer ID
- Product
- Revenue

may indicate a true duplicate record.

**Key Learning:**

Duplicate value ≠ duplicate record.

The analyst must understand the dataset and determine what makes a record unique before removing duplicates.

**Competency:** 🟢 Strong Practice

## 5. Find & Replace

Practiced using systematic data-cleaning techniques rather than manually editing large datasets.

For a dataset containing thousands of records, Find & Replace is more efficient and consistent than editing individual cells.

**Competency:** 🟢 Strong Practice

## 6. Integrated Business Scenario

Applied the Day 31 concepts to a simulated Ujjsha business dataset.

Initial data contained:

- Unnecessary spaces in Product names
- Inconsistent category capitalization
- A duplicate Laptop record

Example:

 Laptop 

and:

computer

were identified as data-quality issues.

The duplicate Laptop record was identified by comparing the relevant business fields rather than simply looking for repeated values.

### Conditional Analysis

After cleaning the data, conditional aggregation was used to answer business questions.

### Computer + East Revenue

Formula:

=SUMIFS(D2:D6,B2:B6,"Computer",C2:C6,"East")

The raw dataset produced:

$34,500

because the duplicate Laptop record was still present.

After removing the duplicate, the correct result was:

$22,500

**Key Learning:**

Clean the data before producing business reporting results.

### Computer + East Products with Revenue ≥ $10,000

Formula:

=COUNTIFS(B2:B6,"Computer",C2:C6,"East",D2:D6,">=10000")

After duplicate removal, the result was:

2

## 7. Final Integrated Test

The final exercise combined:

- IF
- AND
- Revenue threshold
- Unit threshold
- Business classification

Business rule:

Classify a product as "High Performer" if Revenue is at least $10,000 AND Units are at least 50. Otherwise classify it as "Not High Performer."

Correct formula:

=IF(AND(D2>=10000,E2>=50),"High Performer","Not High Performer")

For the Laptop:

- Revenue = $12,000
- Units = 60
- Revenue condition = TRUE
- Units condition = TRUE
- AND result = TRUE

Final classification:

High Performer

The exercise demonstrated correct understanding of the formula architecture, AND logic, and business interpretation. A minor quotation-mark syntax error was corrected during validation.

## 8. Day 31 Competency Assessment

| Skill Area                   | Status            |
| ---------------------------- | ----------------- |
| IF                           | 🟢 Strong Practice |
| AND                          | 🟢 Strong Practice |
| OR                           | 🟢 Strong Practice |
| NOT                          | 🟢 Strong Practice |
| IFS                          | 🟢 Strong Practice |
| IFERROR                      | 🟢 Strong Practice |
| IFNA                         | 🟡 Practice Needed |
| SUMIF                        | 🟢 Strong Practice |
| SUMIFS                       | 🟢 Strong Practice |
| COUNTIF                      | 🟢 Strong Practice |
| COUNTIFS                     | 🟢 Strong Practice |
| AVERAGEIF                    | 🟢 Strong Practice |
| AVERAGEIFS                   | 🟢 Strong Practice |
| COUNTBLANK                   | 🟢 Strong Practice |
| TRIM                         | 🟢 Strong Practice |
| CLEAN                        | 🟢 Strong Practice |
| LEFT                         | 🟢 Strong Practice |
| RIGHT                        | 🟢 Strong Practice |
| MID                          | 🟢 Strong Practice |
| LEN                          | 🟢 Strong Practice |
| FIND                         | 🟢 Strong Practice |
| SEARCH                       | 🟢 Strong Practice |
| SUBSTITUTE                   | 🟢 Strong Practice |
| REPLACE                      | 🟢 Strong Practice |
| PROPER                       | 🟢 Strong Practice |
| Duplicate Identification     | 🟢 Strong Practice |
| Find & Replace               | 🟢 Strong Practice |
| Business Rule Classification | 🟢 Strong Practice |

## 9. Key Lessons

### 1. Formula logic matters as much as syntax

A formula can look structurally correct but still produce the wrong business result if the comparison operator or threshold is wrong.

### 2. Criteria syntax matters

For dynamic criteria such as:

>=E1

the correct construction is:

">="&E1

### 3. Conditional aggregation is a core analyst skill

SUMIF, SUMIFS, COUNTIF, COUNTIFS, AVERAGEIF, and AVERAGEIFS allow analysts to answer business questions without manually filtering and calculating data.

### 4. Data cleaning happens before analysis

Incorrect spaces, inconsistent values, duplicates, and blanks can change analytical results.

### 5. Duplicate detection requires business context

Repeated values do not automatically represent duplicate records.

### 6. Business questions should drive the formula

The goal is not to memorize Excel functions. The goal is to select the appropriate function based on the business question.

## 10. Reflection

Day 31 was a major transition from project-based Excel exposure toward structured Excel competency.

The previous Project #1 work demonstrated that Excel could be used to solve business questions. Day 31 strengthened the underlying technical foundation by systematically practicing logical functions, conditional aggregation, and data-cleaning techniques.

The integrated challenge also demonstrated an important analyst workflow:

Clean → Validate → Analyze → Interpret

This reinforces the importance of data quality before reporting business results.

## Day 31 Outcome

Completed structured training and hands-on practice in:

- Logical functions
- Conditional aggregation
- Text cleaning
- Duplicate identification
- Find & Replace
- Blank identification
- Business-rule classification

The majority of Day 31 concepts are now at the Strong Practice level.

The remaining concepts should continue to be reinforced through future business scenarios rather than treated as permanently mastered after a single exercise.

**Next:** Day 32 — Dates, Dynamic Arrays & Advanced Analysis.