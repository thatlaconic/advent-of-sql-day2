# [Santa's jumbled letters 🎅](https://adventofsql.com/challenges/2)

## Description
Santa had modernized his mail system to handle the billions of electronic letters coming in from children worldwide. But the magical Aurora Borealis, extra sparkly this season, had interfered with the database servers, turning perfectly good Christmas wishes into a jumble of integers!

To make matters worse, the backup system (managed by two excitable elf twins, Binky and Blinky) had split the data across different tables, and somehow mixed in random "holiday sparkles" (aka noise) into the data.

## Challenge
[Download Challenge data](https://github.com/thatlaconic/advent-of-sql-day2/blob/main/advent_of_sql_day_2.sql)

These tables contain pieces of a child's Christmas wish, but they're all mixed up with magical interference from the Northern Lights! We need to:
* Filter out the holiday sparkles (noise)
* Combine Binky and Blinky's tables
* Decode the values back into regular letters
* Valid characters:
  + All lower case letters a - z
  + All upper case letters A - Z
  + Space ! " '( ) , - . : ; ?
  
## Dataset
This dataset contains 2 tables. 
### Using PostgreSQL
**input**
```sql
SELECT *
FROM letters_a;
```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day2/blob/main/letters_a.PNG)

**input**
```sql
SELECT *
FROM letters_b;
```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day2/blob/main/letters_b.PNG)

### Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day2/blob/main/advent_answer_day2.sql)

The values in the table are the numbers in ASCII which stands for the "American Standard Code for Information Interchange".
ASCII is a 7-bit character set containing 128 characters.
It contains the numbers from 0-9, the upper and lower case English letters from A to Z, and some special characters.
The character sets used in modern computers, in HTML, and on the Internet, are all based on ASCII. [Source](https://www.w3schools.com/charsets/ref_html_ascii.asp)

**input**
```sql

WITH CTE AS (SELECT id, value, CHR(value) AS result
			FROM letters_a
			UNION ALL
			SELECT id, value, CHR(value) AS result
			FROM letters_b
			ORDER BY id)
SELECT STRING_AGG(result,'')
FROM CTE
WHERE value BETWEEN 65 AND 90 
OR value BETWEEN 97 AND 122 
OR result IN (' ', '!', '"', '''', '(', ')', ',', '-', '.', ':', ';', '?', ';')
;
```
**output**
```
Dear Santa, I hope this letter finds you well in the North Pole! I want a SQL course for Christmas!
```


