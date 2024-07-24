; Auto-generated. Do not edit!


(cl:in-package grasp_demo-srv)


;//! \htmlinclude SpawnObj-request.msg.html

(cl:defclass <SpawnObj-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SpawnObj-request (<SpawnObj-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpawnObj-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpawnObj-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<SpawnObj-request> is deprecated: use grasp_demo-srv:SpawnObj-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <SpawnObj-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:type-val is deprecated.  Use grasp_demo-srv:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpawnObj-request>) ostream)
  "Serializes a message object of type '<SpawnObj-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpawnObj-request>) istream)
  "Deserializes a message object of type '<SpawnObj-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'type)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpawnObj-request>)))
  "Returns string type for a service object of type '<SpawnObj-request>"
  "grasp_demo/SpawnObjRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObj-request)))
  "Returns string type for a service object of type 'SpawnObj-request"
  "grasp_demo/SpawnObjRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpawnObj-request>)))
  "Returns md5sum for a message object of type '<SpawnObj-request>"
  "3f39d970b40bc0b36aa2136e89b31962")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpawnObj-request)))
  "Returns md5sum for a message object of type 'SpawnObj-request"
  "3f39d970b40bc0b36aa2136e89b31962")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpawnObj-request>)))
  "Returns full string definition for message of type '<SpawnObj-request>"
  (cl:format cl:nil "uint8 type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpawnObj-request)))
  "Returns full string definition for message of type 'SpawnObj-request"
  (cl:format cl:nil "uint8 type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpawnObj-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpawnObj-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SpawnObj-request
    (cl:cons ':type (type msg))
))
;//! \htmlinclude SpawnObj-response.msg.html

(cl:defclass <SpawnObj-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SpawnObj-response (<SpawnObj-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SpawnObj-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SpawnObj-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name grasp_demo-srv:<SpawnObj-response> is deprecated: use grasp_demo-srv:SpawnObj-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <SpawnObj-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader grasp_demo-srv:result-val is deprecated.  Use grasp_demo-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SpawnObj-response>) ostream)
  "Serializes a message object of type '<SpawnObj-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SpawnObj-response>) istream)
  "Deserializes a message object of type '<SpawnObj-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SpawnObj-response>)))
  "Returns string type for a service object of type '<SpawnObj-response>"
  "grasp_demo/SpawnObjResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObj-response)))
  "Returns string type for a service object of type 'SpawnObj-response"
  "grasp_demo/SpawnObjResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SpawnObj-response>)))
  "Returns md5sum for a message object of type '<SpawnObj-response>"
  "3f39d970b40bc0b36aa2136e89b31962")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SpawnObj-response)))
  "Returns md5sum for a message object of type 'SpawnObj-response"
  "3f39d970b40bc0b36aa2136e89b31962")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SpawnObj-response>)))
  "Returns full string definition for message of type '<SpawnObj-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SpawnObj-response)))
  "Returns full string definition for message of type 'SpawnObj-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SpawnObj-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SpawnObj-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SpawnObj-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SpawnObj)))
  'SpawnObj-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SpawnObj)))
  'SpawnObj-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SpawnObj)))
  "Returns string type for a service object of type '<SpawnObj>"
  "grasp_demo/SpawnObj")