#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import torch
import rospy
import numpy as np

from std_msgs.msg import Header
from sensor_msgs.msg import Image
from yolov8_ros_msgs.msg import BoundingBox, BoundingBoxes
from ultralytics import YOLO

# 关键点 BGR 配色
kpt_color_map = {
    0:{'name':'Nose', 'color':[0, 0, 255], 'radius':8},                # 鼻尖
    1:{'name':'Right Eye', 'color':[255, 0, 0], 'radius':8},           # 右边眼睛
    2:{'name':'Left Eye', 'color':[255, 0, 0], 'radius':8},            # 左边眼睛
    3:{'name':'Right Ear', 'color':[0, 255, 0], 'radius':8},           # 右边耳朵
    4:{'name':'Left Ear', 'color':[0, 255, 0], 'radius':8},            # 左边耳朵
    5:{'name':'Right Shoulder', 'color':[193, 182, 255], 'radius':8},  # 右边肩膀
    6:{'name':'Left Shoulder', 'color':[193, 182, 255], 'radius':8},   # 左边肩膀
    7:{'name':'Right Elbow', 'color':[16, 144, 247], 'radius':8},      # 右侧胳膊肘
    8:{'name':'Left Elbow', 'color':[16, 144, 247], 'radius':8},       # 左侧胳膊肘
    9:{'name':'Right Wrist', 'color':[1, 240, 255], 'radius':8},       # 右侧手腕
    10:{'name':'Left Wrist', 'color':[1, 240, 255], 'radius':8},       # 左侧手腕
    11:{'name':'Right Hip', 'color':[140, 47, 240], 'radius':8},       # 右侧胯
    12:{'name':'Left Hip', 'color':[140, 47, 240], 'radius':8},        # 左侧胯
    13:{'name':'Right Knee', 'color':[223, 155, 60], 'radius':8},      # 右侧膝盖
    14:{'name':'Left Knee', 'color':[223, 155, 60], 'radius':8},       # 左侧膝盖
    15:{'name':'Right Ankle', 'color':[139, 0, 0], 'radius':8},        # 右侧脚踝
    16:{'name':'Left Ankle', 'color':[139, 0, 0], 'radius':8},         # 左侧脚踝
}

# 点类别文字
kpt_labelstr = {
    'font_size':1,             # 字体大小
    'font_thickness':3,       # 字体粗细
    'offset_x':0,             # X 方向，文字偏移距离，向右为正
    'offset_y':30,            # Y 方向，文字偏移距离，向下为正
}

