#ifndef FIND_OBJ_GRASP_H
#define FIND_OBJ_GRASP_H

#include <iostream>
#include <ros/ros.h>
#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <math.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Pose.h>
#include "tf2_msgs/TFMessage.h"
// #include "yolov5_ros_msgs/BoundingBoxes.h"
#include "std_msgs/Float32MultiArray.h"
#include "grasp_demo/CamToReal.h"
#include "grasp_demo/EyetoHand.h"
#include "string.h"
#include "Eigen/Core"
#include "Eigen/Geometry"

using namespace std;

class grasp
{
private:
    moveit::planning_interface::MoveGroupInterface armgroup;
    moveit::planning_interface::MoveGroupInterface grippergroup;
    string end_effector_link, reference_frame;
    ros::NodeHandle nh_;
    ros::Subscriber tf_sub;
    geometry_msgs::PoseStamped Obj_pose;
    bool find_enable;
    geometry_msgs::Pose target_pose, current_pose;
    vector<double> joint_group_positions, gripper_joints_state;
    double pixel_x, pixel_y, grasp_angle, grasp_width;
    ros::ServiceClient pose_client, client;
    string pause_, Object_class;
    Eigen::Quaterniond quaternion;

public:
    bool move_finish;
    grasp();
    ~grasp();
    void pose_callback(const std_msgs::Float32MultiArray &object_tmp);
    double planPath(vector<geometry_msgs::Pose> waypoints);
    void goSP();
    void getObjPose();
    void goObj();
    void liftObj();
    void goHome();
    void initMove();
};

#endif
