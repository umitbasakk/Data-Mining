import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'line_separator_with_text_model.dart';
export 'line_separator_with_text_model.dart';

class LineSeparatorWithTextWidget extends StatefulWidget {
  const LineSeparatorWithTextWidget({
    super.key,
    this.text,
  });

  final String? text;

  @override
  State<LineSeparatorWithTextWidget> createState() =>
      _LineSeparatorWithTextWidgetState();
}

class _LineSeparatorWithTextWidgetState
    extends State<LineSeparatorWithTextWidget> {
  late LineSeparatorWithTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LineSeparatorWithTextModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).grey3,
            ),
          ),
        ),
        if (widget.text != null && widget.text != '')
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
            child: Text(
              widget.text!,
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Plus Jakarta Sans',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        Expanded(
          child: Container(
            height: 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).grey3,
            ),
          ),
        ),
      ],
    );
  }
}
