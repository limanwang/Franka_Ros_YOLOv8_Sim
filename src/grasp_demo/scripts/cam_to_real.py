#!/usr/bin/env python3
import rospy
from cv_bridge import CvBridge
from sensor_msgs.msg import Image, CameraInfo
from grasp_demo.srv import CamToReal, CamToRealResponse
import cv2
import numpy as np


class ImageConverter:
    def __init__(self):
        self.bridge = CvBridge()
        self.color_image = None
        self.depth_image = np.zeros((720, 1280), dtype=np.float32)  # camera_info
        self.camera_info = None

        self.image_sub_depth = rospy.Subscriber(
            "/camera1/depth/image_raw", Image, self.image_depth_callback)
        self.image_sub_color = rospy.Subscriber(
            "/camera1/rgb/image_raw", Image, self.image_color_callback)
        self.camera_info_sub_ = rospy.Subscriber(
            "/camera1/depth/camera_info", CameraInfo, self.camera_info_callback)
        # 在此初始化cam to real服务 用于自动转化从相机坐标到末端坐标
        self.cam_to_real = rospy.Service(
            "/cam_to_real", CamToReal, self.cam_to_real_callback)

    def camera_info_callback(self, msg):
        self.camera_info = msg

    def image_depth_callback(self, msg):
        self.depth_image = self.bridge.imgmsg_to_cv2(
            msg, desired_encoding="passthrough")

    def image_color_callback(self, msg):
        self.color_image = self.bridge.imgmsg_to_cv2(
            msg, desired_encoding="bgr8")

    def cam_to_real_callback(self, req):
        obj_x = req.pixel_x
        obj_y = req.pixel_y
        real_z = self.depth_image[int(obj_y), int(obj_x)]
        if real_z != 0:
            real_x  = (obj_x - self.camera_info.K[2]) / self.camera_info.K[0] * real_z
            real_y = (obj_y - self.camera_info.K[5]) / self.camera_info.K[4] * real_z
            return CamToRealResponse(real_x, real_y, real_z, True)
        else:
            return CamToRealResponse(0, 0, 0, False)


def main():
    rospy.init_node('detect_obj')
    ic = ImageConverter()
    rospy.spin()


if __name__ == '__main__':
    main()
