// Generated by gencpp from file grasp_demo/GripperMoveResponse.msg
// DO NOT EDIT!


#ifndef GRASP_DEMO_MESSAGE_GRIPPERMOVERESPONSE_H
#define GRASP_DEMO_MESSAGE_GRIPPERMOVERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace grasp_demo
{
template <class ContainerAllocator>
struct GripperMoveResponse_
{
  typedef GripperMoveResponse_<ContainerAllocator> Type;

  GripperMoveResponse_()
    : result(false)  {
    }
  GripperMoveResponse_(const ContainerAllocator& _alloc)
    : result(false)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GripperMoveResponse_

typedef ::grasp_demo::GripperMoveResponse_<std::allocator<void> > GripperMoveResponse;

typedef boost::shared_ptr< ::grasp_demo::GripperMoveResponse > GripperMoveResponsePtr;
typedef boost::shared_ptr< ::grasp_demo::GripperMoveResponse const> GripperMoveResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::grasp_demo::GripperMoveResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::grasp_demo::GripperMoveResponse_<ContainerAllocator1> & lhs, const ::grasp_demo::GripperMoveResponse_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::grasp_demo::GripperMoveResponse_<ContainerAllocator1> & lhs, const ::grasp_demo::GripperMoveResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace grasp_demo

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::grasp_demo::GripperMoveResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeb13ac1f1354ccecULL;
  static const uint64_t static_value2 = 0xb7941ee8fa2192e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "grasp_demo/GripperMoveResponse";
  }

  static const char* value(const ::grasp_demo::GripperMoveResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool result\n"
"\n"
"\n"
"\n"
"\n"
;
  }

  static const char* value(const ::grasp_demo::GripperMoveResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GripperMoveResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::grasp_demo::GripperMoveResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::grasp_demo::GripperMoveResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GRASP_DEMO_MESSAGE_GRIPPERMOVERESPONSE_H
