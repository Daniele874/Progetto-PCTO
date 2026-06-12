-- Add 'colore' column if missing and set sample values
IF COL_LENGTH('dbo.pilota','colore') IS NULL
BEGIN
    ALTER TABLE dbo.pilota ADD colore VARCHAR(50) NULL;
END

-- Optionally update existing rows with example colors (customize as needed)
UPDATE dbo.pilota SET colore = CASE 
    WHEN nome LIKE '%Kimi%' THEN 'rosso'
    WHEN nome LIKE '%Lewis%' THEN 'rosso'
    WHEN nome LIKE '%George%' THEN 'azzurro'
    ELSE 'bianco' END
WHERE colore IS NULL;
