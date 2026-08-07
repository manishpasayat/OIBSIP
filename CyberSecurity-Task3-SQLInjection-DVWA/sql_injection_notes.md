# SQL Injection Notes

## Target

DVWA (Security Level: Low)

---

## Payload 1

```sql
' OR '1'='1
```

### Purpose

Classic SQL Injection that makes the WHERE clause always TRUE.

### Result

Returned multiple user records.

---

## Payload 2

```sql
1' OR '1'='1'#
```

### Purpose

Uses a SQL comment (`#`) to ignore the remaining query.

### Result

Displayed all available user records.

---

## Payload 3

```sql
1' UNION SELECT user,password FROM users#
```

### Purpose

Uses UNION SELECT to retrieve usernames and password hashes from the users table.

### Result

Successfully exposed usernames and password hashes.

---

## Analysis

DVWA was intentionally configured with Low security, allowing unsanitized user input to be directly included in SQL queries.

This enabled SQL Injection attacks that revealed sensitive database information.

---

## Prevention

- Prepared Statements
- Parameterized Queries
- Input Validation
- Escaping User Input
- Least Privilege Database Accounts
