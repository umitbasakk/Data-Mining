import 'dart:convert';
import 'dart:io';

import 'package:food_delivery_prototype_app_ui_kit/data/app_Excaptions.dart';
import 'package:food_delivery_prototype_app_ui_kit/data/network/BaseApiServices.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class NetworkApiService extends BaseApiServices{
  @override
  Future getGetApiResponse(String url,String token) async {
    dynamic responseJson;
    try{
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer "+ token,
        }
        ).timeout(Duration(seconds: 10));
      responseJson =  returnResponse(response);
    }on SocketException{
      print("get'de sorun var");
      throw ResponseOnApp(message: "Have a problem.",errCode: ErrType.ErrorLoginSystem);
    }

    return responseJson;
  }

  @override
  Future<ResponseOnApp> getPostApiResponse(String url,dynamic data,String token) async{
    
    ResponseOnApp responseJson;
    try{
      Response response = await post(
        Uri.parse(url),
        body: data,
        headers: {
          "Authorization": "Bearer "+token,
        }
      ).timeout(Duration(seconds: 10));
      responseJson =  returnResponse(response);
      
    }catch (e){
      throw e;
    }
    return responseJson;
  }

   @override
  Future<ResponseOnApp> getPostFormApiResponse(String url,File file,String token) async{
    
    ResponseOnApp responseJson;
    try{
      MultipartRequest request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers['Authorization'] = "Bearer $token" // Bearer Token
        ..files.add(await http.MultipartFile.fromPath(
          'image', // Backend'deki dosya form alanı adı
          file!.path,
        ));
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      responseJson =  returnResponse(response);
      
    }catch (e){
      throw e;
    }
    return responseJson;
  }



  ResponseOnApp returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        ResponseOnApp responseJson = ResponseOnApp.fromJson(json.decode(response.body.toString()));
        return responseJson;
      case 400:
        ResponseOnApp responseJson = ResponseOnApp.fromJson(json.decode(response.body.toString()));
        throw responseJson;    
      case 401:
        ResponseOnApp responseJson = ResponseOnApp.fromJson(json.decode(response.body.toString()));
        throw responseJson;    
      case 500:
        ResponseOnApp responseJson = ResponseOnApp.fromJson(json.decode(response.body.toString()));
        throw responseJson;
      case 404:
        ResponseOnApp responseJson = ResponseOnApp.fromJson(json.decode(response.body.toString()));
        throw responseJson;
      default:
        throw FetchDataException("Error accured while communicating with server"+ "with status code"+ response.statusCode.toString());
    }
  }
  
 

}