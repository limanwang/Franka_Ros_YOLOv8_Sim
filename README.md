# Simulation for Franka Robot Visual Grasping
<img title="a title" alt="Alt text" src="/images/1.png">

# Requirements
Have been tested successfuly: Ubuntu20, Ros Noetic, Moveit1, YOLOv8

cd ~/yolov8_ros

`pip install -r requirement.txt`

## Some useful installation commands
```
sudo apt-get install ros-noetic-franka-description
sudo apt-get install ros-noetic-ros-control
sudo apt-get install ros-noetic-ros-controllers
sudo apt-get install ros-noetic-moveit
sudo apt-get install ros-noetic-camera-info-manager
```

# Launch Commands
Step 1. Launch the descriptions files for robot and scenes.

`roslaunch panda_description description_original.launch `


Step 2. You need to create the conda env first then activate it.
`conda activate yolov8`

Step 3. Launch the YOLO detection nodes and start detecting.
`roslaunch yolov8_ros yolo_v8.launch`

Step 4. Start the grasping process which will grasp one object then hand it to people.
`roslaunch grasp_demo grasp_start.launch`

# Transfer from Sim to Real
You just need to adjust the transform of the camera-to-panda_link8

Here it is: src/arm/panda_description/urdf/panda_with_rs.urdf.xacro

```
<!-- 设置相机外参 基于panda的第8link -->
<joint name="d435i_base_joint" type="fixed">
    <origin xyz="0.03 -0.03 0.05" rpy="0 ${-pi/2} ${3*pi/4}" />
    <parent link="panda_link8"/>
    <child link="camera1_base_link"/>
  </joint>
```

# Some Learning Resources
https://ros-planning.github.io/moveit_tutorials/doc/getting_started/getting_started.html

https://frankaemika.github.io/docs/franka_ros.html