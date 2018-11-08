#!/bin/sh

# Laurent LEQUIEVRE
# laurent.lequievre@uca.fr
# Research Engineer, CNRS (France)
# UMR 6602 - Institut Pascal

# Ip address of PC Laurent -> 192.168.0.1

export ROS_MASTER_URI=http://192.168.0.1:11311
export ROS_HOSTNAME=192.168.0.1
export TURTLEBOT3_MODEL=$1

source ~/turtlebot3/catkin_ws/devel/setup.bash

