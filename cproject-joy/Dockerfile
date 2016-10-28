FROM docker.klowner.com/mark/gitlab-test-runners:cproject-latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN apk add \
	mesa-dev \
	luajit \
	luajit-dev \
	blender-headless \
	physfs-dev

#COPY packages/ /tmp/packages
#COPY repositories /tmp/packages/
#RUN apk add \
		#--repositories-file /tmp/packages/repositories \
		#--allow-untrusted -U \
		#blender-headless && \
	#rm -rf /tmp/packages

RUN ln -s /usr/bin/blender-headless /usr/bin/blender
