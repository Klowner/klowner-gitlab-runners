FROM docker.klowner.com/mark/gitlab-test-runners:archlinux-latest
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
	zip      \
	&& cleanup-image

RUN usermod -aG wheel nobody && \
	echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

## Install GENie from AUR
RUN su docker -c "pacaur -S --noprogressbar --noedit --noconfirm genie-git"

# Install gcovr from AUR
RUN su docker -c "pacaur -S --noprogressbar --noedit --noconfirm gcovr"

# Install lcov from AUR
RUN su docker -c "pacaur -S --noprogressbar --noedit --noconfirm lcov"

ADD assets /etc/profile.d

VOLUME [ "/mnt/cache" ]
