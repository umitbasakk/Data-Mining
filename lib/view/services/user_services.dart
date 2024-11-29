import 'package:flutter/material.dart';
import 'package:food_delivery_prototype_app_ui_kit/flutter_flow/flutter_flow_util.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/user.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/auth_view_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/view_model/user_view_model.dart';

class UserServices with ChangeNotifier {

  Future<User> getUserData(AppStateNotifier appStateNotifier) => UserViewModel().getUser();
  Future<bool> saveUserData(BuildContext context,User user) => UserViewModel().saveUser(user);
  Future<bool> Logout() => UserViewModel().Logout();


  void checkAuthentication (AppStateNotifier appStateNotifier) async{
    getUserData(appStateNotifier).then((value){
      if(value.token == 'null' || value.token == '' || value.token == null){
          
      }else {
          appStateNotifier.RouteInitializeScreen(true);
      }
    }).onError((error, stackTrace){
        print(error);
    });
  }

   Future<bool> saveUser (BuildContext context,User user) async{
    saveUserData(context,user).then((value){
        return true;
    }).onError((error, stackTrace){
        return false;
    });
    return true;
  }

   Future<bool> removeUserData () async{
    Logout().then((value){
        return true;
    }).onError((error, stackTrace){
        return false;
    });
    return true;
  }

}