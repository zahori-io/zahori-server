@echo off

echo Set environment variables defined in file env-vars.txt
for /F %%x in (env-vars.txt) do (
   set %%x
)

echo Stop docker-compose
docker-compose down
