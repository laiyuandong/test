@echo off
setlocal enabledelayedexpansion
set PGSHELL_CONFDIR=%~1

rem Load the pgsql connection option parameters.
for /f "tokens=1,2 delims==" %%i in (%PGSHELL_CONFDIR%\pgsql_funcs.conf) do set %%i=%%j

psql -h %PGHOST% -p %PGPORT% -U %PGROLE% -d %PGDATABASE% -t -A -c "select 1" 2>nul
if %errorlevel% NEQ 0 echo 0
