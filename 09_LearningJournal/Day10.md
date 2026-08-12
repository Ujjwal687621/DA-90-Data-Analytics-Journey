# DA-90 Learning Journal — Day 10

**Date:** ___________

---

# Today's Goal

Solve a business request independently by designing the solution before writing SQL.

---

# Business Request

Identify consistent high-value customers based on completed transactions, customer spending, country averages and customer ranking.

---

# What I Learned

Today was my first day solving an almost complete business problem independently.

Instead of immediately writing SQL, I first designed:

- Data Flow
- Temporary Datasets
- Dataset Grain
- Relationships between datasets

Only after the design was approved did I begin writing SQL.

This process made the implementation much easier.

---

# Major Concepts

- Business-first SQL Design
- CTE Architecture
- Dataset Grain
- ROW_NUMBER()
- PARTITION BY
- LEFT JOIN
- INNER JOIN discussion
- WHERE vs HAVING
- SQL Code Review

---

# Biggest Lesson

Every SQL query should begin by answering:

"What should one row represent?"

Once the dataset grain is clear, the SQL becomes much easier to write.

I also learned that SQL should always be validated against the original business requirements before considering the solution complete.

---

# Challenges

Initially I forgot one business requirement:

- At least 3 completed transactions.

This reminded me that even when SQL is technically correct, it may still fail to satisfy every business requirement.

I also reviewed the differences between:

- WHERE
- HAVING
- GROUP BY

and learned when each should be used.

---

# Accomplishments

Successfully designed and implemented:

- Customer Spending Summary
- Average Customer Spending
- Customer Ranking

Combined them into a production-ready report identifying consistent high-value customers.

Received approval after a final business requirement review.

---

# Reflection

Today felt much closer to real-world analytics work.

The focus was no longer SQL syntax.

Instead, the focus was:

- Understanding business requirements.
- Designing reusable datasets.
- Explaining design decisions.
- Reviewing SQL like a production code review.

This is the type of work I expect to perform as a professional Data Analyst.

---

# Tomorrow's Goal

Continue solving business problems with even less guidance while improving solution architecture and analytical thinking.