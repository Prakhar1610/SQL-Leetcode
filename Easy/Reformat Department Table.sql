Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| revenue     | int     |
| month       | varchar |
+-------------+---------+
In SQL,(id, month) is the primary key of this table.
The table has information about the revenue of each department per month.
The month has values in ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"].
 

Reformat the table such that there is a department id column and a revenue column for each month.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Department table:
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 2    | 9000    | Jan   |
| 3    | 10000   | Feb   |
| 1    | 7000    | Feb   |
| 1    | 6000    | Mar   |
+------+---------+-------+
Output: 
+------+-------------+-------------+-------------+-----+-------------+
| id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
+------+-------------+-------------+-------------+-----+-------------+
| 1    | 8000        | 7000        | 6000        | ... | null        |
| 2    | 9000        | null        | null        | ... | null        |
| 3    | null        | 10000       | null        | ... | null        |
+------+-------------+-------------+-------------+-----+-------------+
Explanation: The revenue from Apr to Dec is null.
Note that the result table has 13 columns (1 for the department id + 12 for the months).





1-
SELECT id,
       MAX(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
       MAX(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
       MAX(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
       MAX(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
       MAX(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
       MAX(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
       MAX(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
       MAX(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
       MAX(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
       MAX(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
       MAX(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
       MAX(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;


2-
SELECT id, 
    MAX(IF(month = 'Jan', revenue, NULL)) AS Jan_Revenue, 
    MAX(IF(month = 'Feb', revenue, NULL)) AS Feb_Revenue, 
    MAX(IF(month = 'Mar', revenue, NULL)) AS Mar_Revenue,
    MAX(IF(month = 'Apr', revenue, NULL)) AS Apr_Revenue,
    MAX(IF(month = 'May', revenue, NULL)) AS May_Revenue,
    MAX(IF(month = 'Jun', revenue, NULL)) AS Jun_Revenue,
    MAX(IF(month = 'Jul', revenue, NULL)) AS Jul_Revenue,
    MAX(IF(month = 'Aug', revenue, NULL)) AS Aug_Revenue,
    MAX(IF(month = 'Sep', revenue, NULL)) AS Sep_Revenue,
    MAX(IF(month = 'Oct', revenue, NULL)) AS Oct_Revenue,
    MAX(IF(month = 'Nov', revenue, NULL)) AS Nov_Revenue,
    MAX(IF(month = 'Dec', revenue, NULL)) AS Dec_Revenue  
FROM Department
GROUP BY id
ORDER BY id