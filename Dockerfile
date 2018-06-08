FROM pritunl/archlinux:latest

RUN pacman -Syu --needed --noconfirm base-devel git fish nano openssh vi pacman-contrib
RUN useradd -ms /bin/fish arch \
	&& echo "arch ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER arch
WORKDIR /home/arch

RUN git clone https://aur.archlinux.org/aura-bin.git  \
	&& cd aura-bin \
	&& makepkg -irs --noconfirm