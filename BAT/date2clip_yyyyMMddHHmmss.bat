set time_tmp=%time: =0%
set delimiter1= 
set delimiter2=-
set delimiter3=:

REM yyyymmddhhmmss
REM set now=%date:/=%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
set now=%date:~0,4%%date:~5,2%%date:~8,2%%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%

echo %now%|clip
