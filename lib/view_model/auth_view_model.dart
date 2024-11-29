import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_prototype_app_ui_kit/components/add_extra_item/add_extra_item_model.dart';
import 'package:food_delivery_prototype_app_ui_kit/flutter_flow/flutter_flow_util.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/user.dart';
import 'package:food_delivery_prototype_app_ui_kit/pages/verification/verification_widget.dart';
import 'package:food_delivery_prototype_app_ui_kit/respository/auth_repository.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';
import 'package:food_delivery_prototype_app_ui_kit/view/services/user_services.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();
  late ResponseOnApp responseApp;
  final UserServices userService = UserServices();
  
  Future<void> loginApi(dynamic data,BuildContext context) async{
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarSuccessMessage(value.message.toString(), context);
      Future.delayed(Duration(seconds: 3), (){        
        if(value.errCode == ErrType.MustbeVerified){
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VerificationWidget(user: User.fromJson(value.data),
              ),
            ));
        }else{
          print(value.data);
            userService.saveUser(context, User.fromJson(value.data));
            context.pushNamed("Home");
        }
      
      });
      
    }).onError((error,StackTrace){
      responseApp = (error as ResponseOnApp);
      Utils.flushBarErrorMessage((error as ResponseOnApp).message.toString(), context);
    });
  }

  Future<void> registerApi(dynamic data,BuildContext context) async{
      _myRepo.registerApi(data).then((value){
        Utils.flushBarSuccessMessage(value.message.toString(), context);
        Future.delayed(Duration(seconds: 3),(){
         if(value.errCode == ErrType.NoError){
            context.pushNamed("LoginAccount");
         }
        });
       
      }).onError((error,StackTrace){
        responseApp = error as ResponseOnApp;
        Utils.flushBarErrorMessage(responseApp.message.toString(), context);
      });
  }

    Future<void> verifyApi(dynamic data,BuildContext context,String token) async{

      
      _myRepo.verifyApi(data,token).then((value){
        Utils.flushBarSuccessMessage(value.message.toString(), context);
        
        Future.delayed(Duration(seconds: 3),(){
         if(value.errCode == ErrType.NoError){
            userService.saveUser(context, User.fromJson(value.data));
            context.pushNamed("Home");
         }
        
        });
       
      }).onError((error,StackTrace){
        responseApp = error as ResponseOnApp;
        Utils.flushBarErrorMessage(responseApp.message.toString(), context);
      });
  }

  Future<void> resendCodeApi(dynamic data,BuildContext context,String token) async {
    _myRepo.resendCodeApi(data,token).then((value){
        Utils.flushBarSuccessMessage(value.message.toString(), context);
    }).onError((error,StackTrace){
        responseApp = error as ResponseOnApp;
        Utils.flushBarErrorMessage(responseApp.message.toString(), context);
    });
  }

  
  Future<void> changePasswordApi(dynamic data,BuildContext context,String token) async {
    _myRepo.changePasswordApi(data,token).then((value){
        Utils.flushBarSuccessMessage(value.message.toString(), context);  
       }).onError((error,StackTrace){
        Utils.flushBarErrorMessage((error as ResponseOnApp).message.toString(), context);
    });
  }

   Future<bool> updateProfileApi(dynamic data,BuildContext context,String token) async {
      _myRepo.updateProfileApi(data,token).then((value){
        Utils.flushBarSuccessMessage(value.message.toString(), context);     
        return true;    
       }).onError((error,StackTrace){
        Utils.flushBarErrorMessage((error as ResponseOnApp).message.toString(), context);
        return false;
    });
    return true;
  }
}