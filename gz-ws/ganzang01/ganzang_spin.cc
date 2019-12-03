#define M_PI 3.14159
#include <boost/bind.hpp>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <stdio.h>

namespace gazebo
{
 class GanzangSpin : public ModelPlugin
 {
  public: void init(){}
  public: void reset(){}
  public: void Load(physics::ModelPtr _parent, sdf::ElementPtr)
  {
   this->model = _parent;//# sdf와 plugin 이 연결
   joint1 = this->model->GetJoint("joint1");
   this->updateConnection = event::Events::ConnectWorldUpdateBegin(
    boost::bind(&GanzangSpin::OnUpdate, this, _1));
   this->joint1_controller = new physics::JointController(model);
   direction = 1;
   time = 0;

  std::cout << "test" << std::endl;
  }

  public: void OnUpdate(const common::UpdateInfo &)
  {
   time += 1;
   if(time >= 1000){
    time = 0;
    if(direction == 1){
     direction = -1;
     angle = 1.0;
    }
    else{
     direction = 1;
     angle = -1.0;
    }
    joint1_controller->SetJointPosition(joint1, angle);
   std::cout << "test" << std::endl;
   }
  }
  private: physics::ModelPtr model;
  private: physics::JointPtr joint1;
  private: physics::JointController * joint1_controller;
  private: event::ConnectionPtr updateConnection;
  private: int time;
  private: int direction;
  private: double angle;
 };
  GZ_REGISTER_MODEL_PLUGIN(GanzangSpin)
}
