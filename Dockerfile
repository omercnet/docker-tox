FROM ubuntu
MAINTAINER Omer Cohen <docker+tox@omer.io>

ARG PY2=2.7.14
ARG PY3=3.6.4

ENV PYENV_ROOT /pyenv
ENV PATH ${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y build-essential git curl libbz2-dev libssl-dev libreadline-dev libsqlite3-dev && \
    curl -sSL https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash

RUN echo eval "$(pyenv init -)" >> /root/.bashrc && \
    pyenv install ${PY2} && \
    pyenv install ${PY3} && \
    pyenv global ${PY2} ${PY3} && \
    pip install -U pip tox

WORKDIR /app
VOLUME /app

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

ENV CMD tox
CMD ["tox"]
