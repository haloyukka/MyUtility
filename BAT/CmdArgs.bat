@echo off
if "%1" == "option1" (
    echo Option 1 selected.
    rem ここにOption 1の処理を記述
) else if "%1" == "option2" (
    echo Option 2 selected.
    rem ここにOption 2の処理を記述
) else if "%1" == "option3" (
    echo Option 3 selected.
    rem ここにOption 3の処理を記述
) else (
    echo Invalid option selected.
    rem ここに無効なオプションの処理を記述
)
