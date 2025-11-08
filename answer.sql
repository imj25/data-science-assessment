-- ADD YOUR SQL QUERY HERE
SELECT 
i.investor_id,
s.sector_name,
i.no_of_shares * 100.0 / t.total AS percentage
FROM investor_transactions i
JOIN sectors s ON i.sector_id = s.sector_id
JOIN(
    SELECT investor_id, SUM(no_of_shares) AS total
    FROM investor_transactions
    GROUP BY investor_id
) t ON i.investor_id = t.investor_id
ORDER BY i.investor_id, s.sector_name;