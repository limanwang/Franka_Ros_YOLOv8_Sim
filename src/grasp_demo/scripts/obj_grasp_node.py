#! /usr/bin/env python3
#-*- coding: utf-8 -*-

import tf
import rospy
import tf2_ros
import moveit_commander
import tf2_geometry_msgs
from grasp_demo.srv import SpawnObj, SpawnObjRequest
from yolov8_ros_msgs.msg import BoundingBoxes
from geometry_msgs.msg import PoseStamped, Pose
from grasp_demo.srv import CamToReal, CamToRealRequest, CamToRealResponse
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse


class MoveRobot():
    def __init__(self):

        # 初始化 planning group
        self.robot = moveit_commander.robot.RobotCommander()
        self.arm_group = moveit_commander.move_group.MoveGroupCommander(
            "panda_arm")

        self.gripper_group = moveit_commander.move_group.MoveGroupCommander(
            "hand")

        # 设置机械手臂的速度和加速度
        self.arm_group.set_max_acceleration_scaling_factor(0.8)
        self.arm_group.set_max_velocity_scaling_factor(0.8)

        # 物体的位置
        self.pixel_x = 0
        self.pixel_y = 0
        self.obj_index = 0
        self.Obj_pose = PoseStamped()
        self.Obj_pose.pose.position.x = 0
        self.Obj_pose2 = PoseStamped()
        self.Obj_pose2.pose.position.x = 0
        self.find_enable = False

        self.listener = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.listener)

        # 订阅yolov8识别 的结果以及opencv识别的角度
        yolo_sub1 = rospy.Subscriber(
            '/yolov8/ObjBoundingBoxes', BoundingBoxes, self.yolo_callback)
        
        yolo_sub2 = rospy.Subscriber(
            '/yolov8/KeypointBoundingBoxes', BoundingBoxes, self.yolo_callback2)

        self.attach_srv = rospy.ServiceProxy('/link_attacher_node/attach',
                                             Attach)
        self.attach_srv.wait_for_service()

        self.detach_srv = rospy.ServiceProxy('/link_attacher_node/detach',
                                             Attach)
        self.detach_srv.wait_for_service()

        # 设置服务发送格式 格式在CamToReal里
        self.dist_client = rospy.ServiceProxy('cam_to_real', CamToReal)
        self.dist_req = CamToRealRequest()
        self.dist_resp = CamToRealResponse()

    def stop(self):
        moveit_commander.roscpp_initializer.roscpp_shutdown()

    # 物体抓取
    def yolo_callback(self, yolo_tmp):
        
        if self.find_enable:

            if yolo_tmp.bounding_boxes[0].Class == '2':
                self.obj_index = 0
                self.pixel_x = (
                    yolo_tmp.bounding_boxes[0].xmin + yolo_tmp.bounding_boxes[0].xmax) / 2.0
                self.pixel_y = (
                    yolo_tmp.bounding_boxes[0].ymin + yolo_tmp.bounding_boxes[0].ymax) / 2.0
                self.height = (
                    yolo_tmp.bounding_boxes[0].ymax - yolo_tmp.bounding_boxes[0].ymin)

            elif yolo_tmp.bounding_boxes[0].Class == '1':
                self.obj_index = 1
                self.pixel_x = (
                    yolo_tmp.bounding_boxes[0].xmin + yolo_tmp.bounding_boxes[0].xmax) / 2.0 + 40
                self.pixel_y = (
                    yolo_tmp.bounding_boxes[0].ymin + yolo_tmp.bounding_boxes[0].ymax) / 2.0
                self.height = (
                    yolo_tmp.bounding_boxes[0].ymax - yolo_tmp.bounding_boxes[0].ymin)

            elif yolo_tmp.bounding_boxes[0].Class == '0':
                self.obj_index = 2
                self.pixel_x = (
                    yolo_tmp.bounding_boxes[0].xmin + yolo_tmp.bounding_boxes[0].xmax) / 2.0
                self.pixel_y = (
                    yolo_tmp.bounding_boxes[0].ymin + yolo_tmp.bounding_boxes[0].ymax) / 2.0
                self.height = (
                    yolo_tmp.bounding_boxes[0].ymax - yolo_tmp.bounding_boxes[0].ymin)
                
            elif yolo_tmp.bounding_boxes[0].Class == '46':
                self.obj_index = 1
                self.pixel_x = (
                    yolo_tmp.bounding_boxes[0].xmin + yolo_tmp.bounding_boxes[0].xmax) / 2.0 + 40
                self.pixel_y = (
                    yolo_tmp.bounding_boxes[0].ymin + yolo_tmp.bounding_boxes[0].ymax) / 2.0
                self.height = (
                    yolo_tmp.bounding_boxes[0].ymax - yolo_tmp.bounding_boxes[0].ymin)
                
            # 获得像素点在机械臂基坐标系下的位置
            self.dist_req.pixel_x = self.pixel_x
            self.dist_req.pixel_y = self.pixel_y
            self.Obj_pose = self.getPosinBase(
                self.Obj_pose, self.pixel_x, self.pixel_y)
            if (self.Obj_pose.pose.position.x != 0):
                self.find_enable = False

    # 人体位置识别
    def yolo_callback2(self, yolo_tmp):
        
        if self.people_go:
            # # 左手
            # if yolo_tmp.bounding_boxes[0].xmin != 0 or yolo_tmp.bounding_boxes[0].ymin != 0:
            #     self.obj_index = 0
            #     self.pixel_x = yolo_tmp.bounding_boxes[0].xmin 
            #     self.pixel_y = yolo_tmp.bounding_boxes[0].ymin
            #     self.people_go =0
            

            # 右手
            if yolo_tmp.bounding_boxes[0].xmax != 0 or yolo_tmp.bounding_boxes[0].ymax != 0:
                self.obj_index = 0
                self.pixel_x = yolo_tmp.bounding_boxes[0].xmax 
                self.pixel_y = yolo_tmp.bounding_boxes[0].ymax

                print("img keypoint hand x:",self.pixel_x)
                print("img keypoint hand y:",self.pixel_y)
            # # 获得像素点在机械臂基坐标系下的位置
                self.dist_req.pixel_x = self.pixel_x
                self.dist_req.pixel_y = self.pixel_y
                self.Obj_pose2 = self.getPosinBase2(
                    self.Obj_pose2, self.pixel_x, self.pixel_y)
                print("Obj world x:",self.Obj_pose2.pose.position.x)
                print("Obj world y:",self.Obj_pose2.pose.position.y)
                print("Obj world z:",self.Obj_pose2.pose.position.z)
            # if (self.Obj_pose.pose.position.x != 0):
                # self.find_enable = False

    def plan_cartesian_path(self, pose):
        """
            笛卡尔路径规划

            Parameters:
                pose - 目标pose

            Returns:
                None
            """
        waypoints = []
        waypoints.append(pose)

        # 设置机器臂当前的状态作为运动初始状态
        self.arm_group.set_start_state_to_current_state()

        # 计算轨迹
        (plan, fraction) = self.arm_group.compute_cartesian_path(
            waypoints,   # waypoint poses，路点列表，这里是5个点
            0.01,        # eef_step，终端步进值，每隔0.01m计算一次逆解判断能否可达
            0.0,         # jump_threshold，跳跃阈值，设置为0代表不允许跳跃
            False)        # avoid_collisions，避障规划

        plan = self.arm_group.retime_trajectory(
            self.robot.get_current_state(), plan, 0.2)
        rospy.loginfo("开始 执行")
        self.arm_group.execute(plan, wait=True)

    def move_gripper(self, width):
        if width > 80e-3:
            width = 80e-3
        if width < 0:
            width = 0

        each_joint = width / 2.0
        self.gripper_group.set_joint_value_target([each_joint, each_joint])
        self.gripper_group.go()

    def gazeboAttach(self, i):

        rospy.loginfo("Attaching gripper and object")
        req = AttachRequest()
        req.model_name_1 = "panda"
        req.link_name_1 = "panda_leftfinger"
        req.model_name_2 = "obj_" + str(i)
        req.link_name_2 = "base_link"
        self.attach_srv.call(req)

    def gazeboDetach(self, i):

        rospy.loginfo("Attaching gripper and object")
        req = AttachRequest()
        req.model_name_1 = "panda"
        req.link_name_1 = "panda_leftfinger"
        req.model_name_2 = "obj_" + str(i)
        req.link_name_2 = "base_link"
        self.detach_srv.call(req)

    def objectSpawn(self, i):
        self.spawner_req.type = i
        self.spawner_client.call(self.spawner_req)

    def getPosinBase(self, Obj_pose,  pixel_x, pixel_y):

        self.dist_req.pixel_x = pixel_x
        self.dist_req.pixel_y = pixel_y
        self.dist_resp = self.dist_client.call(self.dist_req)
        Obj_pose.pose.position.x = self.dist_resp.obj_x
        Obj_pose.pose.position.y = self.dist_resp.obj_y
        Obj_pose.pose.position.z = self.dist_resp.obj_z

        try:
            transform = self.listener.lookup_transform(
                "world", "camera1_rgb_optical_frame", rospy.Time(), rospy.Duration(1.0))
            Obj_pose_in_base = tf2_geometry_msgs.do_transform_pose(
                Obj_pose, transform)
            Obj_pose_in_base.pose.orientation.x = 0.923965
            Obj_pose_in_base.pose.orientation.y = -0.382461
            Obj_pose_in_base.pose.orientation.z = -0.00328231
            Obj_pose_in_base.pose.orientation.w = 0.00137126

            Obj_pose_in_base.pose.position.z = 0.140

            # print(Obj_pose_in_base.pose.position.z)
            return Obj_pose_in_base

        except Exception as e:
            rospy.logerr("Transform failed: {}".format(e))

    def getPosinBase2(self, Obj_pose2,  pixel_x, pixel_y):

        self.dist_req.pixel_x = pixel_x
        self.dist_req.pixel_y = pixel_y
        self.dist_resp = self.dist_client.call(self.dist_req)
        Obj_pose2.pose.position.x = self.dist_resp.obj_x
        Obj_pose2.pose.position.y = self.dist_resp.obj_y
        Obj_pose2.pose.position.z = self.dist_resp.obj_z


        #     position: 
        #     x: 0.2724075140428995
        #     y: 0.7972215968396661
        #     z: 0.4515336343478219
        # orientation: 
        #     x: -0.6484387841269715
        #     y: -0.29426526838843026
        #     z: -0.24061310266115732
        #     w: 0.6595759470205012 ]
        # panda_link8 RPY = [-1.590591757019204, -0.7756431388078779, 0.08987639538073022]


        try:
            transform = self.listener.lookup_transform(
                "world", "camera1_rgb_optical_frame", rospy.Time(), rospy.Duration(1.0))
            Obj_pose_in_base2 = tf2_geometry_msgs.do_transform_pose(
                Obj_pose2, transform)
            
            Obj_pose_in_base2.pose.orientation.x = -0.6484387841269715
            Obj_pose_in_base2.pose.orientation.y = -0.29426526838843026
            Obj_pose_in_base2.pose.orientation.z = -0.24061310266115732
            Obj_pose_in_base2.pose.orientation.w = 0.6595759470205012

            # Obj_pose_in_base2.pose.orientation.x = 0.923965
            # Obj_pose_in_base2.pose.orientation.y = -0.382461
            # Obj_pose_in_base2.pose.orientation.z = -0.00328231
            # Obj_pose_in_base2.pose.orientation.w = 0.00137126

            # Obj_pose_in_base2.pose.position.x = 0.2
            y_reach = (0.8**(2) - (Obj_pose_in_base2.pose.position.x**(2)) - (Obj_pose_in_base2.pose.position.z**(2)))**(1/2)-0.1
            Obj_pose_in_base2.pose.position.y = y_reach
            # Obj_pose_in_base2.pose.position.z = 0.45

