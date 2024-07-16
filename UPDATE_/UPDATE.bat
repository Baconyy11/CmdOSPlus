@echo off

:1
echo Downloading...

cd..
for /f "tokens=1,* delims=:" %%A in ('curl -ks https://api.github.com/repos/Baconyy33/cmdos/releases/latest ^| find "browser_download_url"') do (
    curl -kOL %%B >nul
)

