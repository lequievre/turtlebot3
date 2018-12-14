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





