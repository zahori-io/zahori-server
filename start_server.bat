@echo off

echo Set environment variables defined in file vars.env
for /F %%x in (vars.env) do (
   set %%x
)

echo Create docker volume for PostgreSql
docker volume create --name zahori-database --driver local

echo Download browser images
for /F %%x in (browsers) do (
   docker pull %%x
)

echo Start docker-compose
docker-compose down
docker-compose up

pause
