#!/bin/sh
# Yoann RATAO
# yoann.ratao@uca.fr
# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal

#Update and Upgrade Linux
sudo apt-get update
sudo apt-get upgrade

#Install ros kinetic
cd ~
mkdir install_ros_kinetic
cd install_ros_kinetic
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh

#Install ros dependent packages
sudo apt-get install ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers

#Install others ros packages
sudo apt-get install ros-kinetic-moveit
sudo apt-get install ros-kinetic-control-msgs
sudo apt-get install ros-kinetic-rqt-controller-manager
sudo apt-get install ros-kinetic-gazebo-ros-pkgs
sudo apt-get install ros-kinetic-gazebo-plugins
sudo apt-get install ros-kinetic-gazebo-ros-control
sudo apt-get install ros-kinetic-ros-control
sudo apt-get install ros-kinetic-joint-state-publisher
sudo apt-get install ros-kinetic-joint-state-controller
sudo apt-get install ros-kinetic-position-controllers

#Initialise rosdep
sudo rosdep init
rosdep update

#Install meshlab 
sudo apt-get install meshlab

#Install tools for urdf
sudo apt-get install liburdfdom-tools

#Install synaptic && git && gnome-session-flashback
sudo apt-get install synaptic
sudo apt-get install git
git config --global http.sslverify "false"
sudo apt-get install gnome-session-flashback

#Install turtlebot3 dependent packages
cd ~
mkdir -p catkin_ws/src
cd catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/catkin_ws && catkin_make


