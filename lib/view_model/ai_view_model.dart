

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AIData.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AiDataResponse.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/FoodItem.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:food_delivery_prototype_app_ui_kit/respository/ai_repository.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';

class AIViewModel  with ChangeNotifier{

  final _aiRepository = AIRepository();

  Future<List<FoodItem>?>? requestApi(File file,BuildContext context,String token) async{
    List<FoodItem> list = [];
    await _aiRepository.getPostFormApi(file, token).then((value){
      Utils.flushBarSuccessMessage(value.message.toString(), context);
      (value.data as List<dynamic>).forEach((value){
        list.add(FoodItem.fromJson(value));
      });
    }).onError((error,StackTrace){
      Utils.flushBarErrorMessage((error as ResponseOnApp).message.toString(), context);
    });
  return list;
  }

  Future<List<AiDataResponse>> getAllRequestOfUserApi(BuildContext context,String token) async{
    late List<AiDataResponse> dataList = [];
    final value = await _aiRepository.getAllRequestOfUserApi(token);

    if(value.errCode == ErrType.NoError){
      (value.data as List<dynamic>).forEach((value) {
        dataList.add(AiDataResponse.fromJson(value));
      });
    }
    return dataList;
  } 

}