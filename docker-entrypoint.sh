#!/bin/bash
set -e

SILLY_GIRL_WORKDIR=/app/sillyGirl

if [[ ! -f "$XDD_WORKDIR/sillyGirl" ]]; then
  echo -e "=================== 开始下载傻妞机器人 ==================="
  cd /app
  git clone $REPO_URL
  cd sillyGirl
  wget https://ghproxy.com/https://raw.githubusercontent.com/gcdd1993/sillyGirl-devops/master/dev.go
  cd develop
  git clone https://ghproxy.com/https://github.com/ufuckee/jd_cookie
  echo -e "=================== 傻妞机器人下载完毕，开始进行编译 ==================="
  cd $SILLY_GIRL_WORKDIR
  go build
  chmod 777 sillyGirl
  echo -e "=================== 傻妞机器人编译完毕 ==================="
fi

# 启动傻妞机器人
echo -e "=================== 启动傻妞机器人（第一次可能启动较慢） ==================="
cd "$SILLY_GIRL_WORKDIR" && ./sillyGirl -d
echo -e "=================== 启动完毕，如果第一次配置机器人，请手动以前台模式启动 ==================="

crond -f >/dev/null
exec "$@"
