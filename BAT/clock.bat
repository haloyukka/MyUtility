@echo off

REM titleコマンドでコマンドプロンプトのタイトル表示を変更する
Title Clock

REM modeコマンドでウィンドウサイズを変更する（30x7）
@mode con cols=30 lines=7

REM batファイル実行中にコマンドの画面の色を変える（03 = 水色）
color 03

REM batファイルサブルーチン（関数）の記法「:サブルーチン名」
: main

REM 画面の表示をクリアする
cls

REM 空白を表示する場合は「echo.」
echo.

REM ログに時間情報を入れる
echo Time: %time%

REM 空白を表示する場合は「echo.」
echo.

REM ログに日付情報を入れる
echo Date: %Date%
REM 空白を表示する場合は「echo.」
echo.

REM リダイレクト
ping -n 2 0.0.0.0>nul

REM GOGO コマンドを使用すると指定したラベルの位置へ制御を移す
goto main