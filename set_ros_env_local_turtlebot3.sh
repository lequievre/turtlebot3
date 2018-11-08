#!/bin/sh

# Laurent LEQUIEVRE
# Research Engineer, CNRS (France)
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal

export ROS_MASTER_URI=http://localhost:11311
export TURTLEBOT3_MODEL=$1

source ~/turtlebot3/catkin_ws/devel/setup.bash
