

import 'dart:convert';

import 'package:food_delivery_prototype_app_ui_kit/data/network/BaseApiServices.dart';
import 'package:food_delivery_prototype_app_ui_kit/data/network/NetworkApiService.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:food_delivery_prototype_app_ui_kit/res/app_url.dart';

class AIRepository{
    BaseApiServices _apiServices = NetworkApiService();


    Future<ResponseOnApp> requestApi(dynamic data,String token) async{
      try{
        ResponseOnApp response = await _apiServices.getPostApiResponse(AppUrl.requestAIEndPoint, data, token);
        return response;
      }catch(e){
        throw(e);
      }
    }
     Future<ResponseOnApp> getAllRequestOfUserApi(String token) async{
      try{
        ResponseOnApp response = await _apiServices.getGetApiResponse(AppUrl.getAllRequestOfUserEndPoint, token);
        return response;
      }catch(e){
        throw(e);
      }
    }

    
}