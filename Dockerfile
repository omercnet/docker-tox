FROM alpine
MAINTAINER Omer Cohen <docker+tox@omer.io>

RUN apk --no-cache add python2 python3 && \
	wget -qO- https://bootstrap.pypa.io/get-pip.py | python2 && \
	pip install tox

WORKDIR /app
VOLUME /app

CMD ["tox"]
