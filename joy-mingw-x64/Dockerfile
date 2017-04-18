FROM docker.klowner.com/mark/gitlab-test-runners:archlinux-mingw-x64-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Sy --noconfirm \
	lua \
	mercurial \
	unzip \
	&& cleanup-image

ADD install-libs.sh /usr/sbin/install-libs
RUN install-libs

ENV LUAJIT_DIR /3rdparty/luajit-2.0
ENV OPENAL_DIR /3rdparty/openal-soft-1.17.2-bin
ENV PHYSFS_DIR /3rdparty/physfs
