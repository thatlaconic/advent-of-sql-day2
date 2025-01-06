

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
	
--Dear Santa, I hope this letter finds you well in the North Pole! I want a SQL course for Christmas!
