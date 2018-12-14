Laurent LEQUIEVRE
Research Engineer, CNRS (France)
Institut Pascal UMR6602
laurent.lequievre@uca.fr

http://emanual.robotis.com/docs/en/platform/openmanipulator/

sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-industrial-core

Install OpenManipulator ros packages :
====================================

cd ~/catkin_ws/src/
git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git
git clone https://github.com/ROBOTIS-GIT/dynamixel_workbench.git
git clone https://github.com/ROBOTIS-GIT/dynamixel_workbench_msgs.git
git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_simulations.git
cd ~/catkin_ws && catkin_make

Load OpenManipulator on RViz :
============================

roslaunch open_manipulator_description open_manipulator_rviz.launch

with a joint GUI :
================

roslaunch open_manipulator_description open_manipulator_rviz.launch use_gui:=true

To See value of topics :
======================
rqt
choose Plugin/Topics/Topic Monitor
check for example joint_states

or you can launch :
rostopic echo /joint_states

turtlebot3 with openmanipulator
===============================

http://emanual.robotis.com/docs/en/platform/turtlebot3/manipulation/

sudo apt-get install ros-kinetic-ros-controllers ros-kinetic-gazebo* ros-kinetic-moveit* ros-kinetic-dynamixel-sdk ros-kinetic-dynamixel-workbench-toolbox ros-kinetic-ar-track-alvar ros-kinetic-ar-track-alvar-msgs ros-kinetic-industrial-core

cd ~/catkin_ws/src/
git clone https://github.com/ROBOTIS-GIT/open_manipulator.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_msgs.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_perceptions.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_msgs.git
git clone https://github.com/ROBOTIS-GIT/open_manipulator_with_tb3_simulations.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/robotis_manipulator.git
cd ~/catkin_ws && catkin_make

For each package (git checkout kinetic-devel) -> to follow the 'kinetic-devel' git branch

Load Turtlebot3 + OpenManipulator + joint GUI on RViz :
=====================================================

export TURTLEBOT3_MODEL=waffle

roslaunch open_manipulator_with_tb3_description open_manipulator_with_tb3_rviz.launch

URDF :
=====

turtlebot 3 only :
turtlebot3/turtlebot3_description/urdf/turtlebot3_waffle.urdf.xacro


turtlebot3 3 with open manipulator :
open_manipulator_with_tb3/open_manipulator_with_tb3_description/urdf/open_manipulator_with_tb3_waffle.urdf

