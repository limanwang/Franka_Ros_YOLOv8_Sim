;; Auto-generated. Do not edit!


(when (boundp 'grasp_demo::CamToReal)
  (if (not (find-package "GRASP_DEMO"))
    (make-package "GRASP_DEMO"))
  (shadow 'CamToReal (find-package "GRASP_DEMO")))
(unless (find-package "GRASP_DEMO::CAMTOREAL")
  (make-package "GRASP_DEMO::CAMTOREAL"))
(unless (find-package "GRASP_DEMO::CAMTOREALREQUEST")
  (make-package "GRASP_DEMO::CAMTOREALREQUEST"))
(unless (find-package "GRASP_DEMO::CAMTOREALRESPONSE")
  (make-package "GRASP_DEMO::CAMTOREALRESPONSE"))

(in-package "ROS")





(defclass grasp_demo::CamToRealRequest
  :super ros::object
  :slots (_pixel_x _pixel_y ))

(defmethod grasp_demo::CamToRealRequest
  (:init
   (&key
    ((:pixel_x __pixel_x) 0.0)
    ((:pixel_y __pixel_y) 0.0)
    )
   (send-super :init)
   (setq _pixel_x (float __pixel_x))
   (setq _pixel_y (float __pixel_y))
   self)
  (:pixel_x
   (&optional __pixel_x)
   (if __pixel_x (setq _pixel_x __pixel_x)) _pixel_x)
  (:pixel_y
   (&optional __pixel_y)
   (if __pixel_y (setq _pixel_y __pixel_y)) _pixel_y)
  (:serialization-length
   ()
   (+
    ;; float64 _pixel_x
    8
    ;; float64 _pixel_y
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pixel_x
       (sys::poke _pixel_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pixel_y
       (sys::poke _pixel_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pixel_x
     (setq _pixel_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pixel_y
     (setq _pixel_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass grasp_demo::CamToRealResponse
  :super ros::object
  :slots (_obj_x _obj_y _obj_z _result ))

(defmethod grasp_demo::CamToRealResponse
  (:init
   (&key
    ((:obj_x __obj_x) 0.0)
    ((:obj_y __obj_y) 0.0)
    ((:obj_z __obj_z) 0.0)
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _obj_x (float __obj_x))
   (setq _obj_y (float __obj_y))
   (setq _obj_z (float __obj_z))
   (setq _result __result)
   self)
  (:obj_x
   (&optional __obj_x)
   (if __obj_x (setq _obj_x __obj_x)) _obj_x)
  (:obj_y
   (&optional __obj_y)
   (if __obj_y (setq _obj_y __obj_y)) _obj_y)
  (:obj_z
   (&optional __obj_z)
   (if __obj_z (setq _obj_z __obj_z)) _obj_z)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; float64 _obj_x
    8
    ;; float64 _obj_y
    8
    ;; float64 _obj_z
    8
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _obj_x
       (sys::poke _obj_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_y
       (sys::poke _obj_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _obj_z
       (sys::poke _obj_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _obj_x
     (setq _obj_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_y
     (setq _obj_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _obj_z
     (setq _obj_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasp_demo::CamToReal
  :super ros::object
  :slots ())

(setf (get grasp_demo::CamToReal :md5sum-) "189ac79be7b27a6947e618b03843336a")
(setf (get grasp_demo::CamToReal :datatype-) "grasp_demo/CamToReal")
(setf (get grasp_demo::CamToReal :request) grasp_demo::CamToRealRequest)
(setf (get grasp_demo::CamToReal :response) grasp_demo::CamToRealResponse)

(defmethod grasp_demo::CamToRealRequest
  (:response () (instance grasp_demo::CamToRealResponse :init)))

(setf (get grasp_demo::CamToRealRequest :md5sum-) "189ac79be7b27a6947e618b03843336a")
(setf (get grasp_demo::CamToRealRequest :datatype-) "grasp_demo/CamToRealRequest")
(setf (get grasp_demo::CamToRealRequest :definition-)
      "float64 pixel_x
float64 pixel_y
---
float64 obj_x
float64 obj_y
float64 obj_z
bool result




")

(setf (get grasp_demo::CamToRealResponse :md5sum-) "189ac79be7b27a6947e618b03843336a")
(setf (get grasp_demo::CamToRealResponse :datatype-) "grasp_demo/CamToRealResponse")
(setf (get grasp_demo::CamToRealResponse :definition-)
      "float64 pixel_x
float64 pixel_y
---
float64 obj_x
float64 obj_y
float64 obj_z
bool result




")



(provide :grasp_demo/CamToReal "189ac79be7b27a6947e618b03843336a")


