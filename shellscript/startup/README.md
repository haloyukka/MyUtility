# 【CentOS】起動時にシェルを自動実行する方法<br>

## systemdのserviceを作成する
systemdのserviceを作成することで、システム起動時に指定したコマンドやシェルを自動的に事項することができます。<br>

1. /etc/systemd/system/以下にシェルを実行するための.serviceファイルを作成する。<br>
例：myshell.service<br>

```
[Unit]
Type=simple
Description=my-script shell

[Service]
ExecStart=/bin/bash /data/starting.sh

[Install]
WantedBy=multi-user.target
```
Type：プロセスの起動タイプ<br>
Description：サービスの説明<br>
After：自分が起動する前に起動していて欲しいサービスを記述する（今回は省略）例：After=postgresql.service<br>
ExecStart：実行したいプログラム<br>
WantedBy：どのターゲットで動かすか（マルチユーザー）<br>

2. ・ `systemctl enable myshell.service`で、システム起動時に自動的にmyshell.serviceを実行するように設定します。

3. ・/path/to/myshell.shにシェルスクリプトを記述すると、シェルスクリプトが自動的に実行されます。<br>