#             pose: 
#   position: 
#     x: 0.5779617000326142
#     y: -0.05857418870329248
#     z: 0.38898536726954347
#   orientation: 
#     x: 0.9239935957749346
#     y: -0.3823807675301697
#     z: -0.004074799341470233
#     w: 0.0020444070709633583 ]


            # Obj_pose_in_base.pose.orientation.x = 0.923965
            # Obj_pose_in_base.pose.orientation.y = -0.382461
            # Obj_pose_in_base.pose.orientation.z = -0.00328231
            # Obj_pose_in_base.pose.orientation.w = 0.00137126

            # Obj_pose_in_base.pose.position.z = 0.140

            # print(Obj_pose_in_base.pose.position.z)
            return Obj_pose_in_base2

        except Exception as e:
            rospy.logerr("Transform failed: {}".format(e))

    def goSP(self):

        self.arm_group.set_joint_value_target([8.196549004857445e-06, -0.023120201730470136, 6.744397325775253e-05, -1.0838625786211065, -4.3838619427916115e-06, 1.0515426114314392, 0.7849545350713987])
        self.arm_group.go(wait=True)

    def grasp_obj(self):


        self.Obj_pose.pose.position.z +=0.15

        self.plan_cartesian_path(self.Obj_pose.pose)

        self.Obj_pose.pose.position.z -=0.05
        self.Obj_pose.pose.position.x +=(self.height/2)*0.0004
        self.plan_cartesian_path(self.Obj_pose.pose)

    def place_obj(self):

        self.Obj_pose.pose.position.z += 0.15
        self.plan_cartesian_path(self.Obj_pose.pose)
        self.arm_group.set_joint_value_target([-0.8855523907410445, 0.5851334015373082, 0.09272646966951559, -1.5543670670132448, 0.948966916550237, 0.8911706722020094, -1.5544175012777615])
    
        self.arm_group.go()

    def giving_obj(self):

        # self.arm_group.set_joint_value_target( [-1.541620073092929, -1.354773478719503, 1.7585082298268233, -0.5628634970835575, 2.725699219399724, 2.533551638982672, -0.6114513691614265])
        # self.arm_group.go(wait=True)
        rospy.loginfo("arrive at 定点")
        self.people_go = 1
        # self.plan_cartesian_path(self.Obj_pose.pose)
        rospy.sleep(3)
        self.arm_group.set_pose_target(self.Obj_pose2.pose)
        # self.plan_cartesian_path(self.Obj_pose2.pose)
        self.arm_group.go(wait=True)
        # self.arm_group.go(wait=True)



    def main_loop(self):
        try:

            self.goSP()  # 1. 去到预抓取位置
            self.move_gripper(60e-3)
            rospy.loginfo("arrive at start point")
            self.find_enable = True
            self.people_go = False
            rospy.sleep(3)
                
            if not self.find_enable:
                self.grasp_obj()
                self.move_gripper(30e-3)      
                rospy.sleep(0.5)  
                self.gazeboAttach(self.obj_index)
                self.place_obj()
                rospy.loginfo("arrive at 看人点")
                # 去找人
                rospy.sleep(2)
                
                self.giving_obj()
                rospy.loginfo("arrive at 给予点")
                self.move_gripper(60e-3)
                self.gazeboDetach(self.obj_index)
                rospy.sleep(3)

        except Exception as e:
            rospy.logerr(str(e))


def main():
    rospy.init_node('grasp_demo', anonymous=True)
    rospy.loginfo('Start Grasp Demo')
    moverobot = MoveRobot()
    while(not rospy.is_shutdown()):
        moverobot.main_loop()


if __name__ == "__main__":

    main()
