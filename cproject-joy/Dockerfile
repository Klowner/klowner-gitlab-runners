FROM docker.klowner.com/mark/gitlab-test-runners:cproject-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN apk add --no-cache \
	blender-headless \
	genie \
	luajit \
	luajit-dev \
	mesa-dev \
	openal-soft-dev \
	physfs-dev

RUN ln -s /usr/bin/blender-headless /usr/bin/blender
