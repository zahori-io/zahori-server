@echo off

echo Set environment variables defined in file vars.env
for /F %%x in (vars.env) do (
   set %%x
)

echo Stop docker-compose
docker-compose down
