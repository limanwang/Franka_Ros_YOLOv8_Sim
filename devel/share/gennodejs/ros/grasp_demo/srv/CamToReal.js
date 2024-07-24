// Auto-generated. Do not edit!

// (in-package grasp_demo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class CamToRealRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pixel_x = null;
      this.pixel_y = null;
    }
    else {
      if (initObj.hasOwnProperty('pixel_x')) {
        this.pixel_x = initObj.pixel_x
      }
      else {
        this.pixel_x = 0.0;
      }
      if (initObj.hasOwnProperty('pixel_y')) {
        this.pixel_y = initObj.pixel_y
      }
      else {
        this.pixel_y = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CamToRealRequest
    // Serialize message field [pixel_x]
    bufferOffset = _serializer.float64(obj.pixel_x, buffer, bufferOffset);
    // Serialize message field [pixel_y]
    bufferOffset = _serializer.float64(obj.pixel_y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CamToRealRequest
    let len;
    let data = new CamToRealRequest(null);
    // Deserialize message field [pixel_x]
    data.pixel_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pixel_y]
    data.pixel_y = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/CamToRealRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0f1ded65a8e7c18f92cd2452807e658e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 pixel_x
    float64 pixel_y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CamToRealRequest(null);
    if (msg.pixel_x !== undefined) {
      resolved.pixel_x = msg.pixel_x;
    }
    else {
      resolved.pixel_x = 0.0
    }

    if (msg.pixel_y !== undefined) {
      resolved.pixel_y = msg.pixel_y;
    }
    else {
      resolved.pixel_y = 0.0
    }

    return resolved;
    }
};

class CamToRealResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.obj_x = null;
      this.obj_y = null;
      this.obj_z = null;
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('obj_x')) {
        this.obj_x = initObj.obj_x
      }
      else {
        this.obj_x = 0.0;
      }
      if (initObj.hasOwnProperty('obj_y')) {
        this.obj_y = initObj.obj_y
      }
      else {
        this.obj_y = 0.0;
      }
      if (initObj.hasOwnProperty('obj_z')) {
        this.obj_z = initObj.obj_z
      }
      else {
        this.obj_z = 0.0;
      }
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CamToRealResponse
    // Serialize message field [obj_x]
    bufferOffset = _serializer.float64(obj.obj_x, buffer, bufferOffset);
    // Serialize message field [obj_y]
    bufferOffset = _serializer.float64(obj.obj_y, buffer, bufferOffset);
    // Serialize message field [obj_z]
    bufferOffset = _serializer.float64(obj.obj_z, buffer, bufferOffset);
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CamToRealResponse
    let len;
    let data = new CamToRealResponse(null);
    // Deserialize message field [obj_x]
    data.obj_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_y]
    data.obj_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [obj_z]
    data.obj_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 25;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/CamToRealResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f8a34a4411ad0412a5ef662d2317a130';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 obj_x
    float64 obj_y
    float64 obj_z
    bool result
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CamToRealResponse(null);
    if (msg.obj_x !== undefined) {
      resolved.obj_x = msg.obj_x;
    }
    else {
      resolved.obj_x = 0.0
    }

    if (msg.obj_y !== undefined) {
      resolved.obj_y = msg.obj_y;
    }
    else {
      resolved.obj_y = 0.0
    }

    if (msg.obj_z !== undefined) {
      resolved.obj_z = msg.obj_z;
    }
    else {
      resolved.obj_z = 0.0
    }

    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: CamToRealRequest,
  Response: CamToRealResponse,
  md5sum() { return '189ac79be7b27a6947e618b03843336a'; },
  datatype() { return 'grasp_demo/CamToReal'; }
};
