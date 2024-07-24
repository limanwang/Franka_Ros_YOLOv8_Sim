// Generated by gencpp from file grasp_demo/SpawnObj.msg
// DO NOT EDIT!


#ifndef GRASP_DEMO_MESSAGE_SPAWNOBJ_H
#define GRASP_DEMO_MESSAGE_SPAWNOBJ_H

#include <ros/service_traits.h>


#include <grasp_demo/SpawnObjRequest.h>
#include <grasp_demo/SpawnObjResponse.h>


namespace grasp_demo
{

struct SpawnObj
{

typedef SpawnObjRequest Request;
typedef SpawnObjResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SpawnObj
} // namespace grasp_demo


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::grasp_demo::SpawnObj > {
  static const char* value()
  {
    return "3f39d970b40bc0b36aa2136e89b31962";
  }

  static const char* value(const ::grasp_demo::SpawnObj&) { return value(); }
};

template<>
struct DataType< ::grasp_demo::SpawnObj > {
  static const char* value()
  {
    return "grasp_demo/SpawnObj";
  }

  static const char* value(const ::grasp_demo::SpawnObj&) { return value(); }
};


// service_traits::MD5Sum< ::grasp_demo::SpawnObjRequest> should match
// service_traits::MD5Sum< ::grasp_demo::SpawnObj >
template<>
struct MD5Sum< ::grasp_demo::SpawnObjRequest>
{
  static const char* value()
  {
    return MD5Sum< ::grasp_demo::SpawnObj >::value();
  }
  static const char* value(const ::grasp_demo::SpawnObjRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::grasp_demo::SpawnObjRequest> should match
// service_traits::DataType< ::grasp_demo::SpawnObj >
template<>
struct DataType< ::grasp_demo::SpawnObjRequest>
{
  static const char* value()
  {
    return DataType< ::grasp_demo::SpawnObj >::value();
  }
  static const char* value(const ::grasp_demo::SpawnObjRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::grasp_demo::SpawnObjResponse> should match
// service_traits::MD5Sum< ::grasp_demo::SpawnObj >
template<>
struct MD5Sum< ::grasp_demo::SpawnObjResponse>
{
  static const char* value()
  {
    return MD5Sum< ::grasp_demo::SpawnObj >::value();
  }
  static const char* value(const ::grasp_demo::SpawnObjResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::grasp_demo::SpawnObjResponse> should match
// service_traits::DataType< ::grasp_demo::SpawnObj >
template<>
struct DataType< ::grasp_demo::SpawnObjResponse>
{
  static const char* value()
  {
    return DataType< ::grasp_demo::SpawnObj >::value();
  }
  static const char* value(const ::grasp_demo::SpawnObjResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // GRASP_DEMO_MESSAGE_SPAWNOBJ_H