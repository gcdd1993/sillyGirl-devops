#!/bin/bash
set -e

XDD_WORKDIR=/app/sillyGirl

# 启动xdd
echo -e "=================== 启动傻妞机器人（第一次可能启动较慢） ==================="
cd "$XDD_WORKDIR" && ./sillyGirl -d

echo -e "=================== 启动完毕，如果第一次配置机器人，请手动以前台模式启动 ==================="
crond -f >/dev/null
exec "$@"
