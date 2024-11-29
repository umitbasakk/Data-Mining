import '/components/button_order_status/button_order_status_widget.dart';
import '../../components/last_search_item/last_search_item_widget.dart';
import '/components/navigator_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'last_searches_widget.dart' show LastSearchesWidget;
import 'package:flutter/material.dart';

class MyOrderModel extends FlutterFlowModel<LastSearchesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for MyOrderItem component.
  late LastSearchModel myOrderItemModel1;
  // Model for MyOrderItem component.
  late LastSearchModel myOrderItemModel2;
  // Model for MyOrderItem component.
  late LastSearchModel myOrderItemModel3;
  // Model for ButtonOrderStatus component.
  late ButtonOrderStatusModel buttonOrderStatusModel;
  // Model for MyOrderItem component.
  late LastSearchModel myOrderItemModel4;
  // Model for navigator component.
  late NavigatorModel navigatorModel;

  @override
  void initState(BuildContext context) {
    myOrderItemModel1 = createModel(context, () => LastSearchModel());
    myOrderItemModel2 = createModel(context, () => LastSearchModel());
    myOrderItemModel3 = createModel(context, () => LastSearchModel());
    buttonOrderStatusModel =
        createModel(context, () => ButtonOrderStatusModel());
    myOrderItemModel4 = createModel(context, () => LastSearchModel());
    navigatorModel = createModel(context, () => NavigatorModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    myOrderItemModel1.dispose();
    myOrderItemModel2.dispose();
    myOrderItemModel3.dispose();
    buttonOrderStatusModel.dispose();
    myOrderItemModel4.dispose();
    navigatorModel.dispose();
  }
}
