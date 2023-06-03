FROM archlinux:latest
RUN ["pacman", "-Syu"]
WORKDIR /sardine

RUN echo 'Installing Base Packages'

RUN ["pacman", "-Sy", "pipewire"]
RUN ["pacman", "-Sy", "pipewire-alsa"]
RUN ["pacman", "-Sy", "pipewire-jack"]
RUN ["pacman", "-Sy", "wireplumber"]
RUN ["pacman", "-Sy", "pipewire-media-session"]
RUN ["pacman", "-Sy", "pipewire-pulse"]
RUN ["pacman", "-Sy", "python 3.11.3-1"]

RUN echo 'Setting up audio streams and connectivity'
RUN echo 'Installing SuperCollider'
RUN echo 'Installing SuperDirt & co'
RUN echo 'Installing Web Dependencies'
RUN echo 'Pulling & installing Sardine Package'
RUN echo 'Running Sardine Web'



