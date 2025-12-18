FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV ROS2_WS=/workspaces/ros2_ws

RUN apt update && apt install -y \
    curl gnupg2 lsb-release \
    build-essential \
    git \
    python3-pip \
    locales \
    software-properties-common \
    xvfb \
    x11vnc \
    fluxbox \
    tigervnc-viewer \
    && locale-gen en_US.UTF-8

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key \
    -o /usr/share/keyrings/ros-archive-keyring.gpg

RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" \
    > /etc/apt/sources.list.d/ros2.list

RUN apt update && apt install -y \
    ros-humble-desktop \
    ros-dev-tools \
    python3-colcon-common-extensions \
    python3-flake8 \
    python3-pytest-cov \
    python3-setuptools \
    python3-vcstool \
    wget \
    python3-argcomplete \
    python3-rosdep

RUN if [ ! -f /etc/ros/rosdep/sources.list.d/20-default.list ]; then rosdep init; fi \
    && rosdep update

COPY ros2_env.bash /etc/profile.d/ros2_env.bash

RUN echo "source /etc/profile.d/ros2_env.bash" >> /root/.bashrc

WORKDIR ${ROS2_WS}

COPY scripts/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
