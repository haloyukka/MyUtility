#!/bin/bash

echo "starting..."
### ログファイル
log=/data/$(date '+%Y%m%d-%H%M%S').log

### 日時付きでログファイルへ流し込みます
exec &> >(awk '{print strftime("[%Y/%m/%d %H:%M:%S] "),$0 } { fflush() } ' >> $log)
