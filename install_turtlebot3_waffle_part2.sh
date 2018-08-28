#!/bin/sh
# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal
# PART 2

#Ip ros hostname and ros master uri and turtlebot3 model
export IP_RHN=10.42.0.5
export IP_RMU=10.42.0.1
export T_MODEL=waffle

read -n1 -rsp $'Press any key to catkin_make turtlebot3 packages or Ctrl+C to exit...\n'

cd ~
cd ~/catkin_ws && catkin_make -j2

#Load firmware video for realsense camera
sudo modprobe uvcvideo

#read -n1 -rsp $'Press any key to add .bashrc config or Ctrl+C to exit...\n'

#Add devel bash script in .bashrc file
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

#Add ROS_MASTER_URI and ROS_HOSTNAME
echo "export ROS_MASTER_URI=http://$IP_RMU:11311" >> ~/.bashrc
echo "export ROS_HOST_NAME=$IP_RHN" >> ~/.bashrc
echo "export TURTLEBOT3_MODEL=$T_MODEL" >> ~/.bashrc
echo "alias tb3_bringup='roslaunch turtlebot3_bringup turtlebot3_robot.launch'" >> ~/.bashrc
echo "alias tb3_r200_default='roslaunch realsense_camera r200_nodelet_default.launch'" >> ~/.bashrc

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
wget https://github.com/ROBOTIS-GIT/OpenCR/raw/develop/arduino/opencr_release/shell_update/opencr_update.tar.bz2 && tar -xvf opencr_update.tar.bz2 && cd ./opencr_update && ./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr && cd ..
cd ~


