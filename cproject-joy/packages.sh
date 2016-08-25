#!/bin/sh
ALPINE_DEV_ENV=alpine-mark
BUILD_DIR=${PWD}/build
#PACKAGES="ilmbase openexr opensubdiv blender"
PACKAGES="blender"

echo "args: $1"
alpine_env() {
	docker run --privileged --rm -it \
		--user mark \
		-v ${PWD}/.abuild:/home/mark/.abuild \
		-v ${PWD}/packages:/home/mark/packages \
		-v ${PWD}/packages.sh:/home/mark/packages.sh \
		-v /tmp/ccache:/tmp/ccache \
		-e CCACHE_DIR=/tmp/ccache \
		-e CCACHE_PATH=/usr/bin \
		$ALPINE_DEV_ENV ./packages.sh build
}

github_get() {
	for url in $@; do
		curl https://raw.githubusercontent.com/Klowner/aports${url} -o ${url##*/}
	done
}

prep() {
	mkdir -p ${BUILD_DIR}/$1 && cd ${BUILD_DIR}/$1
}

build_ilmbase() {
	prep ilmbase
	github_get \
		/testing/ilmbase/testing/ilmbase/APKBUILD
	abuild -r
}

build_openexr() {
	prep openexr
	github_get \
		/testing/openexr/testing/openexr/APKBUILD
	abuild -r
}

build_opensubdiv() {
	prep opensubdiv
	github_get \
		/klowner/opensubdiv/testing/opensubdiv/APKBUILD
	abuild -r
}


build_blender() {
	prep blender
	github_get \
		/klowner/blender/testing/blender/APKBUILD \
		/klowner/blender/testing/blender/blender-2.77a-musl.patch
	abuild -r
}

if [ "$1" == "build" ]; then
	if [[ ! -d "${HOME}/.abuild" ]]; then
		abuild-keygen -a
	fi

	sudo sh -c "echo "${HOME}/packages/build/testing" >> /etc/apk/repositories"
	sudo cp "${HOME}"/.abuild/*.pub /etc/apk/keys/
	sudo apk update

	for package in $PACKAGES; do
		echo "package! $package"
		build_${package}
	done
else
	echo "launching docker"
	alpine_env
fi
