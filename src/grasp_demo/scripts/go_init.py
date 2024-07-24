#! /usr/bin/env python3
import sys
import rospy
import moveit_commander
import geometry_msgs
import tf

 
moveit_commander.roscpp_initializer.roscpp_initialize(sys.argv)
rospy.init_node('reset_pose', anonymous=True)
robot = moveit_commander.robot.RobotCommander()

arm_group = moveit_commander.move_group.MoveGroupCommander("panda_arm")
joint_state_positions = arm_group.get_current_joint_values()
print (str(joint_state_positions))

# arm_group.set_named_target('ready')
# arm_group.go()

moveit_commander.roscpp_initializer.roscpp_shutdown()
