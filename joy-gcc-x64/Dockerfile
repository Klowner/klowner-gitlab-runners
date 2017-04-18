FROM docker.klowner.com/mark/gitlab-test-runners:archlinux-gcc-x64-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Sy --noconfirm cmake mercurial && cleanup-image

ADD install-libs.sh /usr/sbin/install-libs
RUN install-libs
