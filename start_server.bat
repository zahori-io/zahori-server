@echo off

echo Set environment variables defined in file env-vars.txt
for /F %%x in (env-vars.txt) do (
   set %%x
)

echo Create docker volume for PostgreSql
docker volume create --name zahori-database --driver local

echo Start docker-compose
docker-compose down
docker-compose up

pause