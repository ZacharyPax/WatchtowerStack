SELECT NULL, * 
FROM "main"."queries" 
WHERE "domain" REGEXP '^[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\.ru$' 
ORDER BY "timestamp" ASC 
LIMIT 49999 OFFSET 0;