# 骨架连接 BGR 配色
skeleton_map = [
    {'srt_kpt_id':15, 'dst_kpt_id':13, 'color':[0, 100, 255], 'thickness':5},       # 右侧脚踝-右侧膝盖
    {'srt_kpt_id':13, 'dst_kpt_id':11, 'color':[0, 255, 0], 'thickness':5},         # 右侧膝盖-右侧胯
    {'srt_kpt_id':16, 'dst_kpt_id':14, 'color':[255, 0, 0], 'thickness':5},         # 左侧脚踝-左侧膝盖
    {'srt_kpt_id':14, 'dst_kpt_id':12, 'color':[0, 0, 255], 'thickness':5},         # 左侧膝盖-左侧胯
    {'srt_kpt_id':11, 'dst_kpt_id':12, 'color':[122, 160, 255], 'thickness':5},     # 右侧胯-左侧胯
    {'srt_kpt_id':5, 'dst_kpt_id':11, 'color':[139, 0, 139], 'thickness':5},        # 右边肩膀-右侧胯
    {'srt_kpt_id':6, 'dst_kpt_id':12, 'color':[237, 149, 100], 'thickness':5},      # 左边肩膀-左侧胯
    {'srt_kpt_id':5, 'dst_kpt_id':6, 'color':[152, 251, 152], 'thickness':5},       # 右边肩膀-左边肩膀
    {'srt_kpt_id':5, 'dst_kpt_id':7, 'color':[148, 0, 69], 'thickness':5},          # 右边肩膀-右侧胳膊肘
    {'srt_kpt_id':6, 'dst_kpt_id':8, 'color':[0, 75, 255], 'thickness':5},          # 左边肩膀-左侧胳膊肘
    {'srt_kpt_id':7, 'dst_kpt_id':9, 'color':[56, 230, 25], 'thickness':5},         # 右侧胳膊肘-右侧手腕
    {'srt_kpt_id':8, 'dst_kpt_id':10, 'color':[0,240, 240], 'thickness':5},         # 左侧胳膊肘-左侧手腕
    {'srt_kpt_id':1, 'dst_kpt_id':2, 'color':[224,255, 255], 'thickness':5},        # 右边眼睛-左边眼睛
    {'srt_kpt_id':0, 'dst_kpt_id':1, 'color':[47,255, 173], 'thickness':5},         # 鼻尖-左边眼睛
    {'srt_kpt_id':0, 'dst_kpt_id':2, 'color':[203,192,255], 'thickness':5},         # 鼻尖-左边眼睛
    {'srt_kpt_id':1, 'dst_kpt_id':3, 'color':[196, 75, 255], 'thickness':5},        # 右边眼睛-右边耳朵
    {'srt_kpt_id':2, 'dst_kpt_id':4, 'color':[86, 0, 25], 'thickness':5},           # 左边眼睛-左边耳朵
    {'srt_kpt_id':3, 'dst_kpt_id':5, 'color':[255,255, 0], 'thickness':5},          # 右边耳朵-右边肩膀
    {'srt_kpt_id':4, 'dst_kpt_id':6, 'color':[255, 18, 200], 'thickness':5}         # 左边耳朵-左边肩膀
]

