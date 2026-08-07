# Task 3 – SQL Injection on DVWA (Low Security)

## Objective

The objective of this task was to demonstrate a classic **SQL Injection (SQLi)** vulnerability using **Damn Vulnerable Web Application (DVWA)** running on a local machine. The experiment was performed only in a controlled environment for educational purposes to understand how insecure SQL queries can expose sensitive information.

---

# Tools Used

- Kali Linux
- Apache2
- MariaDB
- PHP
- DVWA (Damn Vulnerable Web Application)
- Google Chrome

---

# Environment Setup

- Installed and configured Apache2
- Started MariaDB database server
- Installed DVWA inside `/var/www/html/DVWA`
- Created the `dvwa` database
- Configured the DVWA database connection
- Initialized the database using the DVWA Setup page
- Set DVWA Security Level to **Low**

---

# What is SQL Injection?

SQL Injection (SQLi) is a web security vulnerability that allows an attacker to manipulate SQL queries by inserting malicious input into application fields.

If user input is directly included in SQL queries without proper validation or parameterized queries, an attacker can retrieve, modify, or even delete sensitive information stored in the database.

---

# Why These Payloads Work

The SQL Injection page in DVWA directly inserts user input into an SQL query without sanitizing it.

The injected payload changes the logic of the SQL statement so that the database treats the condition as always true or executes an additional query.

This causes the application to return data that should normally remain hidden.

---

# SQL Injection Payloads

## Payload 1 – Classic Authentication Bypass

```sql
' OR '1'='1
```

### Result

- The condition `'1'='1'` always evaluates to TRUE.
- DVWA returned multiple user records instead of a single record.
- Demonstrates a basic SQL Injection vulnerability.

---

## Payload 2 – Comment-Based Injection

```sql
1' OR '1'='1'#
```

### Result

- The `#` comments out the remaining SQL query.
- The WHERE condition becomes TRUE.
- All available user records were displayed.

---

## Payload 3 – UNION-Based SQL Injection

```sql
1' UNION SELECT user,password FROM users#
```

### Result

- Successfully extracted usernames.
- Displayed password hashes stored in the database.
- Demonstrates how attackers can retrieve sensitive database information using UNION SELECT.

---

# Data Exposed

The SQL Injection attack exposed:

- User IDs
- Usernames
- First Names
- Last Names
- Password Hashes (via UNION SELECT)

This demonstrates how an insecure SQL query can leak confidential database information.

---

# Prevention

Developers can prevent SQL Injection by following secure coding practices:

- Use Prepared Statements
- Use Parameterized Queries
- Validate all user input
- Escape special characters
- Apply the Principle of Least Privilege
- Avoid constructing SQL queries using string concatenation
- Perform regular security testing

---

# Screenshots Included

The repository contains screenshots of:

- DVWA Login Page
- DVWA Setup Page
- Security Level set to Low
- SQL Injection Module
- Payload 1 Execution
- Payload 2 Execution
- Payload 3 Execution

---

# Learning Outcome

Through this task, I learned:

- How SQL Injection works
- Why insecure SQL queries are dangerous
- Different SQL Injection payload techniques
- How attackers extract sensitive data
- Best practices to prevent SQL Injection in web applications

---

# Ethical Note

This demonstration was performed **only on a locally hosted DVWA instance** created for cybersecurity learning purposes.

SQL Injection attacks should **never** be attempted against real websites or systems without explicit authorization.
