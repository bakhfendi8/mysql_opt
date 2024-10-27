# Optimize MySQL statement
Here are some methods to improve this SQL query:

1. Use fewer `LIKE` wildcards
The `LIKE` `'%value%'` pattern is costly, particularly when applied to connected tables and many fields. If at all possible, substitute `LIKE` `'value%'` for partial matches or `LIKE =` for exact matches. As a result, a full-text scan is not as necessary.

2. Employ Indexing in Full Text
`JobCategories.name`, `JobTypes.name`, `Jobs.name`, and other fields searched with `LIKE` `'%value%'` would benefit from a full-text index. Compared to the `LIKE` wildcard, full-text indexing is quicker and more effective for these searches.

3. Include indexes in the filtered and join columns.
For joins and conditions, add indexes to the `Jobs.deleted`, `JobCategories.deleted`, and `JobTypes.deleted` columns.
`WHERE` clauses often use index columns like `Jobs.publish_status` and `Jobs.deleted`.

4. Make `Group By` and `Order By` more efficient
Make sure `Jobs.id` has an index since the query groups by `Jobs.id`.
It is possible to improve sorting by `Jobs.sort_order` and `Jobs.id` by indexing both fields together.