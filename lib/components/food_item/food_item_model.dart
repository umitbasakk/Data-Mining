import '/components/button_order_status/button_order_status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'food_item_widget.dart' show FoodItemWidget;
import 'package:flutter/material.dart';

class FoodItemModel extends FlutterFlowModel<FoodItemWidget> {
  late ButtonOrderStatusModel buttonOrderStatusModel;

  @override
  void initState(BuildContext context) {
    buttonOrderStatusModel =
        createModel(context, () => ButtonOrderStatusModel());
  }

  @override
  void dispose() {
    buttonOrderStatusModel.dispose();
  }
}
