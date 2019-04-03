#依赖的镜像
FROM ubuntu:14.04
#镜像创建者的信息
MAINTAINER terwer "cbgtyw@gmail.com"
# 设置编码
ENV LANG C.UTF-8
# 设置时区
# ENV TZ Asia/Shanghai
ENV TZ CST-8

COPY ./sources.list /sources.list
# Use  vulomn replace follow script
# COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]