# Day 37 — Power BI Filtering, Slicers & Visual Interactions

**Date:** September 23, 2026

**Phase:** Phase 3 — Power BI & Data Visualization

**Project:** Portfolio Project #1 — Ujjsha Retail Analysis

**Status:** ✅ Complete

---

## Objective

Build practical Power BI report interaction skills by learning how different types of filters, slicers, and visual interactions affect report behavior.

The goal was not only to learn where the buttons are, but to understand when an analyst would use each interaction method.

---

## Topics Covered

### 1. Visual-Level Filters

Practiced using:

**Filters on this visual**

Learned that visual-level filters affect only the selected visual.

**Exercise**

* Applied `category = Office`
* Confirmed only Office remained in the column chart
* Restored all categories

**Key takeaway**

Visual-level filters are useful when only one visual should display filtered information.

---

### 2. Page-Level Filters

Practiced using:

**Filters on this page**

Applied:

`category = Office`

Observed:

* The chart displayed only Office.
* Learned that page-level filters affect visuals on the current report page.

Cleared the page filter afterward.

---

### 3. Report-Level Filters

Practiced using:

**Filters on all pages**

Applied:

`category = Office`

Observed:

* The report became filtered to Office.
* Learned that report-level filters affect every report page.

Cleared the report-level filter afterward.

---

## Filter Scope Comparison

| Filter Type | Scope         |
| ----------- | ------------- |
| Visual      | One visual    |
| Page        | Current page  |
| Report      | Entire report |

This comparison helped reinforce when each filter scope should be used.

---

# Slicers

Created the first interactive slicer.

Field used:

`category`

Initially displayed:

* Accessories
* Audio
* Computer
* Networking
* Office

The slicer successfully controlled the Revenue by Category visual.

---

## Slicer Styles

Tested all available slicer styles.

### Vertical List

* Categories remain visible.
* Good for a small number of categories.

### Tile

* Categories become clickable buttons.
* Useful for highly interactive dashboards.

### Dropdown

* Saves report space.
* Better for cleaner dashboard layouts.

The final slicer was left as:

**Dropdown**

---

## Single Select vs Multi-Select

Practiced both selection modes.

### Single Select ON

Behavior:

* Selecting Networking replaced Office.
* Only one category could remain active.

### Single Select OFF

Behavior:

* Multiple categories could be selected.
* Multi-selection using Ctrl worked correctly.

The slicer was restored to:

* Single Select OFF
* Dropdown style
* All categories selected

---

# Visual Interactions

Created a second visual for interaction testing.

### Donut Chart

Configuration:

* Legend → category
* Values → revenue

The donut chart displayed the revenue share for each category.

---

## Cross-Highlighting

Clicked:

Office

Observed:

* Office became highlighted.
* Other categories faded.

This demonstrated Power BI's default visual interaction behavior.

---

## Edit Interactions

Used:

**Format → Edit interactions**

Tested all three interaction modes.

### Highlight

Result:

* Selected category remained highlighted.
* Other categories faded.

### Filter

Result:

* Only the selected category remained visible.

### None

Result:

* The other visual did not respond.

Restored the interaction back to:

**Highlight**

---

# Slicer Controlling Multiple Visuals

Tested the slicer with both visuals.

Selecting:

Office

caused:

* Column chart
* Donut chart

to update simultaneously.

This demonstrated that a single slicer can control multiple visuals on the same report page.

The slicer was cleared afterward.

---

# Practical Skills Learned

Today's work focused on practical report behavior rather than building additional visuals.

Major concepts learned:

* Visual-level filters
* Page-level filters
* Report-level filters
* Slicer creation
* Dropdown slicers
* Tile slicers
* Vertical list slicers
* Single select
* Multi-select
* Clearing slicers
* Cross-highlighting
* Visual filtering
* Edit interactions
* Highlight vs Filter vs None
* One slicer controlling multiple visuals

---

# Analyst Takeaways

The biggest lesson from Day 37 is that Power BI provides multiple ways to control report behavior.

An analyst must decide whether filtering should affect:

* one visual,
* one page,
* the entire report,
* or only highlight related information.

Understanding these interaction choices is an important part of designing user-friendly business dashboards.

---

# Day 37 Status

**Power BI Filtering, Slicers & Visual Interactions — ✅ Complete**

---

# Next Step

**Day 38 — Interactive Analysis & Navigation**

Planned topics:

* Choosing the right filtering approach
* Slicer design decisions
* Drill-down
* Drill-through
* Hierarchies
* Advanced tooltips
* Interactive report navigation
