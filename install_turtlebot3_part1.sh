#!/bin/sh
# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal
# PART 1

#read -n1 -rsp $'Press any key to update and upgrade linux or Ctrl+C to exit...\n'

# Update and Upgrade Linux
sudo apt-get update
sudo apt-get upgrade

#read -n1 -rsp $'Press any key to install synaptic and git or Ctrl+C to exit...\n'

# Install synaptic
sudo apt-get install synaptic
sudo apt-get install git
sudo apt-get install gnome-session-flashback

#read -n1 -rsp $'Press any key to install ssh or Ctrl+C to exit...\n'

#Install ssh

#Install linux package
sudo apt-get install openssh-server
#Activate service ssh
sudo systemctl enable ssh.service
#Verify sate of ssh service
sudo systemctl status ssh.service

#read -n1 -rsp $'Press any key to install ros kinetic or Ctrl+C to exit...\n'

#Install ros kinetic
cd ~
mkdir install_ros_kinetic
cd install_ros_kinetic
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh

#read -n1 -rsp $'Press any key to install ros kinetic dependent packages or Ctrl+C to exit...\n'

# Install ros kinetic dependent packages
sudo apt-get install ros-kinetic-rosserial-python ros-kinetic-tf

#read -n1 -rsp $'Press any key to install camera RealSense packages or Ctrl+C to exit...\n'

#Install RealSense packages
sudo apt-get install linux-headers-generic
sudo apt-get install ros-kinetic-librealsense

#ros dep update
rosdep update

#read -n1 -rsp $'Press any key to install turtlebot3 dependent packages or Ctrl+C to exit...\n'

#Install turtlebot3 dependent packages
cd ~
mkdir -p catkin_ws/src
cd catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/hls_lfcd_lds_driver.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
cd turtlebot3
sudo rm -r turtlebot3_description/ turtlebot3_teleop/ turtlebot3_navigation/ turtlebot3_slam/ turtlebot3_example/
cd ..
git clone https://github.com/intel-ros/realsense.git
cd realsense
git checkout 1.8.0

read -n1 -rsp $'Press any key to REBOOT or Ctrl+C to exit...\n'

sudo reboot



