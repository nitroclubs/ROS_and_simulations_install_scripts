#!/bin/bash

echo "Install Dependent ROS 1 Packages"

sudo apt install -y ros-melodic-joy ros-melodic-teleop-twist-joy \
  ros-melodic-teleop-twist-keyboard ros-melodic-laser-proc \
  ros-melodic-rgbd-launch ros-melodic-depthimage-to-laserscan \
  ros-melodic-rosserial-arduino ros-melodic-rosserial-python \
  ros-melodic-rosserial-server ros-melodic-rosserial-client \
  ros-melodic-rosserial-msgs ros-melodic-amcl ros-melodic-map-server \
  ros-melodic-move-base ros-melodic-urdf ros-melodic-xacro \
  ros-melodic-compressed-image-transport ros-melodic-rqt* \
  ros-melodic-gmapping ros-melodic-navigation ros-melodic-interactive-markers

echo "Install TurtleBot3 Packages in catkin_ws"
name_catkin_workspace=${name_catkin_workspace:="catkin_ws"}

cd
cd $HOME/$name_catkin_workspace/src
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone -b melodic-devel https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd $HOME/$name_catkin_workspace
catkin_make

echo "[Complete!!!]"
exit 0


