FROM greyltc/archlinux:latest
MAINTAINER Mark Riedesel <mark@klowner.com>

RUN pacman -Syu --noconfirm \
	binutils \
	bison    \
	ccache   \
	colorgcc \
	fakeroot \
	flex     \
	gcc      \
	git      \
	make     \
	ninja    \
	openssh  \
	openssl  \
	sudo     \
	&& cleanup-image

RUN usermod -aG wheel nobody && \
	echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Build and install GENie
RUN mkdir -p /tmp/genie && \
	cd /tmp/genie && \
	chown nobody /tmp/genie && \
	curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=genie-git" > PKGBUILD && \
	su - nobody -s /bin/sh -c "cd /tmp/genie && makepkg -si --noconfirm" && \
	cd / && rm -rf /tmp/genie && \
	which genie && \
	cleanup-image

# Build and install gcovr from AUR
RUN mkdir -p /tmp/gcovr && \
	cd /tmp/gcovr && \
	chown nobody /tmp/gcovr && \
	curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=gcovr" > PKGBUILD && \
	su - nobody -s /bin/sh -c "cd /tmp/gcovr && makepkg -si --noconfirm" && \
	cd / && rm -rf /tmp/gcovr && \
	which gcovr && \
	cleanup-image

ADD assets /etc/

VOLUME [ "/mnt/cache" ]
