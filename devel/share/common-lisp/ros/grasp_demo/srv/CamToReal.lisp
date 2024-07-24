; Auto-generated. Do not edit!


(cl:in-package grasp_demo-srv)


;//! \htmlinclude CamToReal-request.msg.html

(cl:defclass <CamToReal-request> (roslisp-msg-protocol:ros-message)
  ((pixel_x
    :reader pixel_x
    :initarg :pixel_x
    :type cl:float
    :initform 0.0)
   (pixel_y
    :reader pixel_y
    :initarg :pixel_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass CamToReal-request (<CamToReal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CamToReal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CamToReal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<CamToReal-request> is deprecated: use grasp_demo-srv:CamToReal-request instead.")))

(cl:ensure-generic-function 'pixel_x-val :lambda-list '(m))
(cl:defmethod pixel_x-val ((m <CamToReal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:pixel_x-val is deprecated.  Use grasp_demo-srv:pixel_x instead.")
  (pixel_x m))

(cl:ensure-generic-function 'pixel_y-val :lambda-list '(m))
(cl:defmethod pixel_y-val ((m <CamToReal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:pixel_y-val is deprecated.  Use grasp_demo-srv:pixel_y instead.")
  (pixel_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CamToReal-request>) ostream)
  "Serializes a message object of type '<CamToReal-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pixel_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pixel_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CamToReal-request>) istream)
  "Deserializes a message object of type '<CamToReal-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pixel_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pixel_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CamToReal-request>)))
  "Returns string type for a service object of type '<CamToReal-request>"
  "grasp_demo/CamToRealRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CamToReal-request)))
  "Returns string type for a service object of type 'CamToReal-request"
  "grasp_demo/CamToRealRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CamToReal-request>)))
  "Returns md5sum for a message object of type '<CamToReal-request>"
  "189ac79be7b27a6947e618b03843336a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CamToReal-request)))
  "Returns md5sum for a message object of type 'CamToReal-request"
  "189ac79be7b27a6947e618b03843336a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CamToReal-request>)))
  "Returns full string definition for message of type '<CamToReal-request>"
  (cl:format cl:nil "float64 pixel_x~%float64 pixel_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CamToReal-request)))
  "Returns full string definition for message of type 'CamToReal-request"
  (cl:format cl:nil "float64 pixel_x~%float64 pixel_y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CamToReal-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CamToReal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CamToReal-request
    (cl:cons ':pixel_x (pixel_x msg))
    (cl:cons ':pixel_y (pixel_y msg))
))
;//! \htmlinclude CamToReal-response.msg.html

(cl:defclass <CamToReal-response> (roslisp-msg-protocol:ros-message)
  ((obj_x
    :reader obj_x
    :initarg :obj_x
    :type cl:float
    :initform 0.0)
   (obj_y
    :reader obj_y
    :initarg :obj_y
    :type cl:float
    :initform 0.0)
   (obj_z
    :reader obj_z
    :initarg :obj_z
    :type cl:float
    :initform 0.0)
   (result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CamToReal-response (<CamToReal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CamToReal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CamToReal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<CamToReal-response> is deprecated: use grasp_demo-srv:CamToReal-response instead.")))

(cl:ensure-generic-function 'obj_x-val :lambda-list '(m))
(cl:defmethod obj_x-val ((m <CamToReal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_x-val is deprecated.  Use grasp_demo-srv:obj_x instead.")
  (obj_x m))

(cl:ensure-generic-function 'obj_y-val :lambda-list '(m))
(cl:defmethod obj_y-val ((m <CamToReal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_y-val is deprecated.  Use grasp_demo-srv:obj_y instead.")
  (obj_y m))

(cl:ensure-generic-function 'obj_z-val :lambda-list '(m))
(cl:defmethod obj_z-val ((m <CamToReal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:obj_z-val is deprecated.  Use grasp_demo-srv:obj_z instead.")
  (obj_z m))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <CamToReal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:result-val is deprecated.  Use grasp_demo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CamToReal-response>) ostream)
  "Serializes a message object of type '<CamToReal-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'obj_z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CamToReal-response>) istream)
  "Deserializes a message object of type '<CamToReal-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obj_z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CamToReal-response>)))
  "Returns string type for a service object of type '<CamToReal-response>"
  "grasp_demo/CamToRealResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CamToReal-response)))
  "Returns string type for a service object of type 'CamToReal-response"
  "grasp_demo/CamToRealResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CamToReal-response>)))
  "Returns md5sum for a message object of type '<CamToReal-response>"
  "189ac79be7b27a6947e618b03843336a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CamToReal-response)))
  "Returns md5sum for a message object of type 'CamToReal-response"
  "189ac79be7b27a6947e618b03843336a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CamToReal-response>)))
  "Returns full string definition for message of type '<CamToReal-response>"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%bool result~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CamToReal-response)))
  "Returns full string definition for message of type 'CamToReal-response"
  (cl:format cl:nil "float64 obj_x~%float64 obj_y~%float64 obj_z~%bool result~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CamToReal-response>))
  (cl:+ 0
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CamToReal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CamToReal-response
    (cl:cons ':obj_x (obj_x msg))
    (cl:cons ':obj_y (obj_y msg))
    (cl:cons ':obj_z (obj_z msg))
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CamToReal)))
  'CamToReal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CamToReal)))
  'CamToReal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CamToReal)))
  "Returns string type for a service object of type '<CamToReal>"
  "grasp_demo/CamToReal")