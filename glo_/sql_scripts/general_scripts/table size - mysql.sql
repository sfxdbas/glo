SELECT 
  TABLE_NAME AS `Table`,
  ROUND((DATA_LENGTH +  INDEX_LENGTH) / 1024 / 1024) AS `Size (MB)`
FROM
  information_schema.TABLES
WHERE
  TABLE_NAME in ('SR_REGISTRATION_ARCHIVE',
'SR_REGISTRATION_ARCHIVE_20181204',
'ARCHIVE_SR_REGISTRATION',
'ARCHIVE_SR_DEMOGRAPHIC_DATA',
'ARCHIVE_SR_FINGERPRINT_DATA')
-- ORDER BY
--   (DATA_LENGTH + INDEX_LENGTH)
-- DESC
;