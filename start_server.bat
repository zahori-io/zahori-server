@echo off

echo Set environment variables defined in file env-vars.txt
for /F %%x in (env-vars.txt) do (
   set %%x
)

echo Creating database volume
docker volume create --name zahori-database --driver local

if "%RESTORE_DATABASE_ENABLED%" == "1" (
  echo "Restoring database..."
  docker run --rm^
    --volume zahori-database:/tmp/restored^
    --volume %RESTORE_DIRECTORY%:/tmp/backup^
    ubuntu^
    tar xvf /tmp/backup/%RESTORE_DATABASE_FILE%.tar -C /tmp/restored --strip 1
)
echo Creating evidences volume
docker volume create --name zahori-evidences --driver local

if "%ENABLED_EVIDENCES_RESTORE%" == "1" (
  echo "Restoring evidences..."
  docker run --rm^
    --volume zahori-evidences:/tmp/restored^
    --volume %RESTORE_DIRECTORY%:/tmp/backup^
    ubuntu^
    tar xvf /tmp/backup/%RESTORE_EVIDENCES_FILE%.tar -C /tmp/restored --strip 1
)

echo Creating logs volume
docker volume create --name zahori-logs --driver local

echo Download browser images
for /F %%x in (browsers) do (
   docker pull %%x
)

echo Start docker-compose
docker-compose down
docker-compose up
