

import 'package:flutter/material.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AIData.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/AiDataResponse.dart';
import 'package:food_delivery_prototype_app_ui_kit/model/response.dart';
import 'package:food_delivery_prototype_app_ui_kit/respository/ai_repository.dart';
import 'package:food_delivery_prototype_app_ui_kit/utils/utils.dart';

class AIViewModel  with ChangeNotifier{

  final _aiRepository = AIRepository();

  Future<void> requestApi(dynamic data,BuildContext context,String token) async{
    _aiRepository.requestApi(data, token).then((value){
      Utils.flushBarSuccessMessage(value.message.toString(), context);
    }).onError((error,StackTrace){
      Utils.flushBarErrorMessage((error as ResponseOnApp).message.toString(), context);
    });
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