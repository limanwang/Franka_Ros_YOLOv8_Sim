;; Auto-generated. Do not edit!


(when (boundp 'grasp_demo::GripperMove)
  (if (not (find-package "GRASP_DEMO"))
    (make-package "GRASP_DEMO"))
  (shadow 'GripperMove (find-package "GRASP_DEMO")))
(unless (find-package "GRASP_DEMO::GRIPPERMOVE")
  (make-package "GRASP_DEMO::GRIPPERMOVE"))
(unless (find-package "GRASP_DEMO::GRIPPERMOVEREQUEST")
  (make-package "GRASP_DEMO::GRIPPERMOVEREQUEST"))
(unless (find-package "GRASP_DEMO::GRIPPERMOVERESPONSE")
  (make-package "GRASP_DEMO::GRIPPERMOVERESPONSE"))

(in-package "ROS")





(defclass grasp_demo::GripperMoveRequest
  :super ros::object
  :slots (_pulse ))

(defmethod grasp_demo::GripperMoveRequest
  (:init
   (&key
    ((:pulse __pulse) 0.0)
    )
   (send-super :init)
   (setq _pulse (float __pulse))
   self)
  (:pulse
   (&optional __pulse)
   (if __pulse (setq _pulse __pulse)) _pulse)
  (:serialization-length
   ()
   (+
    ;; float64 _pulse
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _pulse
       (sys::poke _pulse (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _pulse
     (setq _pulse (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass grasp_demo::GripperMoveResponse
  :super ros::object
  :slots (_result ))

(defmethod grasp_demo::GripperMoveResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional (__result :null))
   (if (not (eq __result :null)) (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasp_demo::GripperMove
  :super ros::object
  :slots ())

(setf (get grasp_demo::GripperMove :md5sum-) "bfc68b580573d62fc32a37a0f2f5f368")
(setf (get grasp_demo::GripperMove :datatype-) "grasp_demo/GripperMove")
(setf (get grasp_demo::GripperMove :request) grasp_demo::GripperMoveRequest)
(setf (get grasp_demo::GripperMove :response) grasp_demo::GripperMoveResponse)

(defmethod grasp_demo::GripperMoveRequest
  (:response () (instance grasp_demo::GripperMoveResponse :init)))

(setf (get grasp_demo::GripperMoveRequest :md5sum-) "bfc68b580573d62fc32a37a0f2f5f368")
(setf (get grasp_demo::GripperMoveRequest :datatype-) "grasp_demo/GripperMoveRequest")
(setf (get grasp_demo::GripperMoveRequest :definition-)
      "float64 pulse
---
bool result




")

(setf (get grasp_demo::GripperMoveResponse :md5sum-) "bfc68b580573d62fc32a37a0f2f5f368")
(setf (get grasp_demo::GripperMoveResponse :datatype-) "grasp_demo/GripperMoveResponse")
(setf (get grasp_demo::GripperMoveResponse :definition-)
      "float64 pulse
---
bool result




")



(provide :grasp_demo/GripperMove "bfc68b580573d62fc32a37a0f2f5f368")


