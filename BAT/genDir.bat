@rem 
@echo off

rem 開発用リポジトリの，ドキュメント側のフォルダ構造のひな型を，自動的に作成するバッチ


rem このバッチが存在するフォルダをカレントに
pushd %0\..

rem 本当は最初に rmdir /S . で該当フォルダ内のクリーンアップをしたいが，
rem フォルダ内を全削除すると .svn ディレクトリも失われるし，
rem このバッチ自体も削除されるので処理が続かない。:-(


call :ROUTINE_SETUP_ONE_DIR "01_test01" "test001,test002"
call :ROUTINE_SETUP_ONE_DIR "02_test02" "test001,test002,test003,test004"
call :ROUTINE_SETUP_ONE_DIR "03_test03" "test001,test002,test003,test005"
call :ROUTINE_SETUP_ONE_DIR "04_test04" "test001,test002"
call :ROUTINE_SETUP_ONE_DIR "05_test05" "test001,test002,test003,test004,test005"
call :ROUTINE_SETUP_ONE_DIR "06_test06" "test001,test002,test003,test005,test006"
call :ROUTINE_SETUP_ONE_DIR "07_test07" "test001,test002,test003"
call :ROUTINE_SETUP_ONE_DIR "08_test08" "test001,test002,test003,test004"
call :ROUTINE_SETUP_ONE_DIR "09_test09" "test001,test002,test003,test004"
call :ROUTINE_SETUP_ONE_DIR "10_test10" "test001,test002"
call :ROUTINE_SETUP_ONE_DIR "99_test11" "test001,test002"


rem 終了処理
echo フォルダ構造の作成が完了しました。
pause
tree /f

echo このバッチを削除せず，残しておきますか？
  rem @see http://language-and-engineering.hatenablog.jp/entry/20081208/1228708657
set userkey=
set /p userkey=残す (Enter) / 削除する (n + Enter)
if not '%userkey%'=='' set userkey=%userkey:~0,1%
if '%userkey%'=='n' goto LABEL_DELETE_THIS_BAT
goto LABEL_QUIT


:LABEL_DELETE_THIS_BAT
del /Q %0


:LABEL_QUIT
pause
exit /b
  rem /bオプションが無いと，呼び出し元のコマプロのウィンドウ自体を終了させてしまう。
  rem @see http://www.ne.jp/asahi/hishidama/home/tech/windows/bat.html#%E6%88%BB%E3%82%8A%E5%80%A4



rem --------------------- サブルーチン ---------------------


rem １フォルダ作成用のルーチン
:ROUTINE_SETUP_ONE_DIR

  rem ルーチンの引数を取得
  setlocal
  set DIR_NAME=%1
  set SUBDIR_LIST=%2
    rem ※サブルーチン中でsetlocalすれば，
    rem   呼び出し元に影響なくローカル変数を使える
    rem   http://language-and-engineering.hatenablog.jp/entry/20111030/p1

  rem 上位フォルダ作成
  mkdir %DIR_NAME%
  
  rem 下位フォルダを作成
  cd %DIR_NAME%
  for /F "delims=, tokens=1,2,3,4,5" %%i in ( %SUBDIR_LIST% ) do (
      rem @see http://language-and-engineering.hatenablog.jp/entry/20100819/p1
    call :ROUTINE_CREATE_SUBDIR "01_", "%%i"
    call :ROUTINE_CREATE_SUBDIR "02_", "%%j"
    call :ROUTINE_CREATE_SUBDIR "03_", "%%k"
    call :ROUTINE_CREATE_SUBDIR "04_", "%%l"
    call :ROUTINE_CREATE_SUBDIR "05_", "%%m"
    
    rem TODO: 数を増やしたい場合はここを追記
  )
  
  cd ..\

  rem ルーチン終了
  exit /b


rem カレントフォルダにサブフォルダと空ファイルを作成するルーチン
:ROUTINE_CREATE_SUBDIR

  rem ルーチンの引数を取得
  setlocal
  set SUBDIR_PREFIX=%1
  set SUBDIR_BASENAME=%2
  set TEMP_FILE_NAME=TODO
  set SUBDIR_NAME=%SUBDIR_PREFIX%%SUBDIR_BASENAME%

  if "%SUBDIR_BASENAME%"=="""" (
    rem なし
  ) else (
    rem サブディレクトリを作成
    mkdir %SUBDIR_NAME%
    
    rem 空ファイルを作成
    cd    %SUBDIR_NAME%
    type nul > %TEMP_FILE_NAME%
      rem @see http://text.readalittle.net/article.php?id=244
    cd ..\
  )
  
  exit /b