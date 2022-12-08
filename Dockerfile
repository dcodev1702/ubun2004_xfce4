FROM ubuntu:20.04

LABEL maintainer="Inspired from: YouTube - https://www.youtube.com/@NovaspiritTech"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -y && apt install -y -q build-essential python3-pip python3-dev net-tools git sudo xfce4 faenza-icon-theme bash xfce4-terminal firefox tigervnc-standalone-server tigervnc-xorg-extension tigervnc-viewer vim file tmux openssh-server mlocate \
    && python3 -m pip install --upgrade pip \
    && python3 -m pip install -U setuptools wheel \
    && addgroup --gid 1000 ubuntu \
    && adduser --system --home /home/ubuntu --shell /bin/bash  --uid 1000 --gid 1000 --disabled-password ubuntu \
    && adduser ubuntu ubuntu && echo "ubuntu:password" | chpasswd \
    && echo "root:password" | chpasswd \
    && usermod -aG sudo ubuntu \
    && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "sudo ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && git clone https://github.com/novnc/noVNC /opt/noVNC \
    && git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify \
    && ssh-keygen -A 


USER ubuntu
WORKDIR /home/ubuntu

RUN mkdir -p /home/ubuntu/.vnc \
    && mkdir -p /home/ubuntu/.ssh && chmod 0700 /home/ubuntu/.ssh \
    && echo -e "#!/bin/bash\nstartxfce4 &" > /home/ubuntu/.vnc/xstartup \
    && printf "password\npassword\n\n" | vncpasswd


COPY entry.sh /entry.sh
CMD [ "/bin/bash","/entry.sh" ]
