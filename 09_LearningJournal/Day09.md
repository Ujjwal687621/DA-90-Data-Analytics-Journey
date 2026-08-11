# DA-90 Learning Journal — Day 9

**Date:** ___________

---

# Today's Goal

Continue practicing CTEs and window functions without introducing new SQL concepts. Focus on solving business problems by designing datasets before writing SQL.

---

# What I Learned

Today was one of the biggest mindset shifts since starting DA-90.

Instead of immediately writing SQL, I learned to design the solution first.

The process became:

Business Question
↓

Determine what each row should represent
↓

Design temporary datasets (CTEs)
↓

Define relationships between datasets
↓

Write SQL

I practiced building reusable CTEs and learned how different datasets have different levels of detail (grain).

---

# Major Concepts

- Customer Summary CTE
- Country Average CTE
- Country Ranking CTE
- Dataset Grain
- ROW_NUMBER()
- PARTITION BY
- INNER JOIN vs LEFT JOIN
- CROSS JOIN
- Business-first SQL Design

---

# Biggest Lesson

One of the most valuable lessons today was learning to ask:

"What does one row represent?"

Instead of thinking about SQL syntax first, I now think about the structure of the data first.

This approach makes complex SQL problems much easier to solve.

---

# Challenges

I initially confused when CROSS JOIN should be used.

I also needed a better understanding of when INNER JOIN and LEFT JOIN produce the same results and when they do not.

After working through examples, I now understand that the choice depends on the relationship between datasets rather than simply the SQL syntax.

---

# Accomplishments

Successfully designed a complete analytical solution using multiple CTEs.

Created:

- Customer Summary
- Country Average
- Country Ranking

Combined them into a final report identifying loyal customers based on business requirements.

---

# Reflection

Today felt much closer to real data analyst work.

Instead of solving isolated SQL exercises, I designed an analytical pipeline from a business request.

I'm becoming more comfortable breaking larger problems into smaller reusable datasets before writing SQL.

This feels like a significant improvement compared to my first week.

---

# Tomorrow's Goal

Receive a business request, design the entire solution independently, and defend the design decisions during code review.