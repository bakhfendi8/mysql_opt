# Optimize MySQL statement

Please check into file `optimize.sql` for the SQL statement that had been optimized. Here are the explanations:

## 1. Subquery for Job Filtering

The inner query `(FilteredJobs)` restricts the results to the `top 50` and pre-selects `Jobs` rows that satisfy the `LIKE` and `WHERE` constraints. By doing this, the volume of data is decreased before more joins are made.

## 2. Joining on Filtered Data

As needed, the main query joins `JobCategories`, `JobTypes`, and other relevant tables with the smaller set of filtered data.

## 3. Optimizing LIMIT Usage

Performance is increased by using `LIMIT` in the subquery, which guarantees that only the `top 50` results are handled by follow-up joins.

## 4. Decreased Data Load in Joins

The join operation is less difficult overall because the filtering is done before the joins, which could result in speedier execution.