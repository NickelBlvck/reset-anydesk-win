@echo off
chcp 65001 >nul
:: AnyDesk reset script
:: Запускать от имени администратора

echo Русская Медицинская компания
echo https://rusmedcompany.ru/

taskkill /F /IM anydesk.exe >nul 2>&1

if exist "C:\ProgramData\AnyDesk" (
    rmdir /S /Q "C:\ProgramData\AnyDesk"
)

set "APPDATA_PATH=%appdata%\AnyDesk"
set "DESKTOP_PATH=%userprofile%\Desktop"

if exist "%APPDATA_PATH%\user.conf" (
    copy /Y "%APPDATA_PATH%\user.conf" "%DESKTOP_PATH%\user.conf.bak"
)

if exist "%APPDATA_PATH%" (
    rmdir /S /Q "%APPDATA_PATH%"
)

mkdir "%APPDATA_PATH%"

if exist "%DESKTOP_PATH%\user.conf.bak" (
    copy /Y "%DESKTOP_PATH%\user.conf.bak" "%APPDATA_PATH%\user.conf"
)

echo Готово. Теперь можно запускать AnyDesk заново
pause
