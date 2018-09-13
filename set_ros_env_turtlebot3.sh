#!/bin/sh

# Laurent LEQUIEVRE
# laurent.lequievre@univ-bpclermont.fr
# UMR 6602 - Institut Pascal

# Ip address of PC Laurent -> 10.42.0.1
# Ip address of burger donatello -> 10.42.0.3
# Ip address of waffle leonardo -> 10.42.0.4

export ROS_MASTER_URI=http://192.168.0.1:11311
export ROS_HOSTNAME=192.168.0.1
export TURTLEBOT3_MODEL=$1

source ~/turtlebot3/catkin_ws/devel/setup.bash

