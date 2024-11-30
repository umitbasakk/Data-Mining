import 'dart:io';

import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';

abstract class BaseApiServices{
  Future<dynamic> getGetApiResponse(String url,String token);
  Future<ResponseOnApp> getPostApiResponse(String url,dynamic data,String token);
  Future<ResponseOnApp> getPostFormApiResponse(String url,File file,String token);
}