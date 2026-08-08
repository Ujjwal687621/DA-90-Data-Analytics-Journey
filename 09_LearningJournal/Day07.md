# 🚀 Project DA-90

## Day 7
**Date:** August 7, 2026

---

# 🎯 Today's Objective

Begin learning SQL subqueries and understand how nested queries solve business questions that require intermediate calculations.

---

# ✅ What I Accomplished Today

- Learned what a subquery is.
- Understood the difference between scalar and list subqueries.
- Learned how SQL executes an inner query before the outer query.
- Reviewed WHERE vs HAVING.
- Solved my first scalar subquery.
- Practiced reading SQL before writing SQL.

---

# 📚 SQL Concepts Learned

## Subqueries

A subquery is a query inside another query.

The inner query executes first.

Its result is then used by the outer query.

---

## Scalar Subquery

Returns one value.

Example:

Average transaction amount.

---

## List Subquery

Returns multiple values.

Example:

Customer IDs with completed transactions.

---

## Business Thinking

Today's biggest lesson was understanding the difference between:

- Average transaction amount
- Average customer spending

These answer different business questions.

Average customer spending requires calculating each customer's total spending first before averaging those totals.

---

# 💼 Business Tickets

## Ticket DA-014

Understanding customer spending versus average customer spending.

## Ticket DA-015

Transactions greater than average transaction amount.

## Ticket DA-016

Customers with no completed transactions using NOT IN.

## Ticket DA-017

Discussed the design for finding customers whose total spending is above the average customer spending. This will be completed tomorrow.

---

# 💡 Biggest Lesson Today

Before writing SQL, identify exactly what information the inner query should return. Understanding the purpose of the subquery makes writing the SQL much easier.

---

# 📝 Code Review Notes

## Positive

- Correctly identified what a subquery returns.
- Correctly explained how the outer query uses the subquery.
- Strong business reasoning.
- Asked clarifying questions instead of making assumptions.

## Improvements

- Continue practicing when to use WHERE versus HAVING.
- Continue simplifying queries by only joining tables that are required.
- Practice nested thinking by breaking problems into multiple logical steps.

---

# 📈 Confidence (1–10)

8/10

Reason:

The concepts made sense, but I felt mentally fatigued toward the end of the session. I understood the logic but wanted to stop before forcing more learning. I'll revisit the advanced subquery example tomorrow with a fresh mind.

---

# 🎯 Goal for Tomorrow

- Complete the average customer spending challenge.
- Write more subqueries independently.
- Compare subqueries and CTEs.
- Continue solving business tickets.

---

# 🌱 Growth Tracker

## SQL

- [x] SELECT
- [x] WHERE
- [x] ORDER BY
- [x] LIMIT
- [x] DISTINCT
- [x] COUNT()
- [x] SUM()
- [x] AVG()
- [x] GROUP BY
- [x] HAVING
- [x] INNER JOIN
- [x] LEFT JOIN
- [x] CASE
- [x] COALESCE()
- [x] ROW_NUMBER()
- [x] PARTITION BY
- [x] CTE (WITH)
- [x] NULLIF()
- [x] Scalar Subqueries
- [x] List Subqueries

## Database

- [x] Relational Design
- [x] Primary Key
- [x] Foreign Key
- [x] Business Reporting

## Git

- [x] Daily commits
- [x] Daily documentation

---

# Reflection

Today introduced subqueries, which required thinking differently than previous SQL topics. Instead of writing one query, I learned how one query can produce information that another query uses. I also learned that understanding the business question is more important than immediately writing SQL. Although I became mentally tired near the end of the session, stopping at the right time allowed me to preserve my focus for tomorrow. Consistency is more valuable than forcing extra study when my concentration is fading.