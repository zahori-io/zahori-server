@echo off

echo Set environment variables defined in file env-vars.txt
for /F %%x in (env-vars.txt) do (
   set %%x
)

echo Stop docker-compose
docker-compose down

if /i "%BACKUP_DATABASE_ENABLED%"=="1" (
  echo Launching database backup...
  docker run --rm^
    --volume zahori-database:/tmp/data^
    --volume %BACKUP_DIRECTORY%:/tmp/backup^
    ubuntu^
    tar cvf /tmp/backup/zahori_database.tar /tmp/data
)
if /i "%BACKUP_EVIDENCES_ENABLED%"=="1" (
  echo Launching evidences backup...
  docker run --rm^
    --volume zahori-evidences:/tmp/data^
    --volume %BACKUP_DIRECTORY%:/tmp/backup^
    ubuntu^
    tar cvf /tmp/backup/zahori_evidences.tar /tmp/data
)

echo Launching logs backup...
docker run --rm^
  --volume zahori-logs:/tmp/data^
  --volume %BACKUP_DIRECTORY%:/tmp/backup^
  ubuntu^
  tar -cvzf /tmp/backup/zahori_logs.tar /tmp/