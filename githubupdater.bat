@echo off
cd /d C:\NOTPACKED\github-projects\vavooapi

REM JSON güncellendiyse pushla
git status --porcelain > temp.txt
if %ERRORLEVEL% NEQ 0 exit

for %%A in (temp.txt) do set SIZE=%%~zA
if %SIZE%==0 (
    echo Degisiklik yok, cikiliyor.
    exit
)

git add ch.json
git commit -m "auto update json"
git push

del temp.txt
pause