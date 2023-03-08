@echo off
Set SERVER=<ホスト名 or IPアドレス>
Set USERNAME=<ユーザ名>
Set PASSWORD="<パスワード>"

Cmdkey /generic:TERMSRV/%SERVER% /user:%USERNAME% /pass:%PASSWORD%
Start mstsc /v:%SERVER%
Timeout 3
Cmdkey /delete:TERMSRV/%SERVER%