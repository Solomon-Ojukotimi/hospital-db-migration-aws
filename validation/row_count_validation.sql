SELECT 'patients' AS table_name, COUNT(*) AS row_count FROM hospital_db.patients
UNION ALL
SELECT 'encounters', COUNT(*) FROM hospital_db.encounters
UNION ALL
SELECT 'payers', COUNT(*) FROM hospital_db.payers
UNION ALL
SELECT 'procedures', COUNT(*) FROM hospital_db.procedures;