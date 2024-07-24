
(cl:in-package :asdf)

(defsystem "grasp_demo-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "CamToReal" :depends-on ("_package_CamToReal"))
    (:file "_package_CamToReal" :depends-on ("_package"))
    (:file "GripperMove" :depends-on ("_package_GripperMove"))
    (:file "_package_GripperMove" :depends-on ("_package"))
    (:file "SpawnObj" :depends-on ("_package_SpawnObj"))
    (:file "_package_SpawnObj" :depends-on ("_package"))
  ))