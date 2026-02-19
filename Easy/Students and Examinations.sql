Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.
 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.
 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.

The result format is in the following example.

 

Example 1:

Input: 
Students table:
+------------+--------------+
| student_id | student_name |
+------------+--------------+
| 1          | Alice        |
| 2          | Bob          |
| 13         | John         |
| 6          | Alex         |
+------------+--------------+
Subjects table:
+--------------+
| subject_name |
+--------------+
| Math         |
| Physics      |
| Programming  |
+--------------+
Examinations table:
+------------+--------------+
| student_id | subject_name |
+------------+--------------+
| 1          | Math         |
| 1          | Physics      |
| 1          | Programming  |
| 2          | Programming  |
| 1          | Physics      |
| 1          | Math         |
| 13         | Math         |
| 13         | Programming  |
| 13         | Physics      |
| 2          | Math         |
| 1          | Math         |
+------------+--------------+
Output: 
+------------+--------------+--------------+----------------+
| student_id | student_name | subject_name | attended_exams |
+------------+--------------+--------------+----------------+
| 1          | Alice        | Math         | 3              |
| 1          | Alice        | Physics      | 2              |
| 1          | Alice        | Programming  | 1              |
| 2          | Bob          | Math         | 1              |
| 2          | Bob          | Physics      | 0              |
| 2          | Bob          | Programming  | 1              |
| 6          | Alex         | Math         | 0              |
| 6          | Alex         | Physics      | 0              |
| 6          | Alex         | Programming  | 0              |
| 13         | John         | Math         | 1              |
| 13         | John         | Physics      | 1              |
| 13         | John         | Programming  | 1              |
+------------+--------------+--------------+----------------+
Explanation: 
The result table should contain all students and all subjects.
Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
Alex did not attend any exams.
John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.





SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
ON s.student_id = e.student_id
AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;














🟢 Question: Customers and Products Purchase Report
🧱 Table: Customers
Column Name	Type
customer_id	int
customer_name	varchar

customer_id is the primary key.

Each row represents a unique customer.

🧱 Table: Products
Column Name	Type
product_name	varchar

product_name is the primary key.

Each row represents a unique product.

🧱 Table: Purchases
Column Name	Type
customer_id	int
product_name	varchar

This table may contain duplicates.

Each row indicates that a customer purchased a product.

A customer can purchase the same product multiple times.

Some customers may never purchase certain products.

🎯 Problem Statement

Write an SQL query to find the total number of times each customer purchased each product.

Return the result table with the following columns:

| customer_id | customer_name | product_name | total_purchases |

Requirements:

The result must contain every customer and every product combination, even if the customer never purchased the product.

If a customer has never purchased a product, return 0 for that product.

Order the result by:

customer_id ascending

product_name ascending

📌 Example
Input:
Customers
customer_id	customer_name
1	         Aman
2	         Riya
3	         Kabir
4	         Neha

Products
product_name
Laptop
Phone
Tablet

Purchases
customer_id	product_name
1	         Laptop
1	         Phone
1	         Laptop
2	         Phone
2	         Phone
3	         Tablet
3	         Laptop
3	         Laptop
Output:
customer_id	customer_name	product_name	total_purchases
1	         Aman	              Laptop	              2
1	         Aman	              Phone	                  1
1	         Aman	              Tablet	              0
2	         Riya	              Laptop	              0
2	         Riya	              Phone	                  2
2	         Riya	              Tablet	              0
3	         Kabir	              Laptop	              2
3	         Kabir	              Phone	                  0
3	         Kabir	              Tablet	              1
4	         Neha	              Laptop	              0
4	         Neha	              Phone	                  0
4	        Neha	              Tablet	              0



SELECT c.customer_id, c.customer_name, p.product_name, COUNT(pur.product_name) AS total_purchases
FROM Customers c
CROSS JOIN Products p
LEFT JOIN Purchases pur
ON c.customer_id = pur.customer_id
AND p.product_name = pur.product_name
GROUP BY c.customer_id, c.customer_name, p.product_name
ORDER BY c.customer_id, p.product_name;