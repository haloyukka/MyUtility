set time_tmp=%time: =0%
set delimiter1= 
set delimiter2=-
set delimiter3=:

REM yyyymmddhhmmss
REM set now=%date:/=%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
set now=%date:~0,4%%delimiter2%%date:~5,2%%delimiter2%%date:~8,2%%delimiter1%%time_tmp:~0,2%%delimiter3%%time_tmp:~3,2%%delimiter3%%time_tmp:~6,2%

echo %now% | clip
