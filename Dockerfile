# https://hub.docker.com/_/sentry/
FROM sentry:9.0-onbuild

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb-src http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main\ndeb-src http://security.debian.org jessie/updates main" > /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y libsasl2-dev python-dev libldap2-dev libssl-dev \
    # https://github.com/Banno/getsentry-ldap-auth
    && pip install sentry-ldap-auth