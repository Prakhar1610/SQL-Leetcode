Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.
'



1-
SELECT email FROM Person
GROUP BY email
HAVING COUNT(email) > 1;


2- Use self join.

SELECT DISTINCT a.Email
FROM Person a JOIN Person b
ON (a.Email = b.Email)
WHERE a.Id <> b.Id


3- Subquery

 SELECT DISTINCT a.Email
 FROM Person a
 WHERE EXISTS(
     SELECT 1
     FROM Person b
     WHERE a.Email = b.Email
     LIMIT 1, 1
 )


4- Left join
 SELECT DISTINCT a.Email
 FROM Person a
 WHERE EXISTS(
     SELECT 1
     FROM Person b
     WHERE a.Email = b.Email
     LIMIT 1, 1
 )