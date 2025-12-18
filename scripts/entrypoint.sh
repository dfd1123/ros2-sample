#!/usr/bin/env bash
set -e

# X virtual framebuffer
Xvfb :0 -screen 0 1280x800x24 &
export DISPLAY=:0

mkdir -p "$HOME/.fluxbox"

# window manager (optional but recommended)
fluxbox &

# VNC server
x11vnc \
  -display :0 \
  -forever \
  -listen 0.0.0.0 \
  -nopw \
  -noipv6 \
  -noxdamage &

source /opt/ros/humble/setup.bash

mkdir -p "$ROS2_WS/src"

# # tiago_simulation이 없으면 1회 클론
# if [ ! -d "$ROS2_WS/src/tiago_simulation" ]; then
#   git clone https://github.com/pal-robotics/tiago_simulation.git "$ROS2_WS/src/tiago_simulation"
# fi

# # install 폴더가 없으면 1회 의존성 설치 + 빌드
# if [ ! -f "$ROS2_WS/install/local_setup.bash" ]; then
#   rosdep update
#   rosdep install --from-paths "$ROS2_WS/src" -y --ignore-src --rosdistro humble
#   cd "$ROS2_WS"
#   colcon build --symlink-install
# fi


# 이후 CMD 실행
exec "$@"
