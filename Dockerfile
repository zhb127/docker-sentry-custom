# https://hub.docker.com/_/sentry/
FROM sentry:9.0-onbuild

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev \
    # https://github.com/Banno/getsentry-ldap-auth
    # 由于 sentry-ldap-auth 插件依赖其他 apt-get 软件包，而 sentry:9.0-onbuild 镜像没有提供安装 apt-get 软件包的能力，所以，无法通过 requirements.txt 方式来安装 sentry-ldap-auth 插件。
    && pip install sentry-ldap-auth