
source /opt/ros/humble/setup.bash

: "${ROS2_WS:?ROS2_WS is not set}"

if [ -f "$ROS2_WS/install/local_setup.bash" ]; then
  source "$ROS2_WS/install/local_setup.bash"
fi

# source ~/uros_ws/install/local_setup.bash

source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash
source /usr/share/vcstool-completion/vcs.bash
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root="$ROS2_WS"

# argcomplete for ros2 & colcon
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

# export ROS_NAMESPACE=robot1

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
# export RMW_IMPLEMENTATION=rmw_connext_cpp
# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
# export RMW_IMPLEMENTATION=rmw_gurumdds_cpp

# export RCUTILS_CONSOLE_OUTPUT_FORMAT='[{severity} {time}] [{name}]: {message} ({function_name}() at {file_name}:{line_number})'
export RCUTILS_CONSOLE_OUTPUT_FORMAT='[{severity}]: {message}'
export RCUTILS_COLORIZED_OUTPUT=1
export RCUTILS_LOGGING_USE_STDOUT=0
export RCUTILS_LOGGING_BUFFERED_STREAM=1

alias cw="cd $ROS2_WS"
alias cs="cd $ROS2_WS/src"
alias ccd='colcon_cd'

alias cb="cd $ROS2_WS && colcon build --symlink-install"
alias cbs='colcon build --symlink-install'
alias cbp='colcon build --symlink-install --packages-select'
alias cbu='colcon build --symlink-install --packages-up-to'
alias ct='colcon test'
alias ctp='colcon test --packages-select'
alias ctr='colcon test-result'

alias tl='ros2 topic list'
alias te='ros2 topic echo'
alias nl='ros2 node list'

alias killgazebo='killall -9 gazebo & killall -9 gzserver & killall -9 gzclient'

alias af='ament_flake8'
alias ac='ament_cpplint'

alias testpub='ros2 run demo_nodes_cpp talker'
alias testsub='ros2 run demo_nodes_cpp listener'
alias testpubimg='ros2 run image_tools cam2image'
alias testsubimg='ros2 run image_tools showimage'

alias di='rosdep install --from-paths src -y --ignore-src --os=ubuntu:jammy'

# export ROS_DOMAIN_ID=7