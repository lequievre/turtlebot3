#!/bin/sh
# Laurent LEQUIEVRE
# Research Engineer, CNRS (France)
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal


#Install turtlebot3 dependent packages
cd ~
mkdir -p turtlebot3/catkin_ws/src
cd turtlebot3/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/turtlebot3/catkin_ws && catkin_make

cd ~/turtlebot3
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/send_stop.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_turtlebot3.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_local_turtlebot3.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/simple_tests_on_turtlebot3.txt

echo "alias tb3_set_env_burger='source ~/turtlebot3/set_ros_env_turtlebot3.sh burger'" >> ~/.bashrc
echo "alias tb3_set_env_waffle='source ~/turtlebot3/set_ros_env_turtlebot3.sh waffle'" >> ~/.bashrc
echo "alias tb3_set_env_local_burger='source ~/turtlebot3/set_ros_env_local_turtlebot3.sh burger'" >> ~/.bashrc
echo "alias tb3_set_env_local_waffle='source ~/turtlebot3/set_ros_env_local_turtlebot3.sh waffle'" >> ~/.bashrc
echo "alias tb3_bringup='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_bringup turtlebot3_remote.launch'" >> ~/.bashrc
echo "alias tb3_rviz_model='source ~/turtlebot3/catkin_ws/devel/setup.bash && rosrun rviz rviz -d \`rospack find turtlebot3_description\`/rviz/model.rviz'" >> ~/.bashrc
echo "alias tb3_rviz_markers='source ~/turtlebot3/catkin_ws/devel/setup.bash && rosrun rviz rviz -d \`rospack find turtlebot3_example\`/rviz/turtlebot3_interactive.rviz'" >> ~/.bashrc
echo "alias tb3_markers='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_example interactive_markers.launch'" >> ~/.bashrc
echo "alias tb3_stop='source ~/turtlebot3/send_stop.sh'" >> ~/.bashrc
echo "alias tb3_teleop='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'" >> ~/.bashrc
echo "alias tb3_print_env='echo \"ROS_MASTER_URI=\$ROS_MASTER_URI\" && echo \"ROS_HOSTNAME=\$ROS_HOSTNAME\" && echo \"TURTLEBOT3_MODEL=\$TURTLEBOT3_MODEL\"'" >> ~/.bashrc

source ~/.bashrc
