#!/bin/sh
# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# Research Engineer, CNRS (France)
# UMR 6602 - Institut Pascal
# PART 2 - BURGER

#Ip ros hostname and ros master uri and turtlebot3 model
export IP_RHN=10.42.0.5
export IP_RMU=10.42.0.1
export T_MODEL=burger

read -n1 -rsp $'Press any key to catkin_make turtlebot3 packages or Ctrl+C to exit...\n'

source /opt/ros/kinetic/setup.bash

cd ~
cd ~/catkin_ws && catkin_make -j1

#read -n1 -rsp $'Press any key to add .bashrc config or Ctrl+C to exit...\n'

#Add devel bash script in .bashrc file
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

#Add ROS_MASTER_URI and ROS_HOSTNAME
echo "export ROS_MASTER_URI=http://$IP_RMU:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=$IP_RHN" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=$T_MODEL" >> ~/.bashrc
echo "alias tb3_bringup='roslaunch turtlebot3_bringup turtlebot3_robot.launch'" >> ~/.bashrc

source ~/.bashrc

#read -n1 -rsp $'Press any key to do USB settings or Ctrl+C to exit...\n'

#USB settings
rosrun turtlebot3_bringup create_udev_rules

#read -n1 -rsp $'Press any key to do setup OpenCR Update or Ctrl+C to exit...\n'

#OpenCR setup
export OPENCR_PORT=/dev/ttyACM0
export OPENCR_MODEL=$T_MODEL

cd ~
mkdir ~/opencr_update
cd opencr_update
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS1/latest/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
cd ~

#Disable WIFI Power Save
#=======================
#A backup for security
sudo cp /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf.bak
#Replace 3 by 0
sudo sed -i -e 's/3/0/' /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
#Reboot NetworkManager
sudo systemctl restart NetworkManager

