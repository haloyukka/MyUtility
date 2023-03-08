@echo off

echo %date%
echo %time%

REM 日付（年・月・日）を取得
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%

REM 時刻（時・分・秒）を取得
set time2=%time: =0%

set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%

REM ファイル名に日時の文字列を追加
set filename=%yyyy%-%mm%%dd%-%hh%%mn%%ss%

echo test >> log_%filename%.txt
