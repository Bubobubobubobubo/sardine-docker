FROM archlinux:latest
RUN ["pacman", "-Syu", "--noconfirm"]
WORKDIR /app

RUN echo 'Installing Base Packages'

RUN ["pacman", "-Sy", "git", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-alsa", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-jack", "--noconfirm"]
# RUN ["pacman", "-Sy", "wireplumber", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-media-session", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-pulse", "--noconfirm"]
RUN ["pacman", "-Sy", "python", "--noconfirm"]
RUN ["pacman", "-Sy", "python-pip", "--noconfirm"]


RUN echo 'Setting up audio streams and connectivity'
RUN echo 'Installing SuperCollider, SuperDirt & co'

RUN ["pacman", "-Sy", "supercollider", "--noconfirm"]
RUN ["pacman", "-Sy", "sc3-plugins", "--noconfirm"]

RUN echo 'Installing Web Dependencies'

RUN ["pacman", "-Sy", "nodejs", "--noconfirm"]
RUN ["pacman", "-Sy", "npm", "--noconfirm"]
RUN ["npm", "install", "yarn"]

RUN echo 'Pulling & installing Sardine Package'

RUN ["git", "clone", "https://github.com/Bubobubobubobubo/sardine"]
WORKDIR /app/sardine/sardine/client
RUN ["yarn", "install"]
WORKDIR /app/sardine
RUN ["python","-m","pip","install","--find-links", "https://thegamecracks.github.io/python-rtmidi-wheels/", "."]

RUN echo 'Running Sardine Web'

RUN ["sardine", "web"]
