;; Auto-generated. Do not edit!


(when (boundp 'grasp_demo::SpawnObj)
  (if (not (find-package "GRASP_DEMO"))
    (make-package "GRASP_DEMO"))
  (shadow 'SpawnObj (find-package "GRASP_DEMO")))
(unless (find-package "GRASP_DEMO::SPAWNOBJ")
  (make-package "GRASP_DEMO::SPAWNOBJ"))
(unless (find-package "GRASP_DEMO::SPAWNOBJREQUEST")
  (make-package "GRASP_DEMO::SPAWNOBJREQUEST"))
(unless (find-package "GRASP_DEMO::SPAWNOBJRESPONSE")
  (make-package "GRASP_DEMO::SPAWNOBJRESPONSE"))

(in-package "ROS")





(defclass grasp_demo::SpawnObjRequest
  :super ros::object
  :slots (_type ))

(defmethod grasp_demo::SpawnObjRequest
  (:init
   (&key
    ((:type __type) 0)
    )
   (send-super :init)
   (setq _type (round __type))
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:serialization-length
   ()
   (+
    ;; uint8 _type
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _type
       (write-byte _type s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass grasp_demo::SpawnObjResponse
  :super ros::object
  :slots (_result ))

(defmethod grasp_demo::SpawnObjResponse
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

(defclass grasp_demo::SpawnObj
  :super ros::object
  :slots ())

(setf (get grasp_demo::SpawnObj :md5sum-) "3f39d970b40bc0b36aa2136e89b31962")
(setf (get grasp_demo::SpawnObj :datatype-) "grasp_demo/SpawnObj")
(setf (get grasp_demo::SpawnObj :request) grasp_demo::SpawnObjRequest)
(setf (get grasp_demo::SpawnObj :response) grasp_demo::SpawnObjResponse)

(defmethod grasp_demo::SpawnObjRequest
  (:response () (instance grasp_demo::SpawnObjResponse :init)))

(setf (get grasp_demo::SpawnObjRequest :md5sum-) "3f39d970b40bc0b36aa2136e89b31962")
(setf (get grasp_demo::SpawnObjRequest :datatype-) "grasp_demo/SpawnObjRequest")
(setf (get grasp_demo::SpawnObjRequest :definition-)
      "uint8 type
---
bool result

")

(setf (get grasp_demo::SpawnObjResponse :md5sum-) "3f39d970b40bc0b36aa2136e89b31962")
(setf (get grasp_demo::SpawnObjResponse :datatype-) "grasp_demo/SpawnObjResponse")
(setf (get grasp_demo::SpawnObjResponse :definition-)
      "uint8 type
---
bool result

")



(provide :grasp_demo/SpawnObj "3f39d970b40bc0b36aa2136e89b31962")


