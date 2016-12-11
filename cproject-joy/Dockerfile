FROM docker.klowner.com/mark/gitlab-test-runners:cproject-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN apk add --no-cache \
	mesa-dev \
	luajit \
	luajit-dev \
	blender-headless \
	physfs-dev \
	openal-soft-dev

RUN ln -s /usr/bin/blender-headless /usr/bin/blender
