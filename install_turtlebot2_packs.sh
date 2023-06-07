#!/usr/bin/env sh

sudo apt update -y

echo "Install TurtleBot2 Packages in catkin_ws"
name_catkin_workspace=${name_catkin_workspace:="catkin_ws"}
cd
cd $HOME/$name_catkin_workspace/src

git clone https://github.com/turtlebot/turtlebot_simulator.git
git clone https://github.com/turtlebot/turtlebot.git
git clone https://github.com/turtlebot/turtlebot_apps.git
git clone https://github.com/turtlebot/turtlebot_msgs.git
git clone https://github.com/turtlebot/turtlebot_interactions.git

git clone https://github.com/toeklk/orocos-bayesian-filtering.git
cd orocos-bayesian-filtering/orocos_bfl/
./configure
make
sudo make install
cd ../
make
cd ../

git clone https://github.com/udacity/robot_pose_ekf
git clone https://github.com/ros-perception/depthimage_to_laserscan.git

git clone https://github.com/yujinrobot/kobuki_msgs.git
git clone https://github.com/yujinrobot/kobuki_desktop.git
cd kobuki_desktop/
rm -r kobuki_qtestsuite
cd -
git clone --single-branch --branch melodic https://github.com/yujinrobot/kobuki.git
mv kobuki/kobuki_description kobuki/kobuki_bumper2pc \
  kobuki/kobuki_node kobuki/kobuki_keyop \
  kobuki/kobuki_safety_controller ./

git clone https://github.com/yujinrobot/yujin_ocs.git
mv yujin_ocs/yocs_cmd_vel_mux yujin_ocs/yocs_controllers .
rm -rf yujin_ocs

cd $HOME/$name_catkin_workspace/
catkin_make

sudo apt-get install ros-melodic-kobuki-* -y
sudo apt-get install ros-melodic-ecl-streams -y
sudo apt-get install ros-melodic-yocs-velocity-smoother -y
sudo apt install -y ros-melodic-move-base* ros-melodic-map-server* ros-melodic-amcl* ros-melodic-navigation* ros-melodic-joy

cd $HOME/$name_catkin_workspace/
catkin_make

echo "[Complete!!!]"
exit 0

