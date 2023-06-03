FROM archlinux:latest
RUN ["pacman", "-Syu", "--noconfirm"]
WORKDIR /sardine

RUN echo 'Installing Base Packages'

RUN ["pacman", "-Sy", "pipewire", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-alsa", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-jack", "--noconfirm"]
RUN ["pacman", "-Sy", "wireplumber", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-media-session", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-pulse", "--noconfirm"]
RUN ["pacman", "-Sy", "python 3.11.3-1", "--noconfirm"]

RUN echo 'Setting up audio streams and connectivity'
RUN echo 'Installing SuperCollider, SuperDirt & co'

RUN ["pacman", "-Sy", "supercollider", "--noconfirm"]
RUN ["pacman", "-Sy", "sc3-plugins", "--noconfirm"]

RUN echo 'Installing Web Dependencies'



RUN echo 'Pulling & installing Sardine Package'
RUN echo 'Running Sardine Web'



