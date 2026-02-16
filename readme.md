

# 📊 SQL for Data Analysis – Ecommerce Database Project

## 📌 Project Objective

The objective of this project is to use SQL queries to extract, manipulate, and analyze structured data from an Ecommerce database. The project demonstrates practical knowledge of SELECT statements, JOIN operations, subqueries, aggregate functions, views, and indexing.

---

## 🛠 Tools Used

* MySQL Workbench
* SQL

---

## 🗂 Database Name

`shop_management_db`

---

## 📁 Tables Created

### 1️⃣ Clients

Stores customer information.

* client_id (Primary Key)
* client_name
* client_email
* city

### 2️⃣ Items

Stores product details.

* item_id (Primary Key)
* item_name
* price
* stock

### 3️⃣ Purchase

Stores purchase transactions.

* purchase_id (Primary Key)
* client_id (Foreign Key)
* purchase_date

### 4️⃣ Purchase_Details

Stores details of purchased items.

* purchase_detail_id (Primary Key)
* purchase_id (Foreign Key)
* item_id (Foreign Key)
* quantity

---

## 🔎 SQL Concepts Implemented

### ✅ Basic Queries

* SELECT
* WHERE
* ORDER BY
* GROUP BY

### ✅ Aggregate Functions

* SUM()
* AVG()
* COUNT()

### ✅ Joins

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN

### ✅ Subqueries

Used to filter data based on calculated conditions.

### ✅ Views

Created view for client purchase summary.

### ✅ Indexes

Indexes created to optimize query performance.

---

## 📊 Sample Analysis Performed

* Total revenue calculation
* Total amount spent by each client
* Top spending client
* Items above average price
* Purchase details with client and item information

---

## 🚀 Outcome

Through this project, I learned how to:

* Design relational database structure
* Use SQL queries for data analysis
* Perform JOIN operations
* Apply aggregate functions
* Create views for reusable analysis
* Optimize queries using indexes

This project improved my understanding of structured data manipulation and SQL-based data analysis.

--