# 傻妞机器人一键部署

## 步骤

```bash
mkdir -p /data/sillyGirl
cd /data/sillyGirl
wget https://ghproxy.com/https://raw.githubusercontent.com/gcdd1993/sillyGirl-devops/master/docker-compose2.yml
# 如果只需要部署傻妞，可以使用https://ghproxy.com/https://raw.githubusercontent.com/gcdd1993/sillyGirl-devops/master/docker-compose.yml
docker-compose -f up docker-compose2.yml -d # 如果是docker-compose.yml,可以省略-f up docker-compose2.yml

# 查看日志
docker-compose logs -f 
# 停止
docker-compose down 
# 重启
docker-compose restart
```

## 配置机器人

> 这里跟之前不同，需要启动完毕在机器人一侧进行配置



