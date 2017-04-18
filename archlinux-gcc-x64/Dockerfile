FROM greyltc/archlinux:latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Sy --noconfirm \
	binutils \
	fakeroot \
	gcc      \
	git      \
	make     \
	ninja    \
	openssh  \
	sudo     \
	&& cleanup-image


# Build and install GENie
RUN mkdir -p /tmp/genie && \
	cd /tmp/genie && \
	chown nobody /tmp/genie && \
	curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=genie-git" > PKGBUILD && \
	su - nobody -s /bin/sh -c "cd /tmp/genie && makepkg -s" && \
	pacman -U --noconfirm *pkg.tar.xz && \
	cd / && rm -rf /tmp/genie && \
	which genie
