FROM golang:alpine3.14

# 设置go编译环境
ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn
RUN go env

# endregion

LABEL maintainer="gcdd1993 <gcwm99@gmail.com>"

# 安装必要
RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk add --no-cache --virtual .build-deps bash git build-base

WORKDIR /app
RUN set -eux; \
    cd /app \
    && git clone https://ghproxy.com/https://github.com/cdle/sillyGirl.git

COPY dev.go /app/sillyGirl/dev.go

RUN set -eux; \
    cd /app/sillyGirl \
    && cd develop \
    && git clone https://ghproxy.com/https://github.com/ufuckee/jd_cookie \
    && cd /app/sillyGirl \
    && go build \
    && chmod 777 sillyGirl

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# 青龙默认端口
EXPOSE 8080

VOLUME /app/xdd-plus

ENTRYPOINT ["docker-entrypoint.sh"]