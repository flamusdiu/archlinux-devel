FROM archimg/base-devel

RUN pacman -Syu --needed --noconfirm git fish openssh pacman-contrib
RUN useradd -ms /bin/fish arch \
	&& echo "arch ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER arch
WORKDIR /home/arch

RUN git clone https://aur.archlinux.org/aura-bin.git  \
	&& cd aura-bin \
	&& makepkg -irs --noconfirm
