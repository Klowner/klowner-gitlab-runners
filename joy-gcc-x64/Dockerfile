FROM docker.klowner.com/mark/gitlab-test-runners:archlinux-gcc-x64-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Sy --noconfirm \
	cmake \
	lua \
	mercurial \
	mesa \
	libpulse \
	&& cleanup-image

ADD install-libs.sh /usr/sbin/install-libs
RUN install-libs

ENV LUAJIT_DIR /3rdparty/luajit-2.0
ENV OPENAL_DIR /3rdparty/openal-soft
ENV PHYSFS_DIR /3rdparty/physfs
