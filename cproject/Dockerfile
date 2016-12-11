FROM alpine:edge
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --no-cache \
		clang \
		cmake \
		g++ \
		gcc \
		git \
		make \
		ninja \
		openssh-client

RUN echo "http://alpine.klowner.com/extra" >> /etc/apk/repositories \
	&& wget http://alpine.klowner.com/mark@klowner.com-57a9ef6f.rsa.pub -P /etc/apk/keys \
	&& apk update

