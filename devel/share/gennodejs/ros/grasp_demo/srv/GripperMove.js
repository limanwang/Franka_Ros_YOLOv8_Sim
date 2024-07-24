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

class GripperMoveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pulse = null;
    }
    else {
      if (initObj.hasOwnProperty('pulse')) {
        this.pulse = initObj.pulse
      }
      else {
        this.pulse = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperMoveRequest
    // Serialize message field [pulse]
    bufferOffset = _serializer.float64(obj.pulse, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperMoveRequest
    let len;
    let data = new GripperMoveRequest(null);
    // Deserialize message field [pulse]
    data.pulse = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/GripperMoveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9bc125a2a5574ebd1d47acd40c278d61';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 pulse
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperMoveRequest(null);
    if (msg.pulse !== undefined) {
      resolved.pulse = msg.pulse;
    }
    else {
      resolved.pulse = 0.0
    }

    return resolved;
    }
};

class GripperMoveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GripperMoveResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GripperMoveResponse
    let len;
    let data = new GripperMoveResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'grasp_demo/GripperMoveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GripperMoveResponse(null);
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
  Request: GripperMoveRequest,
  Response: GripperMoveResponse,
  md5sum() { return 'bfc68b580573d62fc32a37a0f2f5f368'; },
  datatype() { return 'grasp_demo/GripperMove'; }
};
