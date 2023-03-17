@echo off

if "%~1"=="" (
    echo Error: Argument is missing.
    exit /b 1
)


echo ---Generate Python venv---
python -m venv %1
echo ---Complete---

REM venv環境を起動
%1\Scripts\activate.bat

REM 仮想環境のパッケージ情報を書き出して共有
REM pip freeze > requirements.txt

REM 仮想環境を抜ける
REM deactivate
