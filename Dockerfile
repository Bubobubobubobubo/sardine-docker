FROM --platform=linux/amd64 archlinux:latest
RUN ["pacman", "-Syu", "--noconfirm"]
WORKDIR /app

RUN echo '== Installing Base Packages =='

RUN ["pacman", "-Sy", "git", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-alsa", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-jack", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-media-session", "--noconfirm"]
RUN ["pacman", "-Sy", "pipewire-pulse", "--noconfirm"]
RUN ["pacman", "-Sy", "python", "--noconfirm"]
RUN ["pacman", "-Sy", "python-pip", "--noconfirm"]


RUN echo '== Setting up audio streams and connectivity =='

# RUN ["modprobe", "snd_virmidi"]
# RUN ["su"]
# RUN ["snd-virmidi",">>", "/etc/modules"]

RUN echo '== Installing SuperCollider, SuperDirt & co =='

RUN ["pacman", "-Sy", "supercollider", "--noconfirm"]
RUN ["pacman", "-Sy", "sc3-plugins", "--noconfirm"]

RUN echo '== Installing Web Dependencies =='

RUN ["pacman", "-Sy", "nodejs", "--noconfirm"]
RUN ["pacman", "-Sy", "npm", "--noconfirm"]
RUN ["npm", "install", "-g", "yarn"]
RUN ["npm", "install", "-g", "vite"]
RUN ["npm","config", "set", "unsafe-perm", "true"]

RUN echo '== Pulling & installing Sardine Package =='

RUN ["git", "clone", "https://github.com/Bubobubobubobubo/sardine"]
WORKDIR /app/sardine/sardine/client
RUN ["yarn", "install"]
RUN ["yarn", "run", "build"]
WORKDIR /app/sardine
RUN ["python","-m","pip","install","--find-links", "https://thegamecracks.github.io/python-rtmidi-wheels/", "."]

RUN echo '== Running Sardine Web =='

EXPOSE 57120/udp
EXPOSE 57110/udp
EXPOSE 8000/tcp
RUN ["sardine", "web", "--port", "8080"]
