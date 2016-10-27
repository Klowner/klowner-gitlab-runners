FROM alpine:edge
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update \
	&& apk add \
		openssh-client \
		clang \
		cmake \
		make \
		g++ \
		gcc \
		git

RUN echo "http://alpine.klowner.com/extra" >> /etc/apk/repositories \
	&& wget http://alpine.klowner.com/mark@klowner.com-57a9ef6f.rsa.pub -P /etc/apk/keys \
	&& apk update

