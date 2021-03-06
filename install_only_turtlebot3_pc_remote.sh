#!/bin/sh
# Laurent LEQUIEVRE
# Research Engineer, CNRS (France)
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal

function replace-line-in-file() {
    local file="$1"
    local line_num="$2"
    local replacement="$3"

    # Escape backslash, forward slash and ampersand for use as a sed replacement.
    replacement_escaped=$( echo "$replacement" | sed -e 's/[\/&]/\\&/g' )

    sed -i "${line_num}s/.*/$replacement_escaped/" "$file"
}


#Install turtlebot3 dependent packages
cd ~
mkdir -p turtlebot3/catkin_ws/src
cd turtlebot3/catkin_ws/src
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git
cd ~/turtlebot3/catkin_ws && catkin_make

#Modify world file to be compatible with indigo and gazebo 2
if [ "$1" == "indigo" ]; then
 cd ~/turtlebot3/catkin_ws/src/turtlebot3_simulations/turtlebot3_gazebo/worlds
 replace-line-in-file "turtlebot3_world.world" 23 "<!--<use_dynamic_moi_rescaling>1</use_dynamic_moi_rescaling>-->"
 cd ~/turtlebot3/catkin_ws/src/turtlebot3/turtlebot3_description/urdf
 replace-line-in-file "turtlebot3_burger.gazebo.xacro" 59 "<!--<publishTf>true</publishTf>-->"
 cd ~/turtlebot3
else
 echo "Kinetic Version !"
fi

#Get some useful script files
cd ~/turtlebot3
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/send_stop.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_turtlebot3.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_local_turtlebot3.sh
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/simple_tests_on_turtlebot3.txt

#Create some useful alias to use in terminal window
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

#Update current terminal window with new alias added before
source ~/.bashrc
