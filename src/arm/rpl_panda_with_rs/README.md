# rpl_panda_with_rs
RPL Panda with the RealSense sensor attached

Clone the repository and its dependencies:
```
mkdir -p ws_rpl/src && cd ws_rpl/src
sudo apt install ros-melodic-franka-ros ros-melodic-libfranka
git clone https://github.com/RPL-CS-UCL/rpl_panda_with_rs.git
git clone https://github.com/RPL-CS-UCL/realsense_gazebo_plugin.git
git clone https://github.com/RPL-CS-UCL/franka_ros.git
git clone https://github.com/RPL-CS-UCL/panda_moveit_config.git
git clone https://github.com/RPL-CS-UCL/panda_simulator.git
```

To run Panda with RealSense in Gazebo and Rviz:
```
catkin build -j 1
source devel/setup.bash
roslaunch rpl_panda_with_rs display.launch
```

Known dependencies:

```
moveit
image_proc
depth_image_proc
```

Alternatively, installing ROS packages through [this guide](https://github.com/RPL-CS-UCL/scripts) should be sufficient.
