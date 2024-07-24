; Auto-generated. Do not edit!


(cl:in-package grasp_demo-srv)


;//! \htmlinclude GripperMove-request.msg.html

(cl:defclass <GripperMove-request> (roslisp-msg-protocol:ros-message)
  ((pulse
    :reader pulse
    :initarg :pulse
    :type cl:float
    :initform 0.0))
)

(cl:defclass GripperMove-request (<GripperMove-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperMove-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperMove-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<GripperMove-request> is deprecated: use grasp_demo-srv:GripperMove-request instead.")))

(cl:ensure-generic-function 'pulse-val :lambda-list '(m))
(cl:defmethod pulse-val ((m <GripperMove-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:pulse-val is deprecated.  Use grasp_demo-srv:pulse instead.")
  (pulse m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperMove-request>) ostream)
  "Serializes a message object of type '<GripperMove-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'pulse))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperMove-request>) istream)
  "Deserializes a message object of type '<GripperMove-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pulse) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperMove-request>)))
  "Returns string type for a service object of type '<GripperMove-request>"
  "grasp_demo/GripperMoveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperMove-request)))
  "Returns string type for a service object of type 'GripperMove-request"
  "grasp_demo/GripperMoveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperMove-request>)))
  "Returns md5sum for a message object of type '<GripperMove-request>"
  "bfc68b580573d62fc32a37a0f2f5f368")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperMove-request)))
  "Returns md5sum for a message object of type 'GripperMove-request"
  "bfc68b580573d62fc32a37a0f2f5f368")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperMove-request>)))
  "Returns full string definition for message of type '<GripperMove-request>"
  (cl:format cl:nil "float64 pulse~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperMove-request)))
  "Returns full string definition for message of type 'GripperMove-request"
  (cl:format cl:nil "float64 pulse~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperMove-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperMove-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperMove-request
    (cl:cons ':pulse (pulse msg))
))
;//! \htmlinclude GripperMove-response.msg.html

(cl:defclass <GripperMove-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GripperMove-response (<GripperMove-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GripperMove-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GripperMove-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<GripperMove-response> is deprecated: use grasp_demo-srv:GripperMove-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <GripperMove-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:result-val is deprecated.  Use grasp_demo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GripperMove-response>) ostream)
  "Serializes a message object of type '<GripperMove-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GripperMove-response>) istream)
  "Deserializes a message object of type '<GripperMove-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GripperMove-response>)))
  "Returns string type for a service object of type '<GripperMove-response>"
  "grasp_demo/GripperMoveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperMove-response)))
  "Returns string type for a service object of type 'GripperMove-response"
  "grasp_demo/GripperMoveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GripperMove-response>)))
  "Returns md5sum for a message object of type '<GripperMove-response>"
  "bfc68b580573d62fc32a37a0f2f5f368")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GripperMove-response)))
  "Returns md5sum for a message object of type 'GripperMove-response"
  "bfc68b580573d62fc32a37a0f2f5f368")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GripperMove-response>)))
  "Returns full string definition for message of type '<GripperMove-response>"
  (cl:format cl:nil "bool result~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GripperMove-response)))
  "Returns full string definition for message of type 'GripperMove-response"
  (cl:format cl:nil "bool result~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GripperMove-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GripperMove-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GripperMove-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GripperMove)))
  'GripperMove-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GripperMove)))
  'GripperMove-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GripperMove)))
  "Returns string type for a service object of type '<GripperMove>"
  "grasp_demo/GripperMove")