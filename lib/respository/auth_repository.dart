import 'package:food_delivery_prototype_app_ui_kit/data/network/BaseApiServices.dart';
import 'package:food_delivery_prototype_app_ui_kit/data/network/NetworkApiService.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:food_delivery_prototype_app_ui_kit/res/app_url.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiService();
  

  Future<ResponseOnApp> loginApi(dynamic data) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data,"");
      return response;
    }catch(e){
      throw e;
    }
  }

   Future<ResponseOnApp> registerApi(dynamic data) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.registerEndPoint, data,"");
      return response;
    }catch(e){
      throw e;
    }
  }

   Future<ResponseOnApp> verifyApi(dynamic data,String token) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.verifyEndPoint, data,token);
      return response;
    }catch(e){
      throw e;
    }
  }

   Future<ResponseOnApp> resendCodeApi(dynamic data,String token) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.resendCodeEndPoint, data,token);
      return response;
    }catch(e){
      throw e;
    }
  }

   Future<ResponseOnApp> changePasswordApi(dynamic data,String token) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.changePasswordEndPoint, data,token);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<ResponseOnApp> updateProfileApi(dynamic data,String token) async{
    
    try{
      ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.updateProfileEndPoint, data,token);
      return response;
    }catch(e){
      throw e;
    }
  }
}

