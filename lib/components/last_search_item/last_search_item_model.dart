import '/components/button_order_status/button_order_status_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'last_search_item_widget.dart' show LastSearchItemWidget;
import 'package:flutter/material.dart';

class LastSearchModel extends FlutterFlowModel<LastSearchItemWidget> {
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
