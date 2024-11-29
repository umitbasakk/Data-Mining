import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'button_order_status_model.dart';
export 'button_order_status_model.dart';

class ButtonOrderStatusWidget extends StatefulWidget {
  ButtonOrderStatusWidget({super.key,required this.status});
  int status;
  @override
  State<ButtonOrderStatusWidget> createState() =>
      _ButtonOrderStatusWidgetState();
}

class _ButtonOrderStatusWidgetState extends State<ButtonOrderStatusWidget> {
  late ButtonOrderStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonOrderStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
      },
      text: widget.status == 0  ? "Fail" : "Success",
      options: FFButtonOptions(
        height: 24.0,
        padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: Colors.white,
        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: 'Plus Jakarta Sans',
              color:  widget.status == 0  ? Colors.red : Colors.green,
              letterSpacing: 0.0,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color:  widget.status == 0  ? Colors.red : Colors.green,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(6.0),
      ),
    );
  }
}
