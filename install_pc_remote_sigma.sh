#!/bin/sh
# Laurent LEQUIEVRE
# Research Engineer, CNRS (France)
# laurent.lequievre@uca.fr
# UMR 6602 - Institut Pascal


#Update and Upgrade Linux
sudo apt-get update --yes
sudo apt-get upgrade --yes

#Install ros kinetic
cd ~
mkdir install_ros_kinetic
cd install_ros_kinetic
wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_kinetic.sh && chmod 755 ./install_ros_kinetic.sh && bash ./install_ros_kinetic.sh

#Install ros dependent packages
sudo apt-get install --yes ros-kinetic-joy ros-kinetic-teleop-twist-joy ros-kinetic-teleop-twist-keyboard ros-kinetic-laser-proc ros-kinetic-rgbd-launch ros-kinetic-depthimage-to-laserscan ros-kinetic-rosserial-arduino ros-kinetic-rosserial-python ros-kinetic-rosserial-server ros-kinetic-rosserial-client ros-kinetic-rosserial-msgs ros-kinetic-amcl ros-kinetic-map-server ros-kinetic-move-base ros-kinetic-urdf ros-kinetic-xacro ros-kinetic-compressed-image-transport ros-kinetic-rqt-image-view ros-kinetic-gmapping ros-kinetic-navigation ros-kinetic-interactive-markers

#Install others ros packages
sudo apt-get install --yes ros-kinetic-moveit
sudo apt-get install --yes ros-kinetic-control-msgs
sudo apt-get install --yes ros-kinetic-rqt-controller-manager
sudo apt-get install --yes ros-kinetic-gazebo-ros-pkgs
sudo apt-get install --yes ros-kinetic-gazebo-plugins
sudo apt-get install --yes ros-kinetic-gazebo-ros-control
sudo apt-get install --yes ros-kinetic-ros-control
sudo apt-get install --yes ros-kinetic-joint-state-publisher
sudo apt-get install --yes ros-kinetic-joint-state-controller
sudo apt-get install --yes ros-kinetic-position-controllers

#Initialise rosdep
sudo rosdep init
rosdep update

#Install meshlab 
sudo apt-get install --yes meshlab

#Install tools for urdf
sudo apt-get install --yes liburdfdom-tools

#Install synaptic && git && gnome-session-flashback
sudo apt-get install --yes synaptic
sudo apt-get install --yes git
git config --global http.sslverify "false"
sudo apt-get install --yes gnome-session-flashback

#Install codeblocks
sudo apt-get install --yes codeblocks

#Install arduino
sudo apt-get install --yes arduino

#Create user: student, pwd: student, group: students
group_name="students"
user_name="student"
pwd_user="student"

echo "Create user: $user_name with group: $group_name with pwd: $pwd_user"
sudo addgroup $group_name
sudo useradd $user_name -s /bin/bash -m -G $group_name
echo $user_name:$pwd_user | sudo chpasswd
echo "Change user to : $user_name, please type pwd of $user_name ?"
#su $user_name

#Install student
echo "Please pwd of $user_name ?"
su - "$user_name" -c "source /opt/ros/kinetic/setup.bash; 
sudo rosdep init; rosdep update; echo \"source /opt/ros/kinetic/setup.bash\" >> ~/.bashrc; 
echo \"export ROS_MASTER_URI=http://localhost:11311\" >> ~/.bashrc; echo \"export ROS_HOSTNAME=localhost\" >> ~/.bashrc; source ~/.bashrc; cd ~; mkdir -p turtlebot3/catkin_ws/src; cd turtlebot3/catkin_ws/src; 
git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git; 
git clone https://github.com/ROBOTIS-GIT/turtlebot3.git; 
git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git; 
cd ~/turtlebot3/catkin_ws && catkin_make; cd ~/turtlebot3; 
source ~/turtlebot3/catkin_ws/devel/setup.bash;
rosdep update;
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/send_stop.sh; wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_turtlebot3.sh; 
wget https://raw.githubusercontent.com/lequievre/turtlebot3/master/set_ros_env_local_turtlebot3.sh; echo \"alias tb3_set_env_burger='source ~/turtlebot3/set_ros_env_turtlebot3.sh burger'\" >> ~/.bashrc; 
echo \"alias tb3_set_env_waffle='source ~/turtlebot3/set_ros_env_turtlebot3.sh waffle'\" >> ~/.bashrc; 
echo \"alias tb3_set_env_waffle_pi='source ~/turtlebot3/set_ros_env_turtlebot3.sh waffle_pi'\" >> ~/.bashrc; 
echo \"alias tb3_set_env_local_burger='source ~/turtlebot3/set_ros_env_local_turtlebot3.sh burger'\" >> ~/.bashrc; 
echo \"alias tb3_set_env_local_waffle='source ~/turtlebot3/set_ros_env_local_turtlebot3.sh waffle'\" >> ~/.bashrc; 
echo \"alias tb3_set_env_local_waffle_pi='source ~/turtlebot3/set_ros_env_local_turtlebot3.sh waffle_pi'\" >> ~/.bashrc;
echo \"alias tb3_fake='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_fake turtlebot3_fake.launch'\" >> ~/.bashrc;
echo \"alias tb3_gazebo='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_gazebo turtlebot3_world.launch'\" >> ~/.bashrc;
echo \"alias tb3_rviz_scans='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch'\" >> ~/.bashrc;
echo \"alias tb3_bringup='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_bringup turtlebot3_remote.launch'\" >> ~/.bashrc; 
echo \"alias tb3_rviz_model='source ~/turtlebot3/catkin_ws/devel/setup.bash && rosrun rviz rviz -d \`rospack find turtlebot3_description\`/rviz/model.rviz'\" >> ~/.bashrc; 
echo \"alias tb3_rviz_markers='source ~/turtlebot3/catkin_ws/devel/setup.bash && rosrun rviz rviz -d \`rospack find turtlebot3_example\`/rviz/turtlebot3_interactive.rviz'\" >> ~/.bashrc; 
echo \"alias tb3_markers='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_example interactive_markers.launch'\" >> ~/.bashrc; 
echo \"alias tb3_stop='source ~/turtlebot3/send_stop.sh'\" >> ~/.bashrc; 
echo \"alias tb3_teleop='source ~/turtlebot3/catkin_ws/devel/setup.bash && roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch'\" >> ~/.bashrc; 
echo \"alias tb3_print_env='echo \"ROS_MASTER_URI='\$ROS_MASTER_URI'\" && echo \"ROS_HOSTNAME='\$ROS_HOSTNAME'\" && echo \"TURTLEBOT3_MODEL='\$TURTLEBOT3_MODEL'\"'\" >> ~/.bashrc; source ~/.bashrc"