class Yolo_Dect:
    def __init__(self):
        print('init obj')
        # load parameters
        yolov8_path = rospy.get_param('/yolov8_path', '')

        weight_path1 = rospy.get_param('~weight_path1', '')
        weight_path2 = rospy.get_param('~weight_path2', '')
        # realistic camera
        # image_topic = rospy.get_param(
        #     '~image_topic', '/camera/color/image_raw')

        # simulation camera
        image_topic = rospy.get_param(
            '~image_topic', '/camera1/rgb/image_raw')
        # pub_topic = rospy.get_param('~pub_topic', '/yolov8/HumanBoundingBoxes')
        pub_topic = rospy.get_param('~pub_topic', '/yolov8/KeypointBoundingBoxes')
        self.camera_frame = rospy.get_param('~camera_frame', '')
        conf = rospy.get_param('~conf', '0.5')

        # load local repository(yolov8:v6.0)
        # self.model = torch.hub.load(yolov8_path, 'custom',
        #                             path=weight_path, source='local')
        
        # self.model = YOLO(weight_path1)  # build a new model for object detect
        self.model = YOLO(weight_path2)  # build a new model for people key point
        
        self.yolopeople = 1
        # self.model = YOLO("yolov8n.pt")  # load a pretrained model (recommended for training)

        # which device will be used
        # if (rospy.get_param('/use_cpu', 'false')):
        #     self.model.cpu()
        # else:
        device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
        # self.model.cuda()
        self.model.to(device)

        # self.model.conf = conf
        self.color_image = Image()
        self.depth_image = Image()
        self.getImageStatus = False

        # Load class color
        self.classes_colors = {}

        # image subscribe
        # 通过中断不断读取图片
        self.color_sub = rospy.Subscriber(image_topic, Image, self.image_callback,
                                          queue_size=1, buff_size=52428800)

        # output publishers
        # 将位置发送出去
        # self.position_pub1 = rospy.Publisher(
        #     pub_topic1,  BoundingBoxes, queue_size=1)
        
        # 将keypoint发送出去
        self.position_pub = rospy.Publisher(
            pub_topic,  BoundingBoxes, queue_size=1)

        # 可在rviz上订阅
        self.image_pub = rospy.Publisher(
            '/yolov8/detection_image1',  Image, queue_size=1)

        # if no image messages
        while (not self.getImageStatus) :
            rospy.loginfo("waiting for image.")
            rospy.sleep(2)

    # 中断函数 有图像进来就检测 yolo  3秒1次
    def image_callback(self, image):
        print('human img recevied')
        # 盒子的消息
        self.boundingBoxes1 = BoundingBoxes()
        self.boundingBoxes1.header = image.header
        self.boundingBoxes1.image_header = image.header
        # keypoint的消息
        self.boundingBoxes2 = BoundingBoxes()
        self.boundingBoxes2.header = image.header
        self.boundingBoxes2.image_header = image.header
        #
        self.getImageStatus = True
        self.color_image = np.frombuffer(image.data, dtype=np.uint8).reshape(
            image.height, image.width, -1)
        # self.color_image = cv2.cvtColor(self.color_image, cv2.COLOR_BGR2RGB)

        results = self.model(self.color_image)
        # results = self.model.track(self.color_image)
        # xmin    ymin    xmax   ymax  confidence  class    name
        # print(results)
        #boxs = results.pandas().xyxy[0].values
        # boxs=[]
        # for result in results:
        #     boxes = result.boxes
        #     boxs.append(boxes)
        #     print(boxes)

        # 目标检测部分
        boxs = results[0].boxes.xyxy.cpu().numpy().astype('uint32') 
        boxs = boxs.tolist()
        # print(boxs)
        cls = results[0].boxes.cls.cpu().numpy().astype('uint32')
        cls = cls.tolist()
        name = results[0].names
        # print(cls)
        # print(name)
        prob = results[0].boxes.conf.cpu().numpy().astype('float64')
        prob = prob.tolist()
        if self.yolopeople == 1:
            
            # print(prob)
            
            # print(type(boxs))

            # 关键点检测

            # print(results[0].keypoints.shape)
            # bboxes_keypoints = results[0].keypoints.cpu().numpy().astype(np.uint16)
            bboxes_keypoints = results[0].keypoints.xy.cpu().numpy()
            # bboxes_keypoints = np.array(bboxes_keypoints)
            # print(type(bboxes_keypoints))
            # print(bboxes_keypoints.shape)
            # bboxes_keypoints = bboxes_keypoints.tolist()
            # print(bboxes_keypoints)
            # print(bboxes_keypoints.type)
            # 检测人
            self.dectshow1(self.color_image, boxs, cls, prob, bboxes_keypoints, image.height, image.width)
        else:
            # 检测物体
            self.dectshow2(self.color_image, boxs,prob,cls, image.height, image.width)

        cv2.waitKey(3)

    # 画图 同时将检测的图像发布出去 方便rviz上观看
    def dectshow1(self, org_img, boxs, cls, prob, keypoints, height, width):
        img = org_img.copy()

        count = 0
        # for i in boxs:
        #     count += 1

        for box in boxs:
            
            boundingBox = BoundingBox()
            # boundingBox.probability =np.float64(box[4])
            # boundingBox.xmin = np.int64(box[0])
            # boundingBox.ymin = np.int64(box[1])
            # boundingBox.xmax = np.int64(box[2])
            # boundingBox.ymax = np.int64(box[3])
            # boundingBox.num = np.int16(count)
            # boundingBox.Class = box[-1]

            boundingBox.probability =np.float64(prob[count])
            # xyxy = np.int64(box.boxes.xyxy)
            
            boundingBox.xmin = int(boxs[count][0])
            boundingBox.ymin = int(boxs[count][1])
            boundingBox.xmax = int(boxs[count][2])
            boundingBox.ymax = int(boxs[count][3])
            # boundingBox.num = np.int16(count)
            boundingBox.Class = str(cls[count])
            # boundingBox.Keypoints =keypoints[count]
            # boundingBox.Keypoints =[]
            # boundingBox.Keypoints.append(keypoints[count])
            # print(boundingBox.probability)
            # print(boundingBox.xmin)
            # print(boundingBox.ymin)
            # print(boundingBox.xmax)
            # print(boundingBox.ymax)
            # print(boundingBox.Class)
            
            boundingBox2 = BoundingBox()
            # boundingBox.probability =np.float64(box[4])
            # boundingBox.xmin = np.int64(box[0])
            # boundingBox.ymin = np.int64(box[1])
            # boundingBox.xmax = np.int64(box[2])
            # boundingBox.ymax = np.int64(box[3])
            # boundingBox.num = np.int16(count)
            # boundingBox.Class = box[-1]

            boundingBox2.probability = np.float64(0)
            # xyxy = np.int64(box.boxes.xyxy)
            
            boundingBox2.xmin = int(0)
            boundingBox2.ymin = int(0)
            boundingBox2.xmax = int(0)
            boundingBox2.ymax = int(0)
            boundingBox2.Class = str(0)


            if boundingBox.Class in self.classes_colors.keys():
                color = self.classes_colors[boundingBox.Class]
            else:
                # color = np.random.randint(0, 183, 3)
                color = (255,0,0)
                self.classes_colors[boundingBox.Class] = color

            cv2.rectangle(img, (boundingBox.xmin, boundingBox.ymin),
                          (boundingBox.xmax, boundingBox.ymax), (int(self.classes_colors[boundingBox.Class][0]),int(self.classes_colors[boundingBox.Class][1]), int(self.classes_colors[boundingBox.Class][2])), 2)

            bbox_keypoints = keypoints[count]
            # print(bbox_keypoints)
            # bbox_keypoints = boundingBox.Keypoints # 该框所有关键点坐标和置信度
            count += 1
            # 画该框的骨架连接
            for skeleton in skeleton_map:
                
                # 获取起始点坐标
                srt_kpt_id = skeleton['srt_kpt_id']
                srt_kpt_x = int(bbox_keypoints[srt_kpt_id][0])
                srt_kpt_y = int(bbox_keypoints[srt_kpt_id][1])
                # print(srt_kpt_x)
                # print(srt_kpt_y)
                # 获取终止点坐标
                dst_kpt_id = skeleton['dst_kpt_id']
                dst_kpt_x = int(bbox_keypoints[dst_kpt_id][0])
                dst_kpt_y = int(bbox_keypoints[dst_kpt_id][1])
                
                # 获取骨架连接颜色
                skeleton_color = skeleton['color']
                
                # 获取骨架连接线宽
                skeleton_thickness = skeleton['thickness']
                
                # 画骨架连接
                img = cv2.line(img, (srt_kpt_x, srt_kpt_y),(dst_kpt_x, dst_kpt_y),color=skeleton_color,thickness=skeleton_thickness)
                
            # 画该框的关键点
            for kpt_id in kpt_color_map:
                
                # 获取该关键点的颜色、半径、XY坐标
                kpt_color = kpt_color_map[kpt_id]['color']
                kpt_radius = kpt_color_map[kpt_id]['radius']
                kpt_x = int(bbox_keypoints[kpt_id][0])
                kpt_y = int(bbox_keypoints[kpt_id][1])
                
                # 画圆：图片、XY坐标、半径、颜色、线宽（-1为填充）
                img = cv2.circle(img, (kpt_x, kpt_y), kpt_radius, kpt_color, -1)
                
                # 写关键点类别文字：图片，文字字符串，文字左上角坐标，字体，字体大小，颜色，字体粗细
                kpt_label = str(kpt_id) # 写关键点类别 ID（二选一）
                # kpt_label = str(kpt_color_map[kpt_id]['name']) # 写关键点类别名称（二选一）
                img = cv2.putText(img, kpt_label, (kpt_x+kpt_labelstr['offset_x'], kpt_y+kpt_labelstr['offset_y']), cv2.FONT_HERSHEY_SIMPLEX, kpt_labelstr['font_size'], kpt_color, kpt_labelstr['font_thickness'])
                
                if kpt_id == 9:
                    boundingBox2.xmin = kpt_x
                    boundingBox2.ymin = kpt_y
                    print('9:',kpt_x,kpt_y)

                elif kpt_id == 10:
                    boundingBox2.xmax = kpt_x
                    boundingBox2.ymax = kpt_y
                    print('10:',kpt_x,kpt_y)

            if boundingBox.ymin < 20:
                text_pos_y = boundingBox.ymin + 30
            else:
                text_pos_y = boundingBox.ymin - 10
                
            cv2.putText(img, 'human',
                        (boundingBox.xmin, int(text_pos_y)-10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2, cv2.LINE_AA)

            # 发送检测框
            # self.boundingBoxes1.bounding_boxes.append(boundingBox)
            # # 发送检测到的xy话题
            # self.position_pub1.publish(self.boundingBoxes1)
            # 发送关键点
            self.boundingBoxes2.bounding_boxes.append(boundingBox2)
            # 发送检测到的xy话题
            self.position_pub.publish(self.boundingBoxes2)
        # 发送图像话题
        self.publish_image(img, height, width)
        print('finish onetime')
        # cv2.imshow('YOLOv8_human', img)

    # 画图 同时将检测的图像发布出去 方便rviz上观看
    def dectshow2(self, org_img, boxs, prob, cls, height, width):
        img = org_img.copy()

        count = 0
        # for i in boxs:
        #     count += 1

        for box in boxs:
            
            boundingBox = BoundingBox()
            # boundingBox.probability =np.float64(box[4])
            # boundingBox.xmin = np.int64(box[0])
            # boundingBox.ymin = np.int64(box[1])
            # boundingBox.xmax = np.int64(box[2])
            # boundingBox.ymax = np.int64(box[3])
            # boundingBox.num = np.int16(count)
            # boundingBox.Class = box[-1]

            boundingBox.probability =np.float64(prob[count])
            # xyxy = np.int64(box.boxes.xyxy)
            
            boundingBox.xmin = int(boxs[count][0])
            boundingBox.ymin = int(boxs[count][1])
            boundingBox.xmax = int(boxs[count][2])
            boundingBox.ymax = int(boxs[count][3])
            # boundingBox.num = np.int16(count)
            boundingBox.Class = str(cls[count])

            if boundingBox.Class in self.classes_colors.keys():
                color = self.classes_colors[boundingBox.Class]
            else:
                # color = np.random.randint(0, 183, 3)
                color = (255,0,0)
                self.classes_colors[boundingBox.Class] = color

            cv2.rectangle(img, (boundingBox.xmin, boundingBox.ymin),
                          (boundingBox.xmax, boundingBox.ymax), (int(self.classes_colors[boundingBox.Class][0]),int(self.classes_colors[boundingBox.Class][1]), int(self.classes_colors[boundingBox.Class][2])), 2)

            # if box[-1] in self.classes_colors.keys():
            #     color = self.classes_colors[box[-1]]
            # else:
            #     color = np.random.randint(0, 183, 3)
            #     self.classes_colors[box[-1]] = color

            # cv2.rectangle(img, (int(box[0]), int(box[1])),
            #               (int(box[2]), int(box[3])), (int(color[0]),int(color[1]), int(color[2])), 2)

            if boundingBox.ymin < 20:
                text_pos_y = boundingBox.ymin + 30
            else:
                text_pos_y = boundingBox.ymin - 10
                
            cv2.putText(img, 'abc',
                        (boundingBox.xmin, int(text_pos_y)-10), cv2.FONT_HERSHEY_SIMPLEX, 0.6, (255, 255, 255), 2, cv2.LINE_AA)

            self.boundingBoxes.bounding_boxes.append(boundingBox)
            # 发送检测到的xy话题
            self.position_pub1.publish(self.boundingBoxes)
        # 发送图像话题
        self.publish_image(img, height, width)
        cv2.imshow('YOLOv5', img)

    # rviz上订阅所需函数
    def publish_image(self, imgdata, height, width):
        image_temp = Image()
        header = Header(stamp=rospy.Time.now())
        header.frame_id = self.camera_frame
        image_temp.height = height
        image_temp.width = width
        image_temp.encoding = 'bgr8'
        image_temp.data = np.array(imgdata).tobytes()
        image_temp.header = header
        image_temp.step = width * 3
        self.image_pub.publish(image_temp)


def main():
    rospy.init_node('yolov8_ros', anonymous=True)
    yolo_dect = Yolo_Dect()
    rospy.spin()


if __name__ == "__main__":

    main()
